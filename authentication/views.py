
from django.contrib.auth import authenticate, login, logout
from rest_framework import permissions, viewsets, status, views
from rest_framework.response import Response
from models import Account
from permissions import IsAccountOwner
from serializers import AccountSerializer
from rest_framework.authentication import SessionAuthentication
import datetime, time
from jose import jwt
from app.settings import JWT_SECRET,JWT_SIGN_ALGORITHM,JWT_EXPIRE_IN_MINUTE

import logging
log = logging.getLogger(__name__)


def generateToken(user):
    
    # get current time, seconds since the epoch are UTC based
    #current_time = timegm(datetime.utcnow().utctimetuple())
    now = datetime.datetime.now()
    token_expire_at = now + datetime.timedelta(minutes = JWT_EXPIRE_IN_MINUTE)
    token_expire_in_seconds = time.mktime(token_expire_at.timetuple())
    
    # The time after which the token is invalid.
    claims = {'exp': token_expire_in_seconds, 'user': user}
    
    token = jwt.encode(claims, JWT_SECRET, algorithm=JWT_SIGN_ALGORITHM)
    return token
    

class AccountViewSet(viewsets.ModelViewSet):
    lookup_field = 'username'
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    authentication_classes = (SessionAuthentication,)
    #JWTAuthentication
    def get_permissions(self):
#         if self.request.method in permissions.SAFE_METHODS:
#             return permissions.AllowAny(),
        if self.request.method == 'POST':
            return permissions.AllowAny(),
        return permissions.IsAuthenticated(), IsAccountOwner()

    def create(self, request):
        serializer = self.serializer_class(data=request.data)

        if serializer.is_valid():
            Account.objects.create_user(**serializer.validated_data)
            return Response(generateToken(serializer.validated_data), status=status.HTTP_201_CREATED)

        return Response({
            'status': 'Bad request',
            'message': 'Account could not be created with received data.'
            }, status=status.HTTP_400_BAD_REQUEST)

class LoginView(views.APIView):

    def post(self, request, format=None):
        data = request.data
        
        log.debug('get login post data = {0}'.format(data))
        
        email = data.get('email', None)
        password = data.get('password', None)
        
        log.debug('get login post with email = {0} and password = {1}'.format(email, password))
        account = authenticate(email=email, password=password)

        # fail, bad login info
        if account is None:
            return Response({
                'status': 'Unauthorized',
                'message': 'email/password combination invalid.'
            }, status=status.HTTP_401_UNAUTHORIZED)

        # fail, inactive account
        if not account.is_active:
            return Response({
                'status': 'Unauthorized',
                'message': 'This account has been disabled.'
            }, status=status.HTTP_401_UNAUTHORIZED)

        # success, login and respond
        login(request, account)
        serialized = AccountSerializer(account)
        return Response(generateToken(serialized.data), status=status.HTTP_200_OK)


class LogoutView(views.APIView):
    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request, format=None):
        logout(request)
        return Response({}, status=status.HTTP_204_NO_CONTENT)
