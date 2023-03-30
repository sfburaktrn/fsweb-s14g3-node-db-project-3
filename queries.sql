-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
select ProductName,CategoryName from Product p 
join Category c on p.CategoryId=c.Id
-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
select o.Id as "SiparisID",c.CompanyName from [Order] o
join Customer c on c.Id = o.CustomerId 
where OrderDate<'2012-08-09'
-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
select p.ProductName,Count(*) as "Ürün Sayısı" from [OrderDetail] od
join Product p on od.ProductId = p.Id
where OrderId=10251
group by od.ProductId
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
select o.Id,c.CompanyName,e.LastName from [Order] o
join Customer c on c.Id = o.CustomerId
join Employee e on e.Id = o.EmployeeId