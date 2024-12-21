import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL")
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    def __init__(self):
        if not self.SQLALCHEMY_DATABASE_URI:
            raise ValueError("DATABASE_URL environment variable is not set")
        
        # Handle SQLite for development only
        if os.getenv("FLASK_ENV") != "production":
            self.SQLALCHEMY_DATABASE_URI = self.SQLALCHEMY_DATABASE_URI or "sqlite:///fallback.db"