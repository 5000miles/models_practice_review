# Quiz 4 - Zecheng Chang

### Q1

``` sql
SELECT *
FROM animals
LIMIT 10;
```

---

### Q2

```sql
SELECT DISTINCT breed
FROM animals;
```


---

### Q3

```sql
SELECT
age, weight
FROM animals
WHERE color = 'black' AND type = 'dog';
```

---

### Q4
```sql
SELECT
type, breed
FROM animals
WHERE weight > 55;
```

---

### Q5

```sql
SELECT
customer_id, first_name, last_name
FROM customers
WHERE email LIKE '%@gmail.com';
```

---

### Q6

```sql
SELECT
breed, AVG(weight) avg_weight
FROM animals
GROUP BY breed
HAVING avg_weight >= 40;
```

---

### Q7

```sql
SELECT
last_name
FROM customers cus
LEFT JOIN
animals ani
ON cus.pet_id = ani.id
WHERE type = 'cat';
```

---

### Q8

```sql
SELECT
type, AVG(age) avg_age
FROM animals
GROUP BY type;
```

---

### Q9

```sql
SELECT
COUNT(*)
FROM animals ani
LEFT JOIN
locations loc
ON ani.location_id = loc.id
WHERE state = 'New York' AND type = 'rabbit';
```

---

### Q10

```sql
SELECT
ani.id Pet_ID,
breed,
customer_id,
city
FROM animals ani
LEFT JOIN
customers cus
ON ani.id = cus.pet_id
LEFT JOIN
locations loc
ON ani.location_id = loc.id
WHERE type = 'dog' AND adopted = 'Yes'
ORDER BY breed;
```
