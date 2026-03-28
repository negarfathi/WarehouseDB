
---------- نام، نام خانوادگی و شماره تلفن انباردار انبار های داخل تهران ----------

SELECT DISTINCT (Storekeeper.name).first_name AS name, (Storekeeper.name).last_name AS family, Storekeeper.phone
FROM Storekeeper, Warehouse
WHERE Storekeeper.code = Warehouse.storekeeper_code AND (Warehouse.address).city = 'تهران';



---------- مشخصات کامل مشتریانی که بیش از یک خرید داشته اند -----------

SELECT DISTINCT Customer.code, Customer.name, Customer.phone, Customer.address, Customer.gender, Customer.age
FROM Customer, Sale
WHERE Customer.code = Sale.customer_code
GROUP BY Customer.code, Customer.name, Customer.phone, Customer.address, Customer.gender, Customer.age, Sale.customer_code
HAVING count(*) > 1;



---------- مشخصات کامل کارخانه هایی که بیش از 5 کالا به انبار ها فروختند ----------

SELECT DISTINCT Factory.code, Factory.phone, Factory.address
FROM Factory, Buy
WHERE Factory.code = Buy.factory_code AND Buy.number > 5;



---------- تلفن و آدرس تمامی انبار ها -----------

SELECT DISTINCT Warehouse.phone, Warehouse.address
FROM Warehouse;



---------- مشخصات کامل مسئول خرید و فروشی که نسبت به سایرین مسئول فروش تعداد کالاهای بیشتری بوده است ----------

--DROP FUNCTION f()

CREATE FUNCTION f() 
	RETURNS INTEGER AS $$
	DECLARE number INTEGER;
	DECLARE max INTEGER;
	DECLARE c CURSOR FOR(	SELECT DISTINCT COUNT(*)
				FROM Responsible, Sale
				WHERE Responsible.code = Sale.Responsible_code
				GROUP BY Responsible.code, Responsible.name, Responsible.phone, Responsible.address, Sale.Responsible_code);
		BEGIN
			number := 0;
			OPEN c;
			LOOP
				FETCH c INTO max;
				IF NOT FOUND THEN 
					EXIT; 
				END IF;
				IF max > number THEN
					number := max;
				END IF;
			END LOOP;
			CLOSE c;
			RETURN number;
		END;
	$$ LANGUAGE plpgsql;

SELECT Responsible.code, Responsible.name, Responsible.phone, Responsible.address, COUNT(*)
FROM Responsible, Sale
WHERE Responsible.code = Sale.Responsible_code
GROUP BY Responsible.code, Responsible.name, Responsible.phone, Responsible.address, Sale.Responsible_code
HAVING COUNT(*)=(SELECT f());



---------- مشخصات کامل موبایل هایی که به فروش نرسیده اند -----------

(SELECT DISTINCT Mobile.*
FROM Mobile)
EXCEPT
(SELECT DISTINCT Mobile.*
FROM Mobile, Sale
WHERE Mobile.code = Sale.Goods_code);



---------- مشخصات کامل تبلت هایی با سیستم عامل اندروید که دارای قابلیت مکالمه هستند -----------

SELECT DISTINCT Tablet.*
FROM Tablet
WHERE Tablet.operating_system = 'اندروید' AND conversational_capability = 'دارد';



---------- مشخصات کامل لپ تاپ هایی که با مقداری  تخفیف به فروش رسیدند به همراه میزان تخفیف داده شده ----------

SELECT DISTINCT Laptop.*, (Laptop.price-Sale.price) AS mitigation
FROM Laptop, Sale
WHERE Laptop.code = Sale.goods_code AND Laptop.price > Sale.price;
