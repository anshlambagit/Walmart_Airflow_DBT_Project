from pathlib import Path

import psycopg2

conn_string = "your_connection_string_here"

csv_files = {
    "customers.csv": "raw.customers",
    "stores.csv": "raw.stores",
    "products.csv": "raw.products",
    "employees.csv": "raw.employees",
    "orders.csv": "raw.orders",
    "order_items.csv": "raw.order_items",
    
}

data_dir = Path(__file__).resolve().parent / "data"
conn = None

try:
    conn = psycopg2.connect(conn_string)

    with conn.cursor() as cursor:
        for csv_file, table_name in csv_files.items():
            csv_path = data_dir / csv_file

            if csv_path.exists():
                print(f"Loading {csv_file} into {table_name}...")

                with csv_path.open("r", encoding="utf-8") as f:
                    cursor.copy_expert(
                        f"COPY {table_name} FROM STDIN WITH (FORMAT CSV, HEADER TRUE)",
                        f,
                    )

                conn.commit()
                print(f"✓ Successfully loaded {csv_file}")
            else:
                print(f"✗ File not found: {csv_path}")

    print("\n✓ All data loaded successfully!")

except Exception as e:
    print(f"Error: {e}")
    if conn is not None:
        conn.rollback()
finally:
    if conn is not None:
        conn.close()
