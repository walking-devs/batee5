# Batee5 - Flutter & Flask Application

A Flutter application with a Flask backend, using PostgreSQL for data storage.

## Project Structure
```
batee5/
├── backend/
│ ├── app/
│ │ ├── init.py # Flask app initialization
│ │ ├── config.py # Configuration settings
│ │ ├── models.py # Database models
│ │ ├── routes/ # API endpoints
│ │ │ ├── category_routes.py
│ │ │ └── product_routes.py
│ │ └── services/ # Business logic
│ │     ├── database_service.py
│ │     └── product_service.py
│ ├── migrations/ # Database migrations
│ ├── requirements.txt # Python dependencies
│ └── run.py # Server entry point
└── [Flutter files]
```


## Backend Setup (for local deployment)

1. Navigate to backend directory:
```bash
cd backend
```

2. Create a virtual environment:
```bash
python -m venv venv
```

3. Activate the virtual environment:
### Windows
```bash
venv\Scripts\activate
```

### Unix/MacOS
```bash
source venv/bin/activate
```

4. Install dependencies:
```bash
pip install -r requirements.txt
```

5. Database Setup:
   - Install PostgreSQL if not already installed
   - Create a database for the application
   - Create `.env` file in the `backend` directory:
   ```
   DATABASE_URL=postgresql://username:password@localhost:5432/database_name
   ```
   (change to your username, password and database name.)

6. Initialize the database:
```bash
flask setup-db
```

7. Run the server:
```bash
# Make sure you're in the backend directory
python run.py
```

The backend server will start at `http://localhost:5000` with the following endpoints:
- GET `/categories` - Fetch all categories
- GET `/products` - Fetch all products

### Troubleshooting Backend

1. If you see "No module named 'flask'":
   - Make sure you've activated the virtual environment
   - Run `pip install -r requirements.txt` again

2. If database connection fails:
   - Check your `.env` file exists in the backend directory
   - Verify your PostgreSQL service is running
   - Ensure DATABASE_URL is correct in .env
   - Try connecting to the database using psql to verify credentials





