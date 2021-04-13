# Views, CTEs, and Joins

This file contains several exercises on views, common table expressions (CTEs), and joins. These topics are a step more involved and confusing than in the previous two files. Before attempting these problems, you'll probably need to do some research into these topics. Here are a few tutorials:

* [Tutorial on Views](https://www.sqlitetutorial.net/sqlite-create-view/)
* [Tutorial on CTEs](https://www.essentialsql.com/introduction-common-table-expressions-ctes/)
* [Tutorial on Joins](https://www.sqlitetutorial.net/sqlite-join/)

Here are a few other important notes I'd like you read before beginning:
* Some of these problems can get pretty involved. Queries with adequate spacing can go longer than 15 lines in some problems.
* Make sure you read each question thoroughly.
* Don't skip problems, as some problems may rely on previous problems being done correctly.
* Make sure you are saving your answers as you go, as some answers will simply be reworkings of previous answers.
* Some problems in the `Views` section involve you making persistent changes to the database itself. Specifically, if you create a view, you cannot create another view with the same name if it already exists. You may want to learn the `DROP VIEW` command. Or maybe a little easier,  you can recreate the entire database by simply running the `seed.py` script provided in this repo. If you're unsure, you can see your list of tables and views using the `.tables` dot-command from the `sqlite3` interface.

## Views
62) Look at the `yum` table. It is the stock data for Yum! Brands, Inc. from 2015 through 2019. Yum! is the company that owns Taco Bell, the best restaurant.
63) Query the `yum` table, aggregating by **both** month and year, with the following resulting columns:
* Year (4 digits)
* Month
* Average open, high, low, and close
* Total volume
Finally, sort this data so it's in proper chronological order.
64) Save the results of the previous query as a view named `yum_by_month`.
65) Create a view of `transactions` consisting of only three columns: year, month, and total sales in that month. Call this view `trans_by_month`.
66) Create a view of `transactions` consisting of only two columns: `employee_id` and the total sales corresponding to that employee. Call this view `trans_by_employee`.

## Common Table Expressions (CTEs)
CTEs are a convenient way of shortening SQL queries to keep your code DRY (**d**on't **r**epeat **y**ourself). You'll notice they're essentially the same in terms of the tasks they can accomplish, however CTEs are _temporary_. They vanish after the query has been called. Essentially, CTEs are single-use views.

Therefore, CTEs aren't needed to solve any of the following problems. You could use a view instead, however that would be wasteful since you'll never use them again. Additionally, for some problems, neither a view nor a CTE is truly needed, but the query would be very messy without one.

67) What's the most common first initial for pets in the `pets` table?
    * _Hint:_ Create a CTE that is simply the lowercased first letter of the pet's name. The solution is a simple `GROUP BY` from this CTE.
    * _Hint 2:_ You'll need the `SUBSTR()` and `LOWER()` functions.
68) Create taglines for each employee in the `employees` table. As a template, the first row of the result should look like this:

```
Christine Thompson started in 2005 and makes $123,696 working in sales. 
```

To do this easily, make a CTE featuring name (firstname + " " + lastname), job, salary (formatted), and year. Job title should be lowercased, _unless_ it is IT, in which case leave it capitalized. The solution is simple string concatenation off of this long CTE.

69) How many of our sales come from companies ending in each of "LLC", "Inc", "Ltd", or "PLC"? In a CTE, create a `company_type` column of values `"LLC"`, `"Inc"`, `"Ltd"`, `"PLC"`, or `"Other"`. Outside the CTE, find the total revenue from these categories, as well as their respective counts.
* _Hint:_ You'll need the `INSTR()` function.

## Joins
No, we're not done talking about views and CTEs! We're just going to start intermingling them in with further examples on joins, where the real power of these techniques becomes clearer.

70) Which employee made which sale? Join the `employees` table onto the `transactions` table by `employee_id`. You only need to include the employee's first/last name from `employees`.
71) What is the name of the employee who made the most in sales? Find this answer by doing a join as in the previous problem. Your resulting query will be difficult for someone else to read.
72) Solve the previous problem by joining `employees` onto the `trans_by_employee` view you made earlier.
73) Solve the previous problem by joining `employees` onto a CTE.
74) Next, the company will try to give bonuses based on performance. Show all employees who've made more in sales than 1.5 times their salary. (You may use whatever technique you'd like to do the join: view, CTE, or even a subquery!)
75) Do we have potentially erroneous rows? Find all transactions which occurred _before_ the employee was even hired! (Make sure each transaction only occupies one row).
76) Among all transactions that occurred from 2015 to 2019, create a table that is the monthly revenue of our company versus the total trading volume of Yum! in that month. Format the columns nicely. That is, a sample row of your result might look like this:

```
| year | month | company_revenue | yum_trade_volume |
|------|-------|-----------------|------------------|
| 2017 |    03 |        $100,000 |      125,000,000 |
```

* _Hint:_ You don't need any `WHERE` statements here. You can get the right answer simply by changing what kind of join you do!

77) Repeat the previous problem, but in addition to the total volume, include:
* The lowest price that month (ie, lowest low)
* The highest price that month (ie, highest high)
