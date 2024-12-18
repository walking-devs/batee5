from app.services.database_service import DatabaseService

class ProductService:
    def __init__(self):
        self.db_service = DatabaseService()
    
    def get_products(self, category=None):
        return self.db_service.get_products(category)
    
    def get_product(self, category, product_id):
        return self.db_service.get_product(category, product_id)
    
    def toggle_favorite(self, category, product_id):
        product = self.db_service.get_product(category, product_id)
        if product is None:
            return None
            
        current_status = product.get('isFavorite', False)
        # Update the product's favorite status in the database
        # Implementation needed in DatabaseService
        return {'isFavorite': not current_status}
    
    def create_product(self, data):
        return self.db_service.create_product(data)
