from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

class Category(db.Model):
    __tablename__ = 'categories'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    products = db.relationship('Product', backref='category', lazy=True)

class Product(db.Model):
    __tablename__ = 'products'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text)
    price = db.Column(db.Float, nullable=False)
    image_url = db.Column(db.String(500))
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'), nullable=False)
    is_favorite = db.Column(db.Boolean, default=False)
    area = db.Column(db.Integer, nullable=True)
    number_of_bathrooms = db.Column(db.Integer, nullable=True)
    number_of_bedrooms = db.Column(db.Integer, nullable=True)
    date_listed = db.Column(db.DateTime, default=datetime.utcnow)