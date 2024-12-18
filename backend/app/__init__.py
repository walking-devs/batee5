from flask import Flask
from flask_cors import CORS
from app.config import Config
from app.models import db
from flask_migrate import Migrate

def create_app(env='development'):
    app = Flask(__name__)
    app.config.from_object(Config)
    CORS(app)
    
    db.init_app(app)
    migrate = Migrate(app, db)
    
    # Register blueprints
    from app.routes.category_routes import categories_bp
    from app.routes.product_routes import products_bp
    app.register_blueprint(categories_bp)
    app.register_blueprint(products_bp)
    
    # Register CLI commands
    from app.cli import register_commands
    register_commands(app)
    
    return app