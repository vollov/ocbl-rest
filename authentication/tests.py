from django.test import TestCase

from rest_framework.test import APIClient
from django.contrib.auth import authenticate
from app.settings import JWT_HEADER

###############################################
## test user registration 
###############################################
class TestUserAuthentication(TestCase):
    fixtures = ['account.json',]
     
    def test_registration(self):
         
        client = APIClient()
         
        user = {'username': 'martin',
             'first_name': 'Martin',
             'last_name': 'Bright',
             'email':'martin@abc.com',
             'password':'pwd123',
             'confirm_password':'pwd123',
             'birth_year':1983}
        response = client.post('/api/v1/accounts', user, format='json')
        assert response.status_code == 201
 
    def test_authenticate_with_username(self):
        user = authenticate(username='admin', password='justdoit')
        self.assertIsNone(user, msg='authenticate with email should return None')
         
    def test_authenticate_with_email(self):
        user = authenticate(email='admin@ocbl.ca', password='justdoit')
        self.assertIsNotNone(user, msg='authenticate with email should return user')
#         print 'authenticate_with_email() get user = {0}'.format(user)
#         if user is not None:
#             print 'authenticate with email success'
#         else:
#             print 'No backend authenticated the credentials'
             
    def test_login(self):
        client = APIClient()
        user = {'email':'admin@ocbl.ca',
                'password': 'justdoit'}
         
        response = client.post('/api/v1/login/', user, format='json')
        # print response.data
        assert response.status_code == 200

class TestAccountAccess(TestCase):
    fixtures = ['account.json',]
    
    def test_fetch_account_by_owner(self):
        client = APIClient()
        user = {'email':'dustin',
                'password': 'winterpass'}
        # admin:justdoit
        # kate:justdoit
        response = client.post('/api/v1/login/', user, format='json')
        assert response.status_code == 200
        
        #print type(response.data)
        
#         headers = {JWT_HEADER: str(response.data) }
#         response = client.get('/api/v1/accounts/admin', headers=headers)
#         print 'response ===> {0}'.format(response.data)
#         assert response.status_code == 200
        