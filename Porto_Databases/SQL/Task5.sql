-- List the clients with the most accommodations in a period, showing the total of extras consumed.DECLARE @period_start date = '2019-10-1';DECLARE @period_end date = '2020-1-1';SELECT   dbo.Customers.customer_id, dbo.Customers.name, COUNT(dbo.Accommodations.accommodation_id) AS Accommodation_count, 
                         SUM(dbo.Daily_consumption.snacks_consumed + dbo.Daily_consumption.drinks_consumed + dbo.Daily_consumption.tv_consumed) AS total_extras_consumed
FROM         dbo.Accommodations INNER JOIN
                         dbo.Order_Accommodation ON dbo.Accommodations.accommodation_id = dbo.Order_Accommodation.accommodation_id INNER JOIN
                         dbo.Daily_consumption ON dbo.Order_Accommodation.order_accommodation_id = dbo.Daily_consumption.order_accommodation_id INNER JOIN
                         dbo.Orders ON dbo.Order_Accommodation.order_ID = dbo.Orders.order_id INNER JOIN
                         dbo.Customers ON dbo.Orders.customer_id = dbo.Customers.customer_id
WHERE (dbo.Orders.start_date > @period_start) AND (dbo.Orders.end_date < @period_end)
GROUP BY dbo.Customers.customer_id, dbo.Customers.name