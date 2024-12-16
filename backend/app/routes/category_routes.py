from flask import Blueprint, jsonify
from app.services.firebase_service import get_firebase_reference

categories_bp = Blueprint('categories', __name__)

@categories_bp.route('/categories', methods=['GET'])
def get_categories():
    categories_ref = get_firebase_reference('categories')
    categories = categories_ref.get()
    return jsonify(categories)