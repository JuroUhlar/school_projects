-- Task 4 
-- Count the different clients of a hotel in a period by type of accommodation.

DECLARE @period_start date = '2019-5-1'
DECLARE @period_end date = '2020-1-1'
DECLARE @hotel_id int = 1

-- SELECT   dbo.Customers.name, dbo.hotels.name AS hotel, dbo.Types.name AS type
SELECT COUNT(DISTINCT dbo.Customers.customer_id) AS Count, dbo.Types.name
FROM         dbo.Accommodations INNER JOIN
                         dbo.hotels ON dbo.Accommodations.hotel_id = dbo.hotels.hotel_id INNER JOIN
                         dbo.Order_Accommodation ON dbo.Accommodations.accommodation_id = dbo.Order_Accommodation.accommodation_id INNER JOIN
                         dbo.Orders ON dbo.Order_Accommodation.order_ID = dbo.Orders.order_id INNER JOIN
                         dbo.Customers ON dbo.Orders.customer_id = dbo.Customers.customer_id INNER JOIN
                         dbo.Types ON dbo.Accommodations.type_id = dbo.Types.type_id
WHERE     (dbo.Orders.start_date > @period_start) AND (dbo.Orders.start_date < @period_end) AND (hotels.hotel_id = @hotel_id)
GROUP BY dbo.Types.name