from nameko.rpc import rpc

import dependencies
import json
from datetime import datetime

class RoomService:

    name = 'atraksi_service'

    database = dependencies.Database()
    
    @rpc
    def get_atraksi_info(self):
        atraksi = self.database.get_atraksi_info()
        # print(type(atraksi))
        if atraksi != None:
            # atraksi['photo'] = self.database.get_atraksi_photo_s3()
            # atraksi['type_name'] = self.database.get_ticket_type_id(atraksi['type_id'])
            # kalo eror pake yang bawah yg atas itu connect ke aws
            atraksi['photo'] = self.database.get_atraksi_photo()
            tgl = datetime.now().strftime('%Y-%m-%d')
            atraksi['status'] = self.database.get_atraksi_tutup(tgl)['status']
            atraksi['jam_buka'] = self.database.get_atraksi_jam_buka()
            return atraksi
        else: 
            return {
                "error": "Atraksi tidak tersedia",
            }
    
    @rpc
    def get_atraksi_paket(self):
        atraksi = self.database.get_atraksi_paket()
        tgl = datetime.now().strftime('%Y-%m-%d')
        atraksi['status'] = self.database.get_atraksi_tutup(tgl)['status']
        # print(type(atraksi))
        return atraksi
    
    @rpc
    def get_atraksi_tutup(self, tgls):
        atraksi = self.database.get_atraksi_tutup(tgls)
        return atraksi
    
    
    @rpc
    def get_atraksi_paket_id(self, id_paket):
        atraksi = self.database.get_atraksi_paket_id(id_paket)
        atraksi['type_name'] = self.database.get_ticket_type_id(atraksi['type_id'])
        tgl = datetime.now().strftime('%Y-%m-%d')
        atraksi['status'] = self.database.get_atraksi_tutup(tgl)['status']
        return atraksi
        
    @rpc
    def create_eticket(self, paket_id, jml_ticket, booking_code, tgl_booking):
        try:
            booking_date = datetime.strptime(tgl_booking, "%Y-%m-%d").date()
        except ValueError:
            return {"error": "Invalid date format. Use YYYY-MM-DD format."}
        
        if booking_date < datetime.now().date():
            return {"error": "Booking date cannot be in the past."}
        
        paket = self.database.get_atraksi_paket_id(paket_id)
        type_ticket = self.database.get_ticket_type_id(paket['type_id'])
        data = []

        for i in range(int(jml_ticket)):
            data.append(self.database.create_eticket(paket_id, jml_ticket, booking_code, type_ticket, tgl_booking))
        return data
    
    @rpc
    def check_in(self, ticket_code):
        ticket = self.database.get_eticket_detail(ticket_code)
        if ticket['check_in'] != None:
            return {"error": "ticket sudah digunakan"}
        ticket_date = ticket['valid_at']
        now = datetime.now().date()
        
        if now < ticket_date or now > ticket_date:
            return {"error": "Check in hanya bisa di hari yang sama"}
        
        ticket = self.database.check_in(ticket_code)
        return ticket

    @rpc
    def delete_eticket(self, ticket_code):
        result = self.database.delete_eticket(ticket_code)
        response = None
        if result == 1 :
            response = {
            "status": "Berhasil Dihapus"
            } 
        else:
            response = {
            "status": "Gagal dihapus"
            }     
        return response

