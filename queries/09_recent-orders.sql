-- Задача: заказы за последние 30 дней
-- Зачем в тестировании: проверка свежих данных. Новые заказы должны попадать
-- в отчётный период. У нас created_at заполняется через NOW(), так что под фильтр
-- попадут все пять — что и подтверждает, что фильтр по дате работает.

SELECT id, user_id, total, status, created_at
FROM orders
WHERE created_at > NOW() - INTERVAL '30 days'
ORDER BY created_at DESC;
