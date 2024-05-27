import json

from nameko.rpc import RpcProxy
from nameko.web.handlers import http

class GatewayService:
    name = 'gateway'

    user_rpc = RpcProxy('user_service')

    @http('POST','/user')
    def create_user(self, request):
        data = request.get_data(as_text=True)
        json_data = json.loads(data)
        username = json_data.get('user_username')
        name = json_data.get('user_name')
        gmail = json_data.get('user_gmail')
        password = json_data.get('user_password')
        status_code, create_details = self.user_rpc.create_user(username,name,gmail,password)
        return status_code, json.dumps(create_details)
    
# notes:
# post -> create user
# get -> get user
# get -> get detail user
# put -> forgot pass
# put -> change pass
# put -> update profile
# put -> request delete

# database:
# user:
#   user_ID (auto gen dari firebase ne)
#   name (string)
#   username (string)
#   email (string)
#   jenis (int) (user biasa (1)/admin(2)/perhotelan(3)/dkk)
#   password
#   request acc forgot (bool)
#   request forgot (date + time)
#   request acc delete (bool)
#   request delete (date + time) -> 3 hari setelah lewat = delete