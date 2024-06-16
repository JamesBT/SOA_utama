from marshmallow import Schema, fields

class User(Schema):
    name = fields.Str(required=True, validate=lambda s: len(s) <= 100)
    username = fields.Str(required=True, validate=lambda s: len(s) <= 100)
    email = fields.Email(required=True)
    jenis = fields.Int(required=True)
    tgl_ultah = fields.Date(required=True)
    no_telp = fields.Str(required=True, validate=lambda s: len(s) <= 12)
    gender = fields.Int(required=True)
    kota = fields.Str(required=True, validate=lambda s: len(s) <= 100)
    negara = fields.Str(required=True, validate=lambda s: len(s) <= 100)