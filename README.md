# Batee5 - Flutter & Flask Application

A Flutter application with a Flask backend, using Firebase for data storage.

## Project Structure
```
batee5/
├── backend/
│ ├── app/
│ │ ├── init.py # Flask app initialization
│ │ ├── config.py # Configuration settings
│ │ ├── routes/ # API endpoints
│ │ │ ├── category_routes.py
│ │ │ └── product_routes.py
│ │ └── services/ # Business logic
│ │ └── firebase_service.py
│ ├── requirements.txt # Python dependencies
│ └── run.py # Server entry point
└── [Flutter files]
```


## Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```
2. Create a virtual environment:


```bash
python -m venv venv
```
### Windows
```bash
venv\Scripts\activate

```

### Unix/MacOS
```bash
source venv/bin/activate
```

```bash
pip install -r requirements.txt
```

5. Firebase Setup:
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Download your Firebase Admin SDK credentials JSON
   - Create `.env` file in the `backend` directory:
   ```
   FIREBASE_DATABASE_URL=your_firebase_database_url
   FIREBASE_CREDENTIALS_PATH=path_to_your_credentials.json
   ```

6. Run the server:
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

2. If Firebase fails to initialize:
   - Check your `.env` file exists in the backend directory
   - Verify your Firebase credentials JSON path is correct
   - Ensure Firebase Database URL is correct





