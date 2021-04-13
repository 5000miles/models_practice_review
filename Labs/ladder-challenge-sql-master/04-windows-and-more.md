# Window Functions and More

The only new topic in this file is window functions. By itself, this topic is not difficult, and so we will start out slow. However, this topic is very useful in more complex queries. Solutions to some of these problems will be even longer and more involved than in the previous file. We'll be mixing a lot of prior material

## Window Functions

78) Create a daily cumulative sum of the trading volume of the Yum! stock in `yum`.
79) Create a cumulative sum of the trading volume of Yum! across months. That is, the final row of this query should be the cumulative sum of all months from 2015 through 2019.
80) For March 2017, create a table from `yum` with the following columns:
* Day of the month
* Row number (ie, the nth trading day of the month)
* Cumulative low (ie, lowest low so far this month)
* Cumulative high (ie, highest high so far this month)
* Cumulative total volume
81) From `yum`, create a column that represents the 7-day moving average of the closing price. This syntax is very confusing. You can read more about it [here](https://www.sqlitetutorial.net/sqlite-window-functions/sqlite-window-frame/).
82) Repeat the March 2017 problem but instead of cumulative highs, lows, and totals, show the 5-day moving highs and lows. (No need for volume here.)
83) The [**Williams %R**](https://www.investopedia.com/terms/w/williamsr.asp) is an economic trendline indicator of a stock. Query `yum` to only include two columns: the `date` (unmodified), and the 7-day Williams %R of the stock at that date, call it `williams_r`. It is computed as follows:

* Let `h7` be the running 7-day high (ie, highest high of the last 7 trading days).
* Let `l7` be the running 7-day low (ie, lowest low of the lsat 7 trading days).
* `williams_r = (h7 - close) / (h7 - l7)`

The easiest way to do this problem is to make a CTE containing `h7` and `l7`, and then produce `williams_r` by querying your CTE.

84) Next, let's create the [**Stochastic Oscillator**](https://www.investopedia.com/terms/s/stochasticoscillator.asp) of `yum`. The stochastic oscillator is actually two lines: One called _%K_ and the other called _%D_. They are computed as follows:

* Let `h14` and `l14` denote the 14-day highs and lows (similar to last problem)
* `percent_k = (close - l14) / (h14 - l14)`
* `percent_d` is the 3-day moving average of `percent_k`

My solution to this problem involved making _TWO_ CTEs (the second one uses the first one). My query was 29 lines long. As a guide to see if you got the answer correct, here's the first few lines of my (sorted) solution:

```
date        percent_k   perecent_d
----------  ----------  ----------
2015-01-02
2015-01-05  -0.7417199
2015-01-06  -0.3257592  -0.7417199
```

85) In my opinion, this is the hardest problem in the ladder challenge. For each month between 2015 and 2019, as in the final problem from the `03` file, we'll attach Yum! stock data to the `transactions` data. Let's condense our `yum` data to show relevant monthly statistics. That is, for each month of each year, create a table with the following columns:
* Year
* Month
* The total revenue from our company in `transactions`
* The monthly low (ie, the lowest low that month)
* The monthly high (ie, the highest high that month)
* The monthly open (ie, the opening value in the first trading day that month)
* The monthly close (ie, the closing value of the last trading day that month)
* The total trade volume of Yum! that month

My solution to this problem is 38 lines long. For reference, here are the top 3 rows of the solution:

```
year        month       company_revenue  yum_low     yum_high    yum_open    yum_close   yum_volume
----------  ----------  ---------------  ----------  ----------  ----------  ----------  ----------
2015        01          $14,106          49.88       53.87       53.12       53.28       89,074,400
2015        02          $20,739          50.68       59.29       56.95       58.31       98,621,800
2015        03          $21,232          54.92       59.55       58.23       58.81       108,827,60
```

Some hints:
* I used two CTEs, but you may not need to.
* You'll need the `FIRST_VALUE()` and `LAST_VALUE()` window functions.
* To find the first in each month, you'll need the `PARTITION BY` statement in those window functions. `PARTITION BY` acts a lot like `GROUP BY`, but for window functions.
