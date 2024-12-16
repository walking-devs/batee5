# app/routes/product_routes.py
from flask import Blueprint, jsonify, request
from app.services.product_service import ProductService

products_bp = Blueprint('products', __name__)
product_service = ProductService()

@products_bp.route('/products', methods=['GET'])
def get_products():
    category = request.args.get('category')
    products = product_service.get_products(category)
    return jsonify(products)

@products_bp.route('/products/<category>/<product_id>', methods=['GET'])
def get_product(category, product_id):
    product = product_service.get_product(category, product_id)
    if product is None:
        return jsonify({'error': 'Product not found'}), 404
    return jsonify(product)

@products_bp.route('/products/<category>/<product_id>/favorite', methods=['POST'])
def toggle_favorite(category, product_id):
    result = product_service.toggle_favorite(category, product_id)
    if result is None:
        return jsonify({'error': 'Product not found'}), 404
    return jsonify(result)

@products_bp.route('/products', methods=['POST'])
def create_product():
    data = request.json
    result = product_service.create_product(data)
    if 'error' in result:
        return jsonify(result), 400
    return jsonify(result), 201