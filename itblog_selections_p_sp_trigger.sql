-------------------------
-- ***** ВЫБОРКИ ***** --
-------------------------

-- Пользователи которые не подтвердили регистрацию и не получили токен
SELECT
	user_id,
    CONCAT (firstname,' ',lastname) AS users
FROM profiles
WHERE user_id IN
	    (SELECT id FROM users WHERE email_verified_at IS NULL);

-- Сколько комментариев написал каждый из пользователей
SELECT COUNT(id) AS cnt_comments,
    user_id
FROM comments
GROUP BY user_id;

-- Сколько комментариев написал каждый из пользователей (с ФИ пользователя)
SELECT COUNT(id) AS cnt_comments,
    user_id,
    (SELECT CONCAT (firstname,' ',lastname) AS us FROM profiles p WHERE user_id = comments.user_id) AS f_l_name
FROM comments
GROUP BY user_id;

-- Пользователи без аватарки
SELECT
	user_id,
    CONCAT (firstname,' ',lastname) AS us
FROM profiles
WHERE photo_id IS NULL;

-- Пользователь который загрузил самый большой по размеру медиафайл его статус и значение этого размера
SELECT
	(SELECT roles_name FROM roles r WHERE user_id = m.user_id) AS roles_name,
    CONCAT (firstname,' ',lastname) AS u_name,
	m.size
FROM profiles p
	RIGHT JOIN media m ON p.user_id = m.user_id
GROUP BY m.id
ORDER BY m.size DESC
LIMIT 1;

-- Пользователь который загрузил самый большой по размеру медиафайл, значение размера медиафайла, тип медиафайла
SELECT 
    CONCAT (firstname,' ',lastname) AS us,
	m.size,
	mt.name AS media_types_name
FROM profiles p
	JOIN media m ON p.user_id = m.user_id
	JOIN media_types mt ON m.media_type_id = mt.id
GROUP BY m.id
ORDER BY m.size DESC
LIMIT 1;

-- Статья с наибольшим количеством лайков
SELECT
    article_id,
    COUNT(*) AS likes_count
FROM views
GROUP BY article_id
ORDER BY likes_count DESC
LIMIT 1;

-- Статья первая по дате добавления, категория статьи, автор статьи, заголовок статьи, и имя картинки статьи
SELECT
	a.id,
	a.created_at,
	c2.name,
	CONCAT (p2.firstname,' ',p2.lastname) AS us,
    title,
    m.filename 
FROM articles a
	JOIN profiles p2 ON a.author_id = p2.user_id
	JOIN categories c2 ON a.categorie_id = c2.id
	JOIN media m ON a.media_id = m.id
GROUP BY a.id
ORDER BY a.created_at
LIMIT 1;

-- Сколько статей в каждой из категорий
SELECT
    c2.name,
    COUNT(*) AS articles_count
FROM articles a
    JOIN categories c2 ON a.categorie_id = c2.id
GROUP BY c2.name
ORDER BY articles_count DESC;



-------------------------------
-- ***** ПРЕДСТАВЛЕНИЯ ***** --
-------------------------------

-- Статьи по дате добавления с данными: категория статьи, автор статьи, заголовок статьи, имя картинки стать и количество комментариев
-- Под задачку, описанную выше, для анализа контента создаем представление
DROP VIEW IF EXISTS articles_statistics;
CREATE VIEW articles_statistics AS
SELECT
	a.id AS article_id,
	a.created_at,
	c2.name AS categorie_name,
	CONCAT (p2.firstname,' ',p2.lastname) AS user,
    title AS article_title,
    m.filename AS article_pictures,
    COUNT(c.article_id) AS comment_count
FROM articles a
	JOIN profiles p2 ON a.author_id = p2.user_id
	JOIN categories c2 ON a.categorie_id = c2.id
	JOIN media m ON a.media_id = m.id
	LEFT JOIN comments c ON a.id = c.article_id
GROUP BY a.id;

/* Список актуальных пользователей, кроме: пользователей со статусом "админ" и
не подтвердивших личность через почту */
DROP VIEW IF EXISTS current_users;
CREATE VIEW current_users AS
SELECT
   u.id,
   CONCAT (p2.firstname,' ',p2.lastname) AS user
FROM users u
    JOIN profiles p2 ON u.id = p2.user_id
    JOIN roles r ON p2.user_id = r.user_id 
WHERE (r.roles_name = 'user' AND u.is_deleted <> '0' AND u.email_verified_at IS NOT NULL);



------------------------------------
-- ***** ХРАНИМЫЕ ПРОЦЕДУРЫ ***** --
------------------------------------

-- выборка статей по категории 
DROP PROCEDURE IF EXISTS `sp_selection_category`;

DELIMITER //

CREATE PROCEDURE `sp_selection_category`(IN category_id int(1))
BEGIN
    SELECT
        c.name AS categorie_name,
        CONCAT (p.firstname,' ',p.lastname) AS user,
        title,
        excerpt,
        m.filename,
        a.created_at
    FROM articles a
        JOIN profiles p ON a.author_id = p.user_id
        JOIN media m ON a.media_id = m.id
        JOIN categories c ON a.categorie_id = c.id
    WHERE c.id = category_id
    GROUP BY a.id
    ORDER BY a.created_at;

END//

DELIMITER ;

--------------------------
-- ***** ТРИГГЕРЫ ***** --
--------------------------

/* при каждом создании записи в таблице articles в таблицу logs
помещается время и дата создания записи,
название таблицы, идентификатор первичного ключа и содержимое поля title.*/

DROP TRIGGER IF EXISTS log_article;
DELIMITER //
CREATE TRIGGER log_article AFTER INSERT ON articles
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, table_name, str_id, name_value)
	VALUES (NOW(), 'articles', NEW.id, NEW.title);
END //
DELIMITER ;

-- для теста сперва удалим запись статью под id = 10
DELETE FROM articles WHERE id = 10;
-- вставляем ее заново
INSERT INTO
    `articles`
VALUES
	(10,3,5,'Alice quite.','English. \'I don\'t quite understand you,\' she said, as politely as she could. \'The Dormouse is.',11,'Blanditiis porro asperiores consequuntur aut dolor. Nesciunt accusantium quidem ratione facilis. Maiores aut sint magni facere. Quia animi et ex atque aut optio minus.','2005-11-18 02:08:01','1989-06-21 04:37:51');

-- проверяем таблицу logs
SELECT
    created_at,
	table_name,
	str_id
FROM logs;
