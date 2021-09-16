/* База данных для блога "Новости в сфере IT" */

DROP DATABASE IF EXISTS `itblog`;
CREATE DATABASE `itblog`;
USE `itblog`;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	id SERIAL PRIMARY KEY,
    nickname VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    email_verified_at TIMESTAMP NULL DEFAULT NULL,
    password_hash VARCHAR(100),
    remember_token VARCHAR(100) DEFAULT NULL,
    phone BIGINT,
    is_deleted BIT DEFAULT 0
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
	user_id SERIAL PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'Фамилия',
    gender CHAR(1),
    birthday DATE,
	photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),

    INDEX users_firstname_lastname_idx(firstname, lastname),
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    roles_name ENUM('admin','user') NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT 'роли пользователей';

DROP TABLE IF EXISTS `media_types`;
CREATE TABLE `media_types`(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT 'типы медиа';

DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
	id SERIAL PRIMARY KEY,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    filename VARCHAR(255),
    `size` INT,
	metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_type_id) REFERENCES media_types(id) ON UPDATE CASCADE ON DELETE CASCADE
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
	id SERIAL PRIMARY KEY,
	media_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON delete CASCADE
);

ALTER TABLE `profiles` ADD CONSTRAINT fk_photo_id
    FOREIGN KEY (photo_id) REFERENCES photos(id)
    ON UPDATE CASCADE ON DELETE set NULL;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`(
	id SERIAL PRIMARY KEY,
    name VARCHAR(255) COMMENT 'Название категории',
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    UNIQUE unique_name(name(10))
);

DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles`(
	id SERIAL PRIMARY KEY,
    author_id BIGINT UNSIGNED NOT NULL,
    categorie_id BIGINT UNSIGNED NOT NULL,
    title VARCHAR(100) NOT NULL,
    excerpt VARCHAR(200),
    media_id BIGINT UNSIGNED NOT NULL,
    body TEXT NOT NULL,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (author_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (categorie_id) REFERENCES categories(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'Статьи';

DROP TABLE IF EXISTS `pictures`;
CREATE TABLE `pictures`(
	id SERIAL PRIMARY KEY,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (media_id) REFERENCES media(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'Картинки для статей';

DROP TABLE IF EXISTS `articles_pictures`;
CREATE TABLE `articles_pictures` (
	article_id BIGINT UNSIGNED NOT NULL,
    pictures_id BIGINT UNSIGNED NOT NULL,

    PRIMARY KEY (article_id, pictures_id),
    FOREIGN KEY (article_id) REFERENCES articles(id),
    FOREIGN KEY (pictures_id) REFERENCES pictures(id)
);

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    article_id BIGINT UNSIGNED NOT NULL,
    parent_comment_id BIGINT UNSIGNED NOT NULL COMMENT 'Идентификатор родительского комментария', 
    body TEXT NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    INDEX comments_user_id_article_id_idx(user_id, article_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES articles(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (parent_comment_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE
) COMMENT = 'Комментарии статей';


DROP TABLE IF EXISTS `views`;
CREATE TABLE `views`(
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    article_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW(),

    FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES articles(id) ON UPDATE CASCADE ON DELETE CASCADE
)COMMENT = 'Отметки лайков';

DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
	created_at DATETIME NOT NULL,
	table_name VARCHAR(55) NOT NULL,
	str_id BIGINT(10) NOT NULL,
	name_value VARCHAR(255) NOT NULL
) ENGINE = ARCHIVE;
