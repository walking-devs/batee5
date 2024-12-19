import click
from flask.cli import with_appcontext
from app.models import db
from app.seeds.development import seed_development_data

def register_commands(app):
    @app.cli.command("setup-db")
    @with_appcontext
    def setup_db():
        """Initialize database, run migrations, and seed development data."""
        click.echo("Dropping all tables...")
        db.drop_all()
        
        click.echo("Creating all tables...")
        db.create_all()
        
        click.echo("Seeding development data...")
        seed_development_data(db)
        
        click.echo("Database setup completed! 🚀")

    @app.cli.command("reset-db")
    @with_appcontext
    def reset_db():
        """Reset database with fresh development data."""
        click.echo("Resetting database with fresh data...")
        seed_development_data(db)
        click.echo("Database reset completed! 🚀")