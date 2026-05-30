-- Задача: топ-3 самых дорогих товара
-- Зачем в тестировании: быстрый sanity-check каталога. Если на верхушке вылезла
-- цена в миллион или отрицательное число — где-то протёк баг с ценой.

SELECT product_name, price
FROM order_items
ORDER BY price DESC
LIMIT 3;
