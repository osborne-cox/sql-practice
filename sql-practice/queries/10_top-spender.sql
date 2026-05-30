-- Задача: пользователь с наибольшей суммой заказов
-- Зачем в тестировании: находим VIP-клиента и заодно проверяем агрегат SUM(total)
-- в разрезе пользователя. JOIN отсекает тех, у кого заказов нет вообще.

SELECT u.id, u.name, SUM(o.total) AS total_spent
FROM users u
JOIN orders o ON o.user_id = u.id
GROUP BY u.id, u.name
ORDER BY total_spent DESC
LIMIT 1;
