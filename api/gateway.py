import json

from nameko.rpc import RpcProxy
from nameko.web.handlers import http

class GatewayService:
    name = 'gateway'

    user_rpc = RpcProxy('user_service')

    # G -> GET
    # P -> POST
    # U -> PUT (UPDATE)
    # D -> DELETE
    
    # G, P, U, D /user/<userId>
    # G -> verif nama (userId)
    # P -> buat akun (username,name,gmail,tgl_ultah,no_telp,gender,kota,negara,password)
    # U -> update profile (tgl_ultah,no_telp,gender,kota,negara)
    # D -> delete/disable account (userId) -> ubah status ke 0 | 1 = aktif, 0 = nonaktif
    
    # P /user/auth
    # P -> login
    
    # P, U /user/forgot
    # P -> request forgot pass (gmail)
    # U -> ubah password (userID, new pass, kode_ganti_pass)

# =========================================================================== /USER/ ===========================================================================

    # verif nama
    @http('GET', '/user/<int:userid>')
    def verif_user_name(self,request,userid):
        status_code, verif_detail = self.user_rpc.verif_user_name(userid)
        return status_code, verif_detail
    
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
        print("buat user")
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
    
    # update profile
    @http('PUT', '/user')
    def update_profile(self,request,userid,name,username,tgl_ultah,no_telp,gender,kota,negara):
        status_code, update_detail = self.user_rpc.update_profile(userid,name,username,tgl_ultah,no_telp,gender,kota,negara)
        return status_code, update_detail
    
    # delete - disable account
    @http('DELETE', '/user')
    def delete_user(self,request,userid):
        status_code, delete_detail = self.user_rpc.delete_acc(userid)
        return status_code, delete_detail
    
# =========================================================================== /USER/AUTH ===========================================================================
    
    # ambil user dengan gmail tertentu
    @http('POST', '/user/auth')
    def get_user(self,request):
        data = request.get_data(as_text=True)
        json_data = json.loads(data)
        gmail = json_data.get('email')
        password = json_data.get('password')
        status_code, user_detail = self.user_rpc.verif_login(gmail,password)
        return status_code, json.dumps(user_detail)
    
# =========================================================================== /USER/FORGOT ===========================================================================
    
    # request forgot pass
    @http('POST', '/user/forgot')
    def request_forgot_pass(self,request):
        data = request.get_data(as_text=True)
        json_data = json.loads(data)
        gmail = json_data.get('email')
        status_code, request_detail = self.user_rpc.request_forgot_pass(gmail)
        return status_code, request_detail
    
    # update password
    @http('PUT', '/user/forgot')
    def update_pass(self,request,gmail,password,kode_ganti_pass):
        status_code, update_detail = self.user_rpc.update_pass(gmail,password,kode_ganti_pass)
        return status_code, update_detail
    
# =========================================================================== MISC ===========================================================================

    # ambil semua user
    @http('GET', '/user')
    def get_all_user(self,request):
        status_code, all_user_detail = self.user_rpc.get_all_user()
        return status_code, all_user_detail


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
#   user_id (auto gen dari firebase ne)
#   user_status
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
#   request_forgot_code (int) -> 6 digit
#   request_acc_delete (bool)
#   request_delete_date (date) -> 3 hari setelah lewat = delete