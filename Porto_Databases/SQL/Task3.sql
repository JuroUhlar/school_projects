-- List for an order the total amount of extras consumed.

 DECLARE @order_id int = 1

SELECT   SUM(dbo.Daily_consumption.snacks_consumed + dbo.Daily_consumption.drinks_consumed + dbo.Daily_consumption.tv_consumed) AS Total_extras_consumed
FROM         dbo.Daily_consumption INNER JOIN
                         dbo.Order_Accommodation ON dbo.Daily_consumption.order_accommodation_id = dbo.Order_Accommodation.order_accommodation_id INNER JOIN
                         dbo.Orders ON dbo.Order_Accommodation.order_ID = dbo.Orders.order_id
WHERE     (dbo.Orders.order_id = @order_id)