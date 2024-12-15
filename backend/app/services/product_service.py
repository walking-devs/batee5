from app.services.firebase_service import get_firebase_reference

class ProductService:
    def get_products(self, category=None):
        products_ref = get_firebase_reference('products')
        if category:
            return products_ref.child(category).get()
        return products_ref.get()
    
    def get_product(self, category, product_id):
        product_ref = get_firebase_reference(f'products/{category}/{product_id}')
        return product_ref.get()
    
    def toggle_favorite(self, category, product_id):
        product_ref = get_firebase_reference(f'products/{category}/{product_id}')
        product = product_ref.get()
        
        if product is None:
            return None
            
        current_status = product.get('isFavorite', False)
        product_ref.update({'isFavorite': not current_status})
        return {'isFavorite': not current_status}
    
    def create_product(self, data):
        category = data.get('category')
        if not category:
            return {'error': 'Category is required'}
            
        products_ref = get_firebase_reference(f'products/{category}')
        new_product_ref = products_ref.push(data)
        return {'id': new_product_ref.key, 'data': data}
