from app.models import Category, Product

def seed_development_data(db):
    # Drop all tables to start fresh
    db.drop_all()
    # Create all tables
    db.create_all()
    
    # Create sample categories
    electronics = Category(name='Electronics', description='Electronic devices and gadgets')
    clothing = Category(name='Clothing', description='Fashion and apparel')
    books = Category(name='Books', description='Books and literature')
    home = Category(name='Home', description='Home and furniture items')
    
    db.session.add_all([electronics, clothing, books, home])
    db.session.commit()
    
    # Create sample products
    products = [
        # Electronics
        Product(
            name='Gaza Smartphone X',
            description='Latest smartphone with amazing features',
            price=20999.99,
            image_url='https://ibb.co/4fjh5ct',
            category=electronics,
            is_favorite=False
        ),
        Product(
            name='Gaza Laptop Pro',
            description='Professional laptop for work and gaming',
            price=10499.99,
            image_url='https://ibb.co/CtXN7sM',
            category=electronics,
            is_favorite=True
        ),
        
        # Clothing
        Product(
            name='Denim Jeans',
            description='Classic blue denim jeans',
            price=79.99,
            image_url='https://ibb.co/LRcn1Hc',
            category=clothing,
            is_favorite=True
        ),
        
        # Books
        Product(
            name='Python Programming',
            description='Learn Python programming from scratch',
            price=29.99,
            image_url='https://ibb.co/k1ftwQS',
            category=books,
            is_favorite=False
        ),
        Product(
            name='Fiction Novel',
            description='Bestselling fiction novel',
            price=19.99,
            image_url='https://i.ibb.co/10cc6P5/14.png',
            category=books,
            is_favorite=True
        ),
        
        # Home
        Product(
            name='Coffee Table',
            description='Modern design coffee table',
            price=199.99,
            image_url='https://i.ibb.co/PTtQ1Qn/13.png',
            category=home,
            is_favorite=False
        ),
        Product(
            name='Bed Set',
            description='Complete bedroom set with mattress',
            price=899.99,
            image_url='https://i.ibb.co/fnG6RTf/12.png',
            category=home,
            is_favorite=True
        )
    ]
    
    db.session.add_all(products)
    db.session.commit()
    
    print("Development database seeded with sample data!")
