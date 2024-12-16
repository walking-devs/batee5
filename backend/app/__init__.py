from flask import Flask
from flask_cors import CORS
from app.config import Config
import firebase_admin
from firebase_admin import credentials

def create_app():
    app = Flask(__name__)
    CORS(app)
    
    # Initialize Firebase
    cred = credentials.Certificate(Config.FIREBASE_CREDENTIALS_PATH)
    firebase_admin.initialize_app(cred, {
        'databaseURL': Config.FIREBASE_DATABASE_URL
    })
    
    # Import and register blueprints
    from app.routes.category_routes import categories_bp
    from app.routes.product_routes import products_bp
    
    app.register_blueprint(categories_bp)
    app.register_blueprint(products_bp)
    
    return app
