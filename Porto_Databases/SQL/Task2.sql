-- List for a period in a hotel the available accommodation quantity by accommodation type.DECLARE @period_start date = '2019-10-1';DECLARE @period_end date = '2020-1-1';DECLARE @hotel_id int = 1;-- SELECT total_capacity.name, total_capacity.Count as total_capacity, ISNULL(period_occupancy.count, 0) as period_occupancy FROM SELECT total_capacity.name as type, total_capacity.count - ISNULL(period_occupancy.count, 0) as avialable_quantity FROM(SELECT COUNT(dbo.Types.name) AS Count, dbo.Types.name
	FROM         dbo.Accommodations INNER JOIN
								dbo.hotels ON dbo.Accommodations.hotel_id = dbo.hotels.hotel_id INNER JOIN
								dbo.Types ON dbo.Accommodations.type_id = dbo.Types.type_id
	WHERE     (dbo.hotels.hotel_id = @hotel_id)
	GROUP BY dbo.Types.name) as total_capacityLEFT OUTER JOIN(SELECT COUNT(DISTINCT dbo.Accommodations.accommodation_id) AS count, dbo.Types.name
FROM         dbo.Accommodations INNER JOIN
                         dbo.hotels ON dbo.Accommodations.hotel_id = dbo.hotels.hotel_id INNER JOIN
                         dbo.Order_Accommodation ON dbo.Accommodations.accommodation_id = dbo.Order_Accommodation.accommodation_id INNER JOIN
                         dbo.Orders ON dbo.Order_Accommodation.order_ID = dbo.Orders.order_id INNER JOIN
                         dbo.Types ON dbo.Accommodations.type_id = dbo.Types.type_id
WHERE     (dbo.hotels.hotel_id = @hotel_id) AND (orders.start_date > @period_start) AND (orders.end_date < @period_end)
GROUP BY dbo.Types.name) as period_occupancyON total_capacity.name = period_occupancy.name