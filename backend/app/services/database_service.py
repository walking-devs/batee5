from app.models import db, Category, Product
from datetime import datetime

class DatabaseService:
    @staticmethod
    def get_categories():
        categories = Category.query.all()
        return {str(cat.id): {'name': cat.name, 'description': cat.description} for cat in categories}
    
    @staticmethod
    def get_products(category=None):
        if category:
            products = Product.query.join(Category).filter(
                Category.name.ilike(category)
            ).all()
        else:
            products = Product.query.all()
        
        return {str(prod.id): {
            'name': prod.name,
            'title': prod.name,
            'description': prod.description,
            'price': prod.price,
            'imageUrl': prod.image_url,
            'isFavorite': prod.is_favorite,
            'category': prod.category.name.lower(),
            'dateListed': datetime.now().isoformat(),
            'location': 'Egypt',
            'area': None,
            'numberOfBathrooms': None,
            'numberOfBedrooms': None
        } for prod in products}
    
    @staticmethod
    def get_product(category_id, product_id):
        product = Product.query.filter_by(category_id=category_id, id=product_id).first()
        if product:
            return {
                'name': product.name,
                'description': product.description,
                'price': product.price,
                'imageUrl': product.image_url,  # Added this field
                'isFavorite': product.is_favorite
            }
        return None
    
    @staticmethod
    def create_product(data):
        category_id = data.get('category')
        if not category_id:
            return {'error': 'Category is required'}
        
        new_product = Product(
            name=data.get('name'),
            description=data.get('description'),
            price=data.get('price'),
            image_url=data.get('imageUrl'),  # Added this field
            category_id=category_id
        )
        db.session.add(new_product)
        db.session.commit()
        
        return {'id': new_product.id, 'data': data}
    
    @staticmethod
    def toggle_favorite(category_id, product_id):
        product = Product.query.filter_by(category_id=category_id, id=product_id).first()
        if product:
            product.is_favorite = not product.is_favorite
            db.session.commit()
            return {
                'name': product.name,
                'description': product.description,
                'price': product.price,
                'imageUrl': product.image_url,
                'isFavorite': product.is_favorite
            }
        return None