SELECT DISTINCT(t1.title) film_title, t1.name category_name, t1.rental_count
FROM
    (SELECT f.title, ca.name, 
    COUNT(r.rental_id) OVER (PARTITION BY f.title) AS rental_count
    FROM film f
    JOIN film_category fc
    ON f.film_id = fc.film_id
    JOIN category ca
    ON ca.category_id = fc.category_id
    JOIN inventory i
    ON i.film_id = f.film_id
    JOIN rental r
    ON i.inventory_id = r.inventory_id) T1
ORDER BY 2