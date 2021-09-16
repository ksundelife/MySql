--***** НАПОЛНЕНИЕ БАЗЫ ДАННЫХ `itblog` *****--

INSERT INTO 
    `users`
VALUES
    (1,'rubie38','adriel23@example.org','1990-01-12 22:23:07','893bd57e073a8f332e79bcb0b841040cbc0f5726','a49c5dcd-6da9-3e8c-8ee3-6eddaebbc1db',9789444802,''),
    (2,'ofelia29','jeanie43@example.org','1982-08-21 07:21:16','7905993e34ab971ba461301c5fa8343ad9fe52ce','c781a79e-44db-3e41-bfaa-09b036e38fe8',9855656295,''),
    (3,'williamson.earnest','ondricka.zakary@example.net','1988-07-30 21:10:35','167e49694c86c1ccdac217208788ee0388dbe24c','47d78d80-57c5-32a5-a090-dc3991af6e78',9447857720,''),
    (4,'rossie.jacobi','herzog.jimmie@example.net',NULL,'1d3dfd33341a1b6543af1ced76a2f4a6a52ed61f',NULL,9375834867,''),
    (5,'dan.gislason','cschuster@example.net',NULL,'8adad68ec9814bdacc76209dd531c04409777081',NULL,9192237414,''),
    (6,'patricia23','tkihn@example.net','2013-12-23 00:03:36','81c00d5a56dbaaf7d323f931e0c5691f894b7aeb','74556cde-fb5c-3422-bbfa-5514e584917b',9952905692,''),
    (7,'cortiz','krajcik.eusebio@example.com','1995-02-28 23:00:37','3f43faf52b8c12c30adeacc90b65e35cb7f58ec4','b31e0368-27fa-3f65-88d9-817873b61f35',9826183227,''),
    (8,'maxine27','gabe.runolfsson@example.com','1974-11-13 05:34:36','03ea37ad63a3912d3c5aefb5c4fbb09594162bce','d3d5e84a-7374-38f8-85b9-42d3b0c725c9',9443855847,''),
    (9,'lorine.hilpert','leonel.cronin@example.net','2019-11-07 20:27:06','b66db246e380b0fccaef43564297f5c75e1b4840','b3123d01-7f3d-320c-9b31-89e16aff843b',9236983409,'\0'),
    (10,'lenore53','ubergnaum@example.net',NULL,'4fc067155badac509576eabb4febb0686759ac94',NULL,9042652244,'\0');

INSERT INTO
    `roles`
VALUES
    (1,1,'user'),
    (2,2,'user'),
    (3,3,'admin'),
    (4,4,'user'),
    (5,5,'user'),
    (6,6,'admin'),
    (7,7,'user'),
    (8,8,'user'),
    (9,9,'user'),
    (10,10,'user');

INSERT INTO
    `media_types`
VALUES
    (1,'JPEG','2014-11-07 12:04:48','1980-08-19 19:35:35'),
    (2,'PNG','2010-01-14 23:27:18','2016-02-14 22:13:08'),
    (3,'GIF','2021-01-10 21:57:35','1983-05-05 03:28:02'),
    (4,'TIFF','2018-02-04 23:27:38','1983-01-12 16:39:37');

INSERT INTO
    `media`
VALUES
    (1,1,1,'afm',1599,NULL,'2002-09-17 13:18:28','1976-06-28 23:00:31'),
    (2,2,2,'gph',957,NULL,'1979-03-18 09:38:08','2010-02-05 05:43:06'),
    (3,3,3,'ief',2531,NULL,'1971-01-15 01:07:41','2004-11-18 21:14:14'),
    (4,4,4,'ptid',764,NULL,'2006-01-18 09:57:24','1977-08-16 16:42:55'),
    (5,1,5,'opml',2315,NULL,'1980-08-06 12:05:32','2002-06-04 11:28:39'),
    (6,2,6,'dwf',2029,NULL,'1978-10-27 00:04:59','1989-06-30 16:25:07'),
    (7,3,7,'std',2715,NULL,'2020-05-27 11:27:36','1983-06-11 09:53:22'),
    (8,4,8,'ogv',983,NULL,'1981-10-21 20:22:19','2016-02-17 22:57:05'),
    (9,1,9,'mts',1151,NULL,'2013-01-29 19:46:18','1975-11-26 08:13:21'),
    (10,2,10,'xop',1097,NULL,'1991-06-13 21:45:29','2001-09-28 17:27:23'),
    (11,3,3,'otg',1827,NULL,'1991-05-10 08:04:02','2018-04-20 09:56:10'),
    (12,4,3,'skd',1002,NULL,'2006-08-20 11:27:30','1998-12-31 09:29:45'),
    (13,1,3,'qt',2397,NULL,'2008-01-04 04:38:28','2009-04-03 02:03:26'),
    (14,2,6,'spl',782,NULL,'1997-07-09 11:46:20','1990-12-14 07:43:17'),
    (15,3,6,'n3',1130,NULL,'1985-07-14 23:34:28','2002-10-19 23:17:55'),
    (16,4,6,'std',2788,NULL,'2003-03-10 03:20:30','1997-11-17 20:32:23'),
    (17,1,3,'svd',2785,NULL,'2003-05-29 06:11:56','2014-09-03 05:07:48'),
    (18,2,3,'flac',831,NULL,'1971-05-02 06:58:49','1984-10-29 18:17:36'),
    (19,3,6,'sid',2576,NULL,'1976-01-09 09:19:43','1991-08-03 10:48:50'),
    (20,4,6,'uvvs',2642,NULL,'1987-08-04 02:09:45','1973-05-15 13:58:38');

INSERT INTO
    `pictures`
VALUES
    (1,11,'2020-06-12 00:51:32'),
    (2,12,'2019-07-01 08:34:32'),
    (3,13,'2014-01-04 00:02:20'),
    (4,14,'1975-11-14 20:41:18'),
    (5,15,'1983-08-31 11:39:42'),
    (6,16,'2016-07-13 18:50:10'),
    (7,17,'2005-07-29 21:39:37'),
    (8,18,'2003-06-28 18:33:34'),
    (9,19,'2016-01-17 08:38:17');

INSERT INTO
    `photos`
VALUES
    (1,1),
    (2,2),
    (3,3),
    (4,6),
    (5,7),
    (6,9);

INSERT INTO 
    `categories`
VALUES
    (1,'Web development','1987-10-07 12:00:54','1991-07-18 18:04:14'),
    (2,'System administration','1970-12-15 23:04:29','2019-02-02 09:52:28'),
    (3,'Mobile Development','1985-12-22 09:57:56','1970-07-18 20:48:10'),
    (4,'Computer Network','2011-01-10 07:58:03','1970-11-15 12:40:10'),
    (5,'System Software','1982-07-28 04:23:18','1974-04-21 08:54:59');

INSERT INTO
    `articles`
VALUES 
    (1,3,1,'Dodo suddenly.','Caterpillar. \'Well, perhaps you haven\'t found it so yet,\' said Alice; \'but when you have to turn.',11,'Et et nihil vel qui. Id dolores repudiandae nostrum odit quae suscipit et. Dolores dignissimos necessitatibus natus.','1976-09-05 04:01:24','1977-02-20 08:58:51'),
    (2,6,2,'The Queen smiled.','QUITE as much use in the trial one way up as the other.\' As soon as the jury had a little.',12,'Molestiae autem autem esse quis doloribus ut asperiores. Quis fugit nam et modi quibusdam. Impedit cupiditate molestias voluptatem accusantium et neque nisi.','1986-01-06 06:24:20','1994-09-12 03:32:02'),
    (3,3,3,'Rabbit actually.','Gryphon, sighing in his turn; and both creatures hid their faces in their paws. \'And how many.',13,'Provident vel voluptatem dolores omnis. Quasi sit magni rem sunt repellendus. Esse recusandae velit facere incidunt.','1979-01-19 07:52:31','1970-03-20 07:32:21'),
    (4,6,4,'This time there.','Alice to herself, \'in my going out altogether, like a candle. I wonder what I should be like.',14,'Itaque nihil veniam eligendi consequatur omnis enim. Hic commodi adipisci alias et adipisci. Et atque dignissimos labore nihil quis magnam mollitia. Sit vel dicta sunt culpa alias.','1976-09-19 08:36:02','2009-06-09 18:28:36'),
    (5,3,5,'And when I grow.','Pig!\' She said the last word with such sudden violence that Alice quite jumped; but she saw in.',15,'Aut nihil est dolores earum quia qui perspiciatis. Aut sequi dolor et consequuntur culpa. Excepturi eum facilis modi porro quibusdam magni.','1990-02-03 00:52:19','2007-01-05 01:21:57'),
    (6,3,3,'Dormouse,\' the.','Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, that I should think.',16,'Itaque iusto quia non veniam et est. Omnis eligendi animi sunt ratione dicta voluptatibus. Provident nobis laborum ut blanditiis velit voluptates. Et dignissimos necessitatibus magni vitae.','1976-04-17 06:35:43','1991-08-21 15:26:29'),
    (7,3,2,'Alice, a little.','I\'ve often seen a cat without a grin,\' thought Alice; \'but a grin without a cat! It\'s the most.',17,'Ut sapiente ut quaerat tempore consequatur voluptas voluptate. Architecto est iste nulla. Omnis sed repellendus id qui aut libero.','2018-11-15 09:21:45','2017-09-05 20:29:39'),
    (8,6,3,'Hatter. He came in.','Alice dodged behind a great thistle, to keep herself from being run over; and the moment she.',18,'Et autem voluptate natus voluptas. Delectus sequi sed id vel in. Explicabo sint reiciendis tempore non tempore.\nId nostrum eos atque. Amet praesentium consequatur saepe.','2002-09-12 19:03:59','1970-05-30 21:18:08'),
    (9,3,4,'I\'M a Duchess,\'.','Alice, and, after waiting till she fancied she heard the Rabbit just under the window, she.',19,'Exercitationem et aspernatur aut. Veniam ut sed ullam voluptas libero. Similique alias exercitationem ut eveniet.','1999-05-12 11:38:26','2005-06-30 11:20:17'),
    (10,3,5,'Alice quite.','English. \'I don\'t quite understand you,\' she said, as politely as she could. \'The Dormouse is.',11,'Blanditiis porro asperiores consequuntur aut dolor. Nesciunt accusantium quidem ratione facilis. Maiores aut sint magni facere. Quia animi et ex atque aut optio minus.','2005-11-18 02:08:01','1989-06-21 04:37:51');

INSERT INTO
    `profiles`
VALUES
    (1,'Jordan','Tillman','m','1999-02-08',1,'1985-01-15 17:08:19'),
    (2,'Santos','Grimes','m','2020-11-22',2,'1985-02-25 19:37:36'),
    (3,'Alessia','Lang','f','1996-09-08',3,'2014-04-04 21:05:13'),
    (4,'Alene','Block','f','1978-05-25',NULL,'1973-09-27 19:43:41'),
    (5,'Adolf','Greenholt','m','2004-04-20',NULL,'1981-09-21 21:50:17'),
    (6,'Eriberto','Wisozk','m','1984-05-31',6,'1995-07-30 18:20:48'),
    (7,'Araceli','Schamberger','f','2007-12-27',7,'1981-01-23 08:08:53'),
    (8,'Florine','Kassulke','m','1996-02-22',NULL,'1981-03-07 19:37:34'),
    (9,'Kane','Heaney','f','1979-06-26',9,'2019-02-05 04:25:28'),
    (10,'Heber','Hayes','m','2018-11-30',NULL,'1983-08-08 16:27:33');

INSERT INTO 
    `comments`
VALUES
    (1,1,1,1,'Web development it is cool','2020-12-07 12:00:54'),
    (2,1,2,1,'System administration it is cool','2020-12-08 23:04:29'),
    (3,2,1,1,'Mobile Development it is cool','2020-12-09 09:57:56'),
    (4,3,1,1,'do not fight we all love something the most','2020-12-10 07:58:03'),
    (5,6,2,1,'each area is good in its own way','2020-12-11 04:23:18'),
    (6,6,1,1,'each area is good in its own way','2020-12-11 23:04:29'),
    (7,7,2,1,'Mobile Development it is cool','2020-12-12 09:57:56'),
    (8,3,2,1,'do not fight we all love something the most','2020-12-13 07:58:03');

INSERT INTO
    `views`
VALUES
    (1,1,1,'2020-06-12 00:51:32'),
    (2,9,2,'2019-07-01 08:34:32'),
    (3,8,3,'2014-01-04 00:02:20'),
    (4,7,3,'1975-11-14 20:41:18'),
    (5,6,3,'1983-08-31 11:39:42'),
    (6,1,2,'2016-07-13 18:50:10'),
    (7,1,3,'2005-07-29 21:39:37'),
    (8,3,6,'2003-06-28 18:33:34'),
    (9,1,6,'2020-01-17 08:38:17');