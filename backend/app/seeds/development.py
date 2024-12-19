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
            image_url='https://www.publicdomainpictures.net/pictures/170000/velka/smartphone-mobile-phone-cellphone.jpg',
            category=electronics,
            is_favorite=False
        ),
        Product(
            name='Gaza Laptop Pro',
            description='Professional laptop for work and gaming',
            price=10499.99,
            image_url='https://www.publicdomainpictures.net/pictures/10000/velka/1-1216221458n7mg.jpg',
            category=electronics,
            is_favorite=True
        ),
        
        # Clothing
        Product(
            name='Denim Jeans',
            description='Classic blue denim jeans',
            price=79.99,
            image_url='https://get.pxhere.com/photo/jeans-denim-pocket-textile-trousers-1551899.jpg',
            category=clothing,
            is_favorite=True
        ),
        
        # Books
        Product(
            name='Python Programming',
            description='Learn Python programming from scratch',
            price=29.99,
            image_url='https://c4.wallpaperflare.com/wallpaper/805/936/1019/code-python-computer-python-programming-wallpaper-thumb.jpg',
            category=books,
            is_favorite=False
        ),
        Product(
            name='Fiction Novel',
            description='Bestselling fiction novel',
            price=19.99,
            image_url='https://www.publicdomainpictures.net/pictures/360000/velka/book-15946637087ey.jpg',
            category=books,
            is_favorite=True
        ),
        
        # Home
        Product(
            name='Coffee Table',
            description='Modern design coffee table',
            price=199.99,
            image_url='https://p1.pxfuel.com/preview/371/619/634/cafe-coffee-tables-chairs.jpg',
            category=home,
            is_favorite=False
        ),
        Product(
            name='Bed Set',
            description='Complete bedroom set with mattress',
            price=899.99,
            image_url='https://www.publicdomainpictures.net/pictures/580000/velka/a-light-wooden-bedroom-setting-1708524754UuS.jpg',
            category=home,
            is_favorite=True
        )
    ]
    
    db.session.add_all(products)
    db.session.commit()
    
    print("Development database seeded with sample data!")