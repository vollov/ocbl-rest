from rest_framework.authentication import BaseAuthentication
from rest_framework import exceptions
from jose import jwt
from jose.exceptions import JWTError

from app.settings import JWT_SECRET, JWT_SIGN_ALGORITHM,JWT_HEADER
from authentication.models import Account

import logging
log = logging.getLogger(__name__)

class JWTAuthentication(BaseAuthentication):
    """
    authenticate the user via authentication token
    - check token is valid
    - check token is not expired (optional: verify expire is done in decode())
    - lookup and load user 
    """
    keyword = JWT_HEADER
    
    def authenticate(self, request):
        token = request.META.get('HTTP_AUTHORIZATION')
        
        if not token:
            log.error('JWTAuthentication.authenticate() request does not have a token!')
            return None
        else:
            authorization_header = token.split()
            
            if not authorization_header or authorization_header[0].lower() != self.keyword.lower().encode():
                return None
            
            if len(authorization_header) == 1:
                msg = _('Invalid token header. No credentials provided.')
                raise exceptions.AuthenticationFailed(msg)
            elif len(authorization_header) > 2:
                msg = _('Invalid token header. Token string should not contain spaces.')
                raise exceptions.AuthenticationFailed(msg)
            
            jwt_token = authorization_header[1].strip()
            log.debug('JWTAuthentication.authenticate() request got token={0}'.format(jwt_token))
            
        try:
            payload = jwt.decode(jwt_token, JWT_SECRET, algorithms=JWT_SIGN_ALGORITHM)
        except JWTError:
            log.error('JWTAuthentication.authenticate() decode() failed!')
            raise exceptions.AuthenticationFailed('JWT decode error')
            
        
        account = self.authenticate_credentials(payload['user'])
        return (account, None)
    
    def authenticate_credentials(self, user):
        
        try:
            account = Account.objects.get(username=user.get('username'))
        except Account.DoesNotExist:
            msg = _('Invalid signature.')
            raise exceptions.AuthenticationFailed(msg)

        if not account.is_active:
            msg = _('User account is disabled.')
            raise exceptions.AuthenticationFailed(msg)

        return account