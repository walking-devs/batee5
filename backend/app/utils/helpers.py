from datetime import datetime

def format_datetime(dt_str):
    return datetime.strptime(dt_str, "%Y-%m-%dT%H:%M:%SZ")
