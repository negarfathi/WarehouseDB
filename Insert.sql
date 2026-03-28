
/*
DELETE FROM Storekeeper;
*/

INSERT INTO Storekeeper VALUES(1, ('فاطمه','شاهینی'), ARRAY ['09117278509', '09014476185'], ('ساری', 'ارتش', 'مسکار'));
INSERT INTO Storekeeper VALUES(2, ('حامد', 'فتحی'), ARRAY ['09124961960'], ('تهران', 'پروانه شمالی', 'هجدهم'));

----------------------------------------------------

/*
DELETE FROM Customer;
*/

INSERT INTO Customer VALUES(1, ('فائزه', 'فتحعلی پور'), ARRAY ['09134314385'], ('اصفهان', 'شمس آبادی', 'نگارستان'), 'زن', 24);
INSERT INTO Customer VALUES(2, ('مهراسا', 'مدانلو'), ARRAY ['09119612612'], ('قائم شهر', 'امام خمینی', 'شهید رحمتی'), 'زن', 23);
INSERT INTO Customer VALUES(3, ('هوداد', 'هاشمی'), ARRAY ['09199366225', '09329366225'], ('تهران', 'بهبودی', 'اسلامی'), 'مرد', 39);
INSERT INTO Customer VALUES(4, ('بسطام', 'قنبری'), ARRAY ['09350571307'], ('کرج', 'قلم', 'صالحی'), 'مرد', 38);
INSERT INTO Customer VALUES(5, ('مهدی', 'کهنسال'), ARRAY ['09394932587'], ('تهران', 'امیری طامه', 'ملکی 111'), 'مرد', 38);
INSERT INTO Customer VALUES(6, ('متین', 'قدوسی'), ARRAY ['09121545585'], ('تهران', '24 متری', 'ششم شرقی'), 'مرد', 17);
INSERT INTO Customer VALUES(7, ('زهرا', 'تلیکانی'), ARRAY ['09128144127'], ('همدان', 'شهید فهمیده', 'نسترن'), 'زن', 26);

----------------------------------------------------

/*
DELETE FROM Factory;
*/

INSERT INTO Factory VALUES(1, ARRAY ['011-35303000'], ('بابلسر', 'پاسداران', 'حاجی زاده'));
INSERT INTO Factory VALUES(2, ARRAY ['021-88044040'], ('تهران', 'ده دنک', 'امامزاده'));
INSERT INTO Factory VALUES(3, ARRAY ['021-66013455', '021-66013647'], ('تهران', 'قاسمی', 'گلستان'));

----------------------------------------------------

/*
DELETE FROM Warehouse;
*/

INSERT INTO Warehouse VALUES(1, 1, ARRAY ['011-32332071', '011-32332072', '011-32332073', '011-32332074'], ('بابل', 'شریعتی', 'معلم 7'), 7000);
INSERT INTO Warehouse VALUES(2, 2, ARRAY ['021-88464780', '021-88466935'], ('تهران', 'شریعتی', 'باقری'), 143);
INSERT INTO Warehouse VALUES(3, 2, ARRAY ['021-77451500', '021-77451501', '021-77451502', '021-77451503', '021-77451504', '021-77451505', '021-77451506', '021-77451507', '021-77451508', '021-77451509'], ('تهران', 'حیدرخانی', 'جبارزاده'), 308);

----------------------------------------------------
/*
DELETE FROM Responsible;
*/
INSERT INTO Responsible VALUES(1, ('زهرا', 'قربانی'), ARRAY ['09303909620', '09118619209'], ('قائم شهر', 'صالحی مازندرانی', 'البرز 5'));
INSERT INTO Responsible VALUES(2, ('نگار', 'فتحی'), ARRAY ['09394201717'], ('تهران', 'پروانه شمالی', 'هجدهم'));

----------------------------------------------------

/*
DELETE FROM Goods;
DELETE FROM Mobile;
DELETE FROM Tablet;
DELETE FROM Laptop;
*/

INSERT INTO Goods VALUES(1, 1, 20190000, 'آنر', 'Lite LLD-L21', ARRAY ['مشکی'], 'اندروید', '3 گیگابایت', '5.6 اینچ');
INSERT INTO Goods VALUES(2, 1, 20680000, 'هوآوی', 'Y7 Prime 2018', ARRAY ['طلایی', 'مشکی'], 'اندروید', '3 گیگابایت', '5.9 اینچ');
INSERT INTO Goods VALUES(3, 2, 193990000, 'اپل', 'iPhone XS Max', ARRAY ['خاکستری', 'نقره ای'], 'iOS', '4 گیگابایت', '6.5 اینچ');
INSERT INTO Goods VALUES(4, 2, 73990000, 'سامسونگ', 'Galaxy S9 Plus', ARRAY ['مشکی'], 'اندروید', '6 گیگابایت', '6.2 اینچ');
INSERT INTO Goods VALUES(5, 1, 15370000, 'سامسونگ', 'Galaxy Tab A SM-T285', ARRAY ['سفید', 'مشکی', 'نقره ای'], 'اندوید', '1.5 گیگابایت', '7 اینچ');
INSERT INTO Goods VALUES(6, 2, 273990000, 'اپل', 'iPad Pro 2018', ARRAY ['خاکستری'], 'iOS', '6 گیگابایت', '12.9 اینچ');
INSERT INTO Goods VALUES(7, 2, 263990000, 'مایکروسافت', 'Surface Pro 2017 - E', ARRAY ['سفید', 'مشکی', 'نقره ای'], 'ویندوز', '16 گیگابایت', '12.3 اینچ');
INSERT INTO Goods VALUES(8, 2, 245000000, 'لنوو', 'ThinkPad X1 Carbon - A', ARRAY ['مشکی'], 'Microsoft Windows 10', '8 گیگابایت', '14 اینچ');
INSERT INTO Goods VALUES(9, 2, 197990000, 'ایسوس', 'ROG Strix GL503VM - D', ARRAY ['مشکی'], 'DOS', '24 گیگابایت', '15.6 اینچ');

INSERT INTO Mobile VALUES(1, 1, 20190000, 'آنر', 'Lite LLD-L21', ARRAY ['مشکی'], 'اندروید', '3 گیگابایت', '5.6 اینچ', 2, 'خیر');
INSERT INTO Mobile VALUES(2, 1, 20680000, 'هوآوی', 'Y7 Prime 2018', ARRAY ['طلایی', 'مشکی'], 'اندروید', '3 گیگابایت', '5.9 اینچ', 2, 'خیر');
INSERT INTO Mobile VALUES(3, 2, 193990000, 'اپل', 'iPhone XS Max', ARRAY ['خاکستری', 'نقره ای'], 'iOS', '4 گیگابایت', '6.5 اینچ', 2, 'خیر');
INSERT INTO Mobile VALUES(4, 2, 73990000, 'سامسونگ', 'Galaxy S9 Plus', ARRAY ['مشکی'], 'اندروید', '6 گیگابایت', '6.2 اینچ', 2, 'خیر');

INSERT INTO Tablet VALUES(5, 1, 15370000, 'سامسونگ', 'Galaxy Tab A SM-T285', ARRAY ['سفید', 'مشکی', 'نقره ای'], 'اندروید', '1.5 گیگابایت', '7 اینچ', 'دارد', 'دارد');
INSERT INTO Tablet VALUES(6, 2, 273990000, 'اپل', 'iPad Pro 2018', ARRAY ['خاکستری'], 'iOS', '6 گیگابایت', '12.9 اینچ', 'دارد', 'ندارد');
INSERT INTO Tablet VALUES(7, 2, 263990000, 'مایکروسافت', 'Surface Pro 2017 - E', ARRAY ['سفید', 'مشکی', 'نقره ای'], 'ویندوز', '16 گیگابایت', '12.3 اینچ', 'ندارد', 'ندارد');

INSERT INTO Laptop VALUES(8, 2, 245000000, 'لنوو', 'ThinkPad X1 Carbon - A', ARRAY ['مشکی'], 'Microsoft Windows 10', '8 گیگابایت', '14 اینچ', 'بله', 'خیر');
INSERT INTO Laptop VALUES(9, 2, 197990000, 'ایسوس', 'ROG Strix GL503VM - D', ARRAY ['مشکی'], 'DOS', '24 گیگابایت', '15.6 اینچ', 'بله', 'خیر');

----------------------------------------------------

/*
DELETE FROM Sale;
*/

INSERT INTO Sale VALUES(1, 1, 2, '1392-12-25', 1, 20680000);
INSERT INTO Sale VALUES(1, 2, 2, '1393-01-19', 1, 20680000);
INSERT INTO Sale VALUES(2, 3, 3, '1393-03-22', 1, 193900000);
INSERT INTO Sale VALUES(2, 4, 4, '1392-09-10', 1, 73990000);
INSERT INTO Sale VALUES(2, 5, 9, '1392-12-29', 1, 197990000);
INSERT INTO Sale VALUES(2, 6, 3, '1393-04-06', 1, 193900000);
INSERT INTO Sale VALUES(2, 6, 6, '1393-04-06', 1, 273900000);
INSERT INTO Sale VALUES(2, 6, 8, '1393-04-06', 1, 240000000);
INSERT INTO Sale VALUES(1, 7, 2, '1393-12-15', 1, 20680000);

----------------------------------------------------

/*
DELETE FROM Buy;
*/

INSERT INTO Buy VALUES(1, 1, 1, '1392-11-11', 20, 20190000);
INSERT INTO Buy VALUES(1, 1, 2, '1392-11-11', 20, 20680000);
INSERT INTO Buy VALUES(2, 2, 3, '1392-11-2', 15, 193990000);
INSERT INTO Buy VALUES(2, 2, 4, '1392-11-2', 15, 73990000);
INSERT INTO Buy VALUES(1, 1, 5, '1392-11-11', 10, 15370000);
INSERT INTO Buy VALUES(2, 2, 6, '1392-11-2', 5, 273990000);
INSERT INTO Buy VALUES(2, 2, 7, '1392-11-2', 5, 263990000);
INSERT INTO Buy VALUES(2, 3, 8, '1392-11-30', 1, 245000000);
INSERT INTO Buy VALUES(2, 3, 9, '1392-11-30', 1, 197990000);
