import json
import jwt
from nameko.rpc import RpcProxy
from nameko.web.handlers import http
from requests import Response
from werkzeug.wrappers import Response
# from nameko_cors import cors_http


class GatewayService:
    name = 'gateway'
    header = {
        "Access-Control-Allow-Origin": "*",
         "Access-Control-Allow-Methods": "*",
         "Access-Control-Allow-Headers": "*",
         
    }
    
    SECRET_KEY = "pisang goreng";
    atraksi = RpcProxy('atraksi_service')
    
    def verify_token(self, token):
        try:
            payload = jwt.decode(token, self.SECRET_KEY, algorithms=['HS256'])
            return payload
        except jwt.ExpiredSignatureError:
            return {"error": "Token has expired"}
        except jwt.InvalidTokenError:
            return {"error": "Invalid token"}
    
    @http('GET', '/api/atraksi')
    def get_atraksi_info(self, request):
        result = self.atraksi.get_atraksi_info()
        return (200, self.header, json.dumps(result))
    
    @http('GET', '/api/atraksi/paket/<int:id_paket>')
    def get_atraksi_paket_id(self, request, id_paket):
        result = self.atraksi.get_atraksi_paket_id(id_paket)
        return (200, self.header, json.dumps(result))
    
    @http('GET', '/api/atraksi/paket')
    def get_atraksi_paket(self, request):
        result = self.atraksi.get_atraksi_paket()
        return (200, self.header, json.dumps(result))
    
    @http('GET', '/api/atraksi/tutup/<string:tgls>')
    def get_atraksi_tutup(self, request, tgls):
        result = self.atraksi.get_atraksi_tutup(tgls)
        return (200, self.header, json.dumps(result))

    @http('POST', '/api/eticket')
    def create_eticket(self, request):
        data = request.get_data(as_text=True)
        data = json.loads(data)
        token_data = self.verify_token(data['_token'])
        if 'error' in token_data:
            return (401, self.header, json.dumps(token_data))
        
        paket_id = None
        jml_ticket = None
        booking_code = None
        tgl_booking = None
        try:
            paket_id = data['paket_id']
            jml_ticket = data['jml_ticket']
            booking_code = data['booking_code']
            tgl_booking = data['tgl_booking']
        except:
            result = {
                "error": "Invalid Format input"
            }
            return (400, self.header, json.dumps(result))
        
        result = self.atraksi.create_eticket(paket_id, jml_ticket, booking_code, tgl_booking)
        return (200, self.header, json.dumps(result))
    
    @http('PUT', '/api/eticket/<string:ticket_code>')
    def check_in(self, request, ticket_code):
        print(ticket_code)
        result = self.atraksi.check_in(ticket_code)
        return (200, self.header, json.dumps(result))
        

    @http('DELETE', '/api/eticket/<string:ticket_code>')
    def delete_eticket(self, request, ticket_code):
        result = self.atraksi.delete_eticket(ticket_code)
        print(result)
        if "error" in result:
            return (400, self.header, json.dumps(result))
        else:
            return (200, self.header, json.dumps(result))
        
