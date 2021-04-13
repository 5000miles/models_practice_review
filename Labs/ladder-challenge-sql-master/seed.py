import os
import datetime
import random

from collections import OrderedDict

from faker import Faker

import numpy as np
import pandas as pd

import sqlite3

if os.path.exists("ladder.db"):
    os.remove("ladder.db")

conn = sqlite3.connect("ladder.db")
cur = conn.cursor()

# Seed pets ==================================
cur.execute("""
CREATE TABLE IF NOT EXISTS pets (
    name text,
    sex text,
    species text,
    age integer
);
""")

def add_into_pets(data):
    cur.execute("""
    INSERT INTO pets (name, sex, species, age)
    VALUES (?, ?, ?, ?);
    """, data)

pets = [
    ("Chloe", "F", "dog", 9),
    ("Paddington", "M", "dog", 10),
    ("Petey", "M", "dog", 7),
    ("Bella", "F", "dog", 1),
    ("Glenn Coco", "M", "cat", 6),
    ("Alanna", "F", "cat", 3),
    ("Mimi", "F", "dog", 4),
    ("Midge", "F", "cat", 7),
    ("Eli", "M", "dog", 8),
    ("Shuri", "F", "cat", 2),
    ("Oliver", "M", "cat", 5),
    ("Dottie", "F", "cat", 3),
    ("Pinchy", "M", "lobster", 3)
]

for pet in pets:
    add_into_pets(pet)

# Seed employees ==================================
cur.execute("""
CREATE TABLE IF NOT EXISTS employees (
    ID integer primary key,
    firstname text,
    lastname text,
    job text,
    salary numeric,
    startdate text
);
""")

def gen_fake_person(fake, i):
    return (
        i,
        fake.first_name(),
        fake.last_name(),
        fake.random_element(OrderedDict([
            ("Administrator", 0.1),
            ("Sales", 0.7),
            ("Operations", 0.1),
            ("IT", 0.1)
        ])),
        np.round(np.random.uniform(30000, 125000, 1)[0]),
        fake.date_between_dates(
            date_start=datetime.date(year=1990, month=1, day=1),
            date_end=datetime.date(year=2020, month=1, day=1)
        ).strftime("%Y-%m-%d")
    )

def add_into_employees(emp):
    cur.execute("""
    INSERT INTO employees (ID, firstname, lastname, job, salary, startdate)
    VALUES (?, ?, ?, ?, ?, ?);
    """, emp) 

fake = Faker()
Faker.seed(2020)
np.random.seed(2020)
for i in range(100):
    employee = gen_fake_person(fake, i)
    add_into_employees(employee)

# Seed employees with NULLs ==================================
cur.execute("""
CREATE TABLE IF NOT EXISTS employees_null AS 
    SELECT * FROM employees
;
""")

random.seed(2020)
for ix in random.sample(range(100), 10):
    cur.execute("""
    UPDATE employees_null
    SET
        salary = NULL
    WHERE
        ID = ?
    """, (ix,))

cur.execute("""
INSERT INTO employees_null (ID, firstname, lastname, job, salary, startdate)
VALUES (?, ?, ?, ?, ?, ?);
""", (101, "UNKNOWN", "UNKNOWN", None, -1, None)) 

# Seed transactions ==================================
cur.execute("""
CREATE TABLE IF NOT EXISTS transactions (
    order_id integer,
    customer text,
    unit_price real,
    quantity integer,
    orderdate text,
    employee_id integer
);
""")

Faker.seed(1234)
random.seed(1234)
np.random.seed(1234)

fake = Faker()
customers = [fake.company() for i in range(100)]

salespeople = [
    id_num[0] for id_num in
    cur.execute("SELECT id FROM employees WHERE job = \"Sales\"").fetchall()
]

def add_into_transactions(row):
    transaction_query = """
    INSERT INTO transactions (order_id, customer, unit_price, quantity, orderdate, employee_id)
    VALUES (?, ?, ?, ?, ?, ?)
    """
    cur.execute(transaction_query, row)

for order_id in range(10000):
    customer = random.choice(customers)
    employee = random.choice(salespeople)
    n_items = np.random.poisson(5)
    unit_prices = np.round(np.random.uniform(10, 100, size=n_items)) / 4
    orderdate = fake.date_between_dates(
        date_start=datetime.date(year=1990, month=1, day=1),
        date_end=datetime.date(year=2020, month=1, day=1)
    ).strftime("%Y-%m-%d")
    for price in unit_prices:
        quantity = np.random.poisson(10)
        add_into_transactions(
            (order_id, customer, price, quantity, orderdate, employee)
        )

# Seed yum ==================================
cur.execute("""
CREATE TABLE IF NOT EXISTS yum (
    date text,
    open real,
    high real,
    low real,
    close real,
    volume integer
);
""")

yum = pd.read_csv("data/yum.csv")

def add_into_yum(row):
    yum_query = """
    INSERT INTO yum (date, open, high, low, close, volume)
    VALUES (?, ?, ?, ?, ?, ?)
    """
    cur.execute(yum_query, row)

for row in yum.iterrows():
    add_into_yum(tuple(row[1]))

conn.commit()
