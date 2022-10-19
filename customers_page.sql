--Количество заказчиков
SELECT COUNT(customer_id) FROM customers;

--Уникальные сочетания городов и стран заказчиков.
SELECT country, city FROM customers
GROUP BY country, city;

--Вывести компанию заказчика и ФИО сотрудника.
--Заказчики и сотрудники из города London, а доставка идёт компанией Speedy Express.
SELECT cus.company_name, emp.last_name, emp.first_name
FROM orders
LEFT JOIN customers as cus ON cus.customer_id = orders.customer_id
LEFT JOIN employees as emp ON emp.employee_id = orders.employee_id
LEFT JOIN shippers ON shippers.shipper_id = orders.ship_via
WHERE cus.city = 'London' AND emp.city = 'London' AND shippers.company_name = 'Speedy Express';

--Найти заказчиков, не сделавших ни одного заказа. Вывести имя заказчика и customer_id.
SELECT company_name, orders.order_id
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE customers.customer_id NOT IN (SELECT customer_id FROM orders);