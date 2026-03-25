import os
import psycopg2

conn = psycopg2.connect(
    dbname=os.getenv("DB_NAME", "rsis_db"),
    user=os.getenv("DB_USER", "rsis"),
    password=os.getenv("DB_PASSWORD", "rsis123"),
    host=os.getenv("DB_HOST", "localhost"),
    port=os.getenv("DB_PORT", 5432)
)
cursor = conn.cursor()
