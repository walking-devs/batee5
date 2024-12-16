from firebase_admin import db

def get_firebase_reference(path):
    return db.reference(path)
