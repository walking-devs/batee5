from flask import Blueprint, jsonify
from app.services.database_service import DatabaseService

categories_bp = Blueprint('categories', __name__)
db_service = DatabaseService()

@categories_bp.route('/categories', methods=['GET'])
def get_categories():
    categories = db_service.get_categories()
    return jsonify(categories)