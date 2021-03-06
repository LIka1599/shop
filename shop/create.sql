CREATE DATABASE shop;
USE shop;

DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS product_image;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS image;


CREATE TABLE category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    description TEXT
);


CREATE TABLE image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(250),
    image_alt VARCHAR(20)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    price INT NOT NULL,
    discount FLOAT,
    description TEXT,
    main_category_id INT NOT NULL,
    main_img_id INT NOT NULL,
    FOREIGN KEY (main_category_id) REFERENCES category (category_id) ON DELETE CASCADE,
    FOREIGN KEY (main_img_id) REFERENCES image (image_id) ON DELETE CASCADE
);

CREATE TABLE product_category (
    product_id INT,
    category_id INT,
    FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
    PRIMARY KEY (category_id, product_id)
);

CREATE TABLE product_image (
    product_id INT ,
    image_id INT ,
    FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE CASCADE,
    FOREIGN KEY (image_id) REFERENCES image (image_id) ON DELETE CASCADE,
    PRIMARY KEY (product_id, image_id)
);

INSERT INTO category (name, description)
VALUES ('Мужчинам', 'Раздел мужской одежды'),
('Женщинам', 'Раздел женской одежды'),
('Юбки', 'Раздел с юбками'),
('Шорты', 'Раздел с шортами'),
('Джинсы', 'Раздел с джинсами'),
('Кофты', 'Раздел с кофтами');

INSERT INTO image (image, image_alt)
 VALUES ('image_1_1.jpg', 'jeans'),
 ('image_1_2.jpg', 'jeans'),
 ('image_1_3.jpg', 'jeans'),
 ('image_2_1.jpg', 'skirt'),
 ('image_2_2.jpg', 'skirt'),
 ('image_2_3.jpg', 'skirt'),
 ('image_3_1.jpg', 'skirt'),
 ('image_3_2.jpg', 'skirt'),
 ('image_3_3.jpg', 'skirt'),
 ('image_4_1.jpg', 'skirt'),
 ('image_4_2.jpg', 'skirt'),
 ('image_4_3.jpg', 'skirt'), 
 ('image_5_1.jpg', 'skirt'),
 ('image_5_2.jpg', 'skirt'),
 ('image_5_3.jpg', 'skirt'),
 ('image_6_1.jpg', 'shorts'),
 ('image_6_2.jpg', 'shorts'),
 ('image_6_3.jpg', 'shorts'),
  ('image_7_1.jpg', 'shorts'),
 ('image_7_2.jpg', 'shorts'),
 ('image_7_3.jpg', 'shorts'),
 ('image_7_4.jpg', 'shorts'),
  ('image_8_1.jpg', 'shorts'),
 ('image_8_2.jpg', 'shorts'),
 ('image_8_3.jpg', 'shorts'),
 ('image_8_4.jpg', 'shorts'),
  ('image_9_1.jpg', 'shorts'),
 ('image_9_2.jpg', 'shorts'),
 ('image_9_3.jpg', 'shorts'),
  ('image_10_1.jpg', 'shorts'),
 ('image_10_2.jpg', 'shorts'),
 ('image_10_3.jpg', 'shorts'),
  ('image_11_1.jpg', 'shorts'),
 ('image_11_2.jpg', 'shorts'),
 ('image_11_3.jpg', 'shorts'),
   ('image_12_1.jpg', 'shorts'),
 ('image_12_2.jpg', 'shorts'),
 ('image_12_3.jpg', 'shorts'),
   ('image_13_1.jpg', 'shorts'),
 ('image_13_2.jpg', 'shorts'),
 ('image_13_3.jpg', 'shorts'),
    ('image_14_1.jpg', 'shorts'),
 ('image_14_2.jpg', 'shorts'),
 ('image_14_3.jpg', 'shorts'),
    ('image_15_1.jpg', 'shorts'),
 ('image_15_2.jpg', 'shorts'),
 ('image_15_3.jpg', 'shorts'),
    ('image_16_1.jpg', 'shorts'),
 ('image_16_2.jpg', 'shorts'),
 ('image_16_3.jpg', 'shorts'),
 ('image_17_1.jpg', 'jeans'),
 ('image_17_2.jpg', 'jeans'),
 ('image_17_3.jpg', 'jeans'),
  ('image_17_4.jpg', 'jeans'),
 ('image_18_1.jpg', 'jeans'),
 ('image_18_2.jpg', 'jeans'),
 ('image_18_3.jpg', 'jeans'),
 ('image_19_1.jpg', 'jeans'),
 ('image_19_2.jpg', 'jeans'),
 ('image_19_3.jpg', 'jeans'),
 ('image_20_1.jpg', 'jeans'),
 ('image_20_2.jpg', 'jeans'),
 ('image_20_3.jpg', 'jeans'),
 ('image_21_1.jpg', 'jeans'),
 ('image_21_2.jpg', 'jeans'),
 ('image_21_3.jpg', 'jeans'),
 ('image_22_1.jpg', 'jeans'),
 ('image_22_2.jpg', 'jeans'),
 ('image_22_3.jpg', 'jeans'),
 ('image_23_1.jpg', 'jeans'),
 ('image_23_2.jpg', 'jeans'),
 ('image_23_3.jpg', 'jeans'),
 ('image_24_1.jpg', 'jeans'),
 ('image_24_2.jpg', 'jeans'),
 ('image_24_3.jpg', 'jeans'),
 ('image_25_1.jpg', 'sweater'),
 ('image_25_2.jpg', 'sweater'),
 ('image_25_3.jpg', 'sweater');


INSERT INTO product (name, price, discount, description, main_category_id, main_img_id)
VALUES ('Базовая мини-юбка со складками', 2500, 0.1, 'Базовая мини-юбка синего цвета со складками', 3, 4),
('Базовая мини-юбка', 2500, 0.1, 'Базовая юбка мини с плиссировкой. Струящаяся ткань, застежка на молнию и нашивка.', 3, 7),
('Мини-юбка со средней посадкой', 2700, 0.2, 'Мини-юбка со средней посадкой и боковым разрезом.', 3, 10),
('Мини-юбка внахлест со средней посадкой', 2000, 0.5, 'Мини-юбка внахлест со средней посадкой. Модель представлена в нескольких расцветках.', 3, 13),
('Джинсовые шорты mom fit', 2200, 0.3, 'Джинсовые шорты mom fit с разрезами и необработанной кромкой по низу. Пять карманов, шлевки и застежка на молнию и пуговицу.', 4, 16),
('Базовые шорты-джоггеры', 1500, 0.3, 'Базовые шорты-джоггеры. Эластичный пояс на шнурке и карманы.', 4, 19),
('Джинсовые шорты', 2000, 0.1, 'Джинсовые шорты с отворотами по низу', 4, 23),
('Черная юбка-шорты с пайетками', 1500, 0.6, 'Черная юбка-шорты с пайетками. Бахрома по низу и подкладка.', 4, 27),
('Голубые джинсовые шорты прямого кроя с пятью карманами', 2500, 0.3, 'Голубые джинсовые шорты прямого кроя с пятью карманами. Шлевки и застежка на молнию и пуговицу. Изготовлены из слегка эластичного хлопка.', 4, 30),
('Базовые шорты-джоггеры', 1800, 0.1, 'Базовые шорты-джоггеры. Эластичный пояс на шнурке, карманы. Цвета в ассортименте. Изготовлены из хлопка.', 4, 33),
('Шорты-джоггеры с блоками голубого и белого цвета', 1500, 0.1, 'Шорты-джоггеры с блоками голубого и белого цвета. Эластичный пояс на шнурке, карманы.', 4, 36),
('Шорты в стиле чинос облегающего кроя', 2500, 0.1, 'Шорты в стиле чинос облегающего кроя. Эластичный пояс на шнурке и карманы.', 4, 39),
('Джинсовые шорты облегающего кроя с разрезами на штанинах', 2900, 0.1, 'Джинсовые шорты облегающего кроя с разрезами на штанинах. Пять карманов, шлевки, застежка на молнию и пуговицу. Цвета в ассортименте. Изготовлены из хлопка.', 4, 42),
('Шорты из облегченной джинсовой ткани', 2500, 0.1, 'Шорты из облегченной джинсовой ткани. Пять карманов, шлевки, застежка на молнию и пуговицу. Изготовлены из хлопка.', 4, 45),
('Велосипедки с широким поясом.', 1500, 0.1, 'Велосипедки комфортного кроя из слегка эластичной ткани с широким поясом.', 4, 48),
('Джинсы с очень широкими штанинами из синей ткани', 4000, 0.2, 'Джинсы с очень широкими штанинами из синей ткани. Пять карманов, шлевки. Застегиваются на молнию и пуговицу. Длина шагового шва: 84,1 см.', 5, 1),
('Джинсы с широкими штанинами', 3000, 0.2, 'Джинсы с широкими штанинами. Высокая посадка, пять карманов, шлевки. Застегиваются на молнию и пуговицу. Длина шагового шва: 84,5 см.', 5, 51),
('Джинсы прямого кроя с высокой посадкой и кокеткой', 2500, 0.2, 'Джинсы прямого кроя с высокой посадкой и кокеткой. Пять карманов, шлевки. Застегиваются на молнию и пуговицу.', 5, 55),
('Базовые джинсы mom fit из плотной ткани', 2000, 0.1, 'Базовые джинсы mom fit из плотной ткани. Пять карманов, шлевки. Застегиваются на молнию и пуговицу. Длина шагового шва: 68,5 см.', 5, 58),
('Джинсы с прямыми штанинами', 3000, 0.2, 'Джинсы с прямыми штанинами. Низкая посадка, пять карманов, шлевки. Застегиваются на молнию и пуговицу. Длина шагового шва: 81,5 см.', 5, 61),
('Расклешенные джинсы с высокой посадкой', 4000, 0.2, 'Расклешенные джинсы с высокой посадкой. Пять карманов, шлевки, разрезы по низу. Застегиваются на молнию и пуговицу. Изготовлены из хлопка. Длина шагового шва: 84 см.', 5, 64),
('Темно-синие джинсы зауженного кроя с пятью карманами и шлевками на поясе', 3500, 0.2, 'Темно-синие джинсы зауженного кроя с пятью карманами и шлевками на поясе. Застегиваются на молнию и пуговицу.', 5, 67),
('Базовые джинсы стандартного кроя с пятью карманами и шлевками', 4200, 0.2, 'Базовые джинсы стандартного кроя с пятью карманами и шлевками. Застегиваются на молнию и пуговицу.', 5, 70),
('Базовые джинсы стандартного кроя с пятью карманами и шлевками', 3000, 0.1, 'Базовые джинсы стандартного кроя с пятью карманами и шлевками. Застегиваются на молнию и пуговицу.', 5, 73),
('Толстовка с длинными рукавами и круглым вырезом', 2000, 0.1, 'Толстовка с длинными рукавами и круглым вырезом. Круглый принт, эффект омбре.', 6, 76),
('Базовая укороченная кофта', 1400, 0.1, 'Базовая укороченная розовая кофта', 6, 7),
('Укороченная кофта с длинным рукавом', 1400, 0.1, 'Укороченная кофта с длинным рукавом коричневого цвета.', 6, 10),
('Укороченная кофта с длинным рукавом', 2000, 0.1, 'Укороченная кофта с длинным рукавом зеленого цвета.', 6, 13),
('Свитшот с надписью', 2400, 0.2, 'Серый свитшот с надписью зелегого цвета.', 6, 19),
('Базовая белая футболка', 1400, 0.1, 'Базовая белая футболка с широкими рукавами, хлопок.', 6, 23),
('Серый базовый свитшот', 1400, 0.1, 'Серый базовый свитшот с капюшоном.', 6, 30),
('Черный базовый свитшот', 2400, 0.1, 'Черный базовый свитшот с капюшоном.', 6, 36),
('Шорты-джоггеры белого цвета', 2500, 0.2, 'Шорты-джоггеры с блоками голубого и белого цвета. Эластичный пояс на шнурке, карманы.', 4, 30),
('Шорты облегающего кроя', 2200, 0.1, 'Шорты в стиле чинос облегающего кроя. Эластичный пояс на шнурке и карманы.', 4, 33),
('Джинсовые шорты облегающего кроя ', 3400, 0.1, 'Джинсовые шорты облегающего кроя с разрезами на штанинах. Пять карманов, шлевки, застежка на молнию и пуговицу. Цвета в ассортименте. Изготовлены из хлопка.', 4, 36);



INSERT INTO product_category (product_id, category_id)
 VALUES (1, 3),
(1, 2),
(2, 3),
(2, 2),
(3, 3),
(3, 2),
(4, 3),
(4, 2),
(5, 4),
(5, 2),
(6, 4),
(6, 2),
(7, 4),
(7, 2),
(8, 4),
(8, 2),
(8, 3),
(9, 4),
(9, 1),
(10, 4),
(10, 1),
(11, 4),
(11, 1),
(12, 4),
(12, 1),
(13, 4),
(13, 1),
(14, 4),
(14, 1),
(15, 4),
(15, 2),
(16, 5),
(16, 2),
(17, 5),
(17, 2),
(18, 5),
(18, 2),
(19, 5),
(19, 2),
(20, 5),
(20, 2),
(21, 5),
(21, 2),
(22, 5),
(22, 1),
(23, 5),
(23, 1),
(24, 5),
(24, 1),
(25, 6),
(25, 2),
(26, 6),
(26, 2),
(27, 6),
(27, 2),
(28, 6),
(28, 2),
(29, 6),
(29, 2),
(30, 6),
(30, 2),
(31, 6),
(31, 1),
(32, 6),
(32, 1),
(33, 4),
(33, 1),
(34, 4),
(34, 1),
(35, 4),
(35, 1);

INSERT INTO product_image (product_id, image_id)
 VALUES (1, 4),
(1, 5),
(1, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(5, 16),
(5, 17),
(5, 18),
(6, 19),
(6, 20),
(6, 21),
(7, 23),
(7, 24),
(7, 25),
(8, 27),
(8, 28),
(8, 29),
(9, 30),
(9, 31),
(9, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 36),
(11, 37),
(11, 38),
(12, 39),
(12, 40),
(12, 41),
(13, 42),
(13, 43),
(13, 44),
(14, 45),
(14, 46),
(14, 47),
(15, 48),
(15, 49),
(15, 50),
(16, 1),
(16, 2),
(16, 3),
(17, 51),
(17, 52),
(17, 53),
(18, 55),
(18, 56),
(18, 57),
(19, 58),
(19, 59),
(19, 60),
(20, 61),
(20, 62),
(20, 63),
(21, 64),
(21, 65),
(21, 66),
(22, 67),
(22, 68),
(22, 69),
(23, 70),
(23, 71),
(23, 72),
(24, 73),
(24, 74),
(24, 75),
(25, 76),
(25, 77),
(25, 78),
(26, 7),
(26, 8),
(27, 10),
(27, 11),
(28, 13),
(28, 14),
(29, 19),
(29, 20),
(29, 22),
(30, 23),
(30, 26),
(31, 20),
(31, 31),
(32, 36),
(32, 37),
(33, 30),
(33, 31),
(33, 32),
(34, 33),
(34, 34),
(34, 35),
(35, 36),
(35, 37),
(35, 38);