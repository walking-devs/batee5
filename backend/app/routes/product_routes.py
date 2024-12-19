from flask import Blueprint, jsonify, request
from app.services.database_service import DatabaseService
from app.models import Category

products_bp = Blueprint('products', __name__)
db_service = DatabaseService()

@products_bp.route('/products', methods=['GET'])
def get_products():
    category = request.args.get('category')
    products = db_service.get_products(category)
    return jsonify(products)

@products_bp.route('/products/<category>/<product_id>', methods=['GET'])
def get_product(category, product_id):
    product = db_service.get_product(category, product_id)
    if product is None:
        return jsonify({'error': 'Product not found'}), 404
    return jsonify(product)

@products_bp.route('/products/<category>/<product_id>/favorite', methods=['POST'])
def toggle_favorite(category, product_id):
    result = db_service.toggle_favorite(category, product_id)
    if result is None:
        return jsonify({'error': 'Product not found'}), 404
    return jsonify(result)

@products_bp.route('/products', methods=['POST'])
def create_product():
    data = request.json
    result = db_service.create_product(data)
    if 'error' in result:
        return jsonify(result), 400
    return jsonify(result), 201

@products_bp.route('/debug/categories', methods=['GET'])
def debug_categories():
    categories = Category.query.all()
    return jsonify([{
        'id': c.id,
        'name': c.name,
        'products': [{
            'id': p.id,
            'name': p.name,
            'category': p.category.name
        } for p in c.products]
    } for c in categories])