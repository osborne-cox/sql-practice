-- Задача: пользователи, у которых нет ни одного заказа
-- Зачем в тестировании: смотрим, кто зарегистрировался, но не купил, или чей заказ
-- не сохранился. LEFT JOIN тянет всех юзеров, а IS NULL отсекает тех, у кого заказы есть.

SELECT u.id, u.name, u.email
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
WHERE o.id IS NULL;
