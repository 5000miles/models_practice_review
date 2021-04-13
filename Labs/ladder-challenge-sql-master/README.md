# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) The SQL Ladder Challenge

# Climb the Ladder!
Our class moves quickly! SQL is important, and we'd like to give it the time and attention it deserves. Starting with the `01` file, we've provided several SQL problems that get progressively harder. They start trivial, and build into some serious head-scratchers. The progression is itended to be smooth, so the next rung of the ladder is always within reach!

# Contents
You are provided with a SQLite database, `ladder.db`. You may find instructions on how to execute SQL queries on it below.

This repository contains 4 markdown files, separated only so they do not get too long. The content is divided into ? sections and are designed to be completed in order. Do not skip!

| File | Title | Contents |
| ---: | :---: | --- |
| 01 | The Basics | `SELECT` statements, sorting, filtering, column operations, `CASE/WHEN` |
| 02 | Summarizing Your Data with SQL | Summary statistics, `GROUP BY`, `HAVING` |
| 03 | Views, CTEs, and Joins | Creating views, creating CTEs, and then merging on them |
| 04 | Window Functions and More | Window functions, advanced uses of CTEs and joins |
| 05 | C.R.U.D. | _Coming soon!_ |

# Solutions?
Solutions will _never_ be uploaded here. Your instructor may give you solutions at their own discretion. We encourage the use of Googling to aid you in solving these problems! That's how the pros do it!

# How to Connect to a SQL Database
## Option 1: Use a standalone DB viewer (recommended for the ladder challenge to start)
There are millions of GUI programs out there at serve simply as a place to enter SQL code, hit enter, and see the results. Some are more sophisticated than others, but I believe this is the easiest way to get up and running solving things problems. Here are a few for you to choose from:

* [DB Browser for SQLite](https://sqlitebrowser.org) - Fast and lightweight. Allows you to view SQL tables graphically. As the name implies, only good for SQLite databases.
* [Sqlectron](https://sqlectron.github.io) - A little slow, but neatly organizes all of your database connections for easy re-entry.
* [Valentina Studio](https://valentina-db.com/en/valentina-studio-overview) - Heavy duty IDE, can also make schema diagrams.

## Option 2: Use the command line and text files (recommended for pros now, recommended for everyone else in the long run)
The SQLite3 command line application has already been installed with Anaconda. Here are some instructions to get started:

To enter the interactive CL environment:

```bash
$ sqlite3 ladder.db
```

From here, you can execute SQL queries. Don't forget to end them with semicolons! You can adjust some settings so the tables print out easier:

```
sqlite> .mode column
sqlite> .headers on
```

Very quickly, your queries will get too long to run in one line like this. To execute queries from a file, simply type:

```
sqlite> .read myquery.sql
```

More experienced command line gurus may execute this pro move all from the Bash terminal:

```bash
$ cat myquery.sql | sqlite3 -column -header ladder.db
```

## Option 3: Use Python (not recommended to start, but highly recommended to put SQL code in production)
The `sqlite3` library has been installed with Anaconda on your machine already. Pandas can actually interact with this library to produce data frames for you with minimal effort. For example:

```python
import sqlite3
import pandas as pd

conn = sqlite.connect("ladder.db")
pd.read_sql("SELECT * FROM mytable;", conn)
```

To execute non-`SELECT` statements, you cannot use Pandas. You'll need to execute a squery on a cursor of the connection and then commit it. For example:

```python
conn = sqlite.connect("ladder.db")
cur = conn.cursor()
cur.execute("SOME QUERY")
conn.commit()
```
# Oh no, I messed up my database!
No worries! I've included the script I used to generate our data. To recreate the `ladder.db` file from scratch, simply run the `seed.py` file to reseed (recreate) the database. Note that you may need to install the `faker` library.
