-- Задача: заказы, где сумма позиций не сходится с полем total
-- Зачем в тестировании: ловим расхождение между корзиной (order_items) и итогом
-- заказа (orders.total). Частый баг при скидках, промокодах и округлении.
-- На текущих данных всё бьётся, поэтому запрос вернёт 0 строк — и это правильно.
-- Хочешь увидеть баг руками: поменяй цену любого товара в schema.sql и перезапусти.

SELECT o.id,
       o.total                          AS order_total,
       SUM(oi.price * oi.quantity)      AS items_sum
FROM orders o
JOIN order_items oi ON oi.order_id = o.id
GROUP BY o.id, o.total
HAVING o.total <> SUM(oi.price * oi.quantity);
