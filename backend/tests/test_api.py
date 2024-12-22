import unittest
from app import create_app
from app.models import db, Category, Product

class TestAPI(unittest.TestCase):
    def setUp(self):
        self.app = create_app()
        self.app.config['TESTING'] = True
        self.app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:postgres@localhost:5432/batee5_test'
        self.client = self.app.test_client()
        
        with self.app.app_context():
            db.create_all()
            
            # Add test data
            category = Category(name='Test Category', description='Test Description')
            db.session.add(category)
            db.session.commit()
            
            product = Product(
                name='Test Product',
                description='Test Description',
                price=99.99,
                image_url='https://test.com/image.jpg',
                category=category,
                is_favorite=False
            )
            db.session.add(product)
            db.session.commit()

    def tearDown(self):
        with self.app.app_context():
            db.session.remove()
            db.drop_all()

    def test_get_categories(self):
        response = self.client.get('/categories')
        self.assertEqual(response.status_code, 200)
        self.assertTrue(len(response.json) > 0)

    def test_get_products(self):
        response = self.client.get('/products')
        self.assertEqual(response.status_code, 200)
        self.assertTrue(len(response.json) > 0)