import json

from nameko.rpc import RpcProxy
from nameko.web.handlers import http

class GatewayService:
    name = 'gateway'

    user_rpc = RpcProxy('user_service')

    # buat akun user baru
    @http('POST','/user')
    def create_user(self, request):
        data = request.get_data(as_text=True)
        json_data = json.loads(data)
        username = json_data.get('user_username')
        name = json_data.get('user_name')
        gmail = json_data.get('user_gmail')
        tgl_ultah = json_data.get('tgl_ultah')
        no_telp = json_data.get('no_telp')
        gender = json_data.get('gender')
        kota = json_data.get('kota')
        negara = json_data.get('negara')
        password = json_data.get('user_password')
        status_code, create_details = self.user_rpc.create_user(username,name,gmail,tgl_ultah,no_telp,gender,kota,negara,password)
        return status_code, json.dumps(create_details)
    # contoh input:
    # {
    #     "user_username": "hooman",
    #     "user_name": "jeremy",
    #     "user_gmail": "testing123@gmail.com",
    #     "tgl_ultah": "22-01-2006",
    #     "no_telp": "08123456789",
    #     "gender": "1", 1-> laki2, 2-> cewek, 3-> dll
    #     "kota": "surabaya",
    #     "negara": "indonesia",
    #     "user_password": "jeremy123456",
    # }
    
    # ambil user dengan username/gmail tertentu
    @http('GET', '/user/<str:input>')
    def get_user(self,request,input):
        status_code, user_detail = self.user_rpc.get_user(input)
        return status_code, json.dumps(user_detail)
    
    # ambil detail full user dengan username/gmail tertentu
    @http('GET', '/user/detail/<str:input>')
    def get_user_detail(self,request,input):
        status_code, user_detail = self.user_rpc.get_user_detail(input)
        return status_code, user_detail
    
    # ambil semua user
    @http('GET', '/user')
    def get_all_user(self,request):
        status_code, all_user_detail = self.user_rpc.get_all_user()
        return status_code, all_user_detail
    
    # request forgot pass
    @http('GET', '/user/forgot/<str:gmail>')
    def request_forgot_pass(self,request,gmail):
        status_code, request_detail = self.user_rpc.request_forgot_pass(gmail)
        return status_code, request_detail
    
    # update password
    @http('POST', '/user/forgot')
    def update_pass(self,request,gmail,password):
        status_code, update_detail = self.user_rpc.update_pass(gmail,password)
        return status_code, update_detail
    
    # update profile
    @http('POST', '/user/detail')
    def update_profile(self,request,gmail,name,username,tgl_ultah,no_telp,gender,kota,negara):
        status_code, update_detail = self.user_rpc.update_profile(gmail,name,username,tgl_ultah,no_telp,gender,kota,negara)
        return status_code, update_detail
    
    # verif nama
    @http('GET', '/user/verif/<str:name>')
    def verif_user_name(self,request,name):
        status_code, verif_detail = self.user_rpc.verif_user_name(name)
        return status_code, verif_detail
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
#   password (string)
#   tgl_ultah (date)
#   no_telp (string?)
#   gender (int) (laki (1)/wanita (2)/dll (3))
#   kota (string)
#   negara (string)
#   request_acc_forgot (bool) (0 -> tidak ada, 1 -> ada)
#   request_forgot_date (date) -> lebih dari 1 minggu ditolak
#   request_acc_delete (bool)
#   request_delete_date (date) -> 3 hari setelah lewat = delete