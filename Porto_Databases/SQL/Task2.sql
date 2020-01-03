-- List for a period in a hotel the available accommodation quantity by accommodation type.
	FROM         dbo.Accommodations INNER JOIN
								dbo.hotels ON dbo.Accommodations.hotel_id = dbo.hotels.hotel_id INNER JOIN
								dbo.Types ON dbo.Accommodations.type_id = dbo.Types.type_id
	WHERE     (dbo.hotels.hotel_id = @hotel_id)
	GROUP BY dbo.Types.name) as total_capacity
FROM         dbo.Accommodations INNER JOIN
                         dbo.hotels ON dbo.Accommodations.hotel_id = dbo.hotels.hotel_id INNER JOIN
                         dbo.Order_Accommodation ON dbo.Accommodations.accommodation_id = dbo.Order_Accommodation.accommodation_id INNER JOIN
                         dbo.Orders ON dbo.Order_Accommodation.order_ID = dbo.Orders.order_id INNER JOIN
                         dbo.Types ON dbo.Accommodations.type_id = dbo.Types.type_id
WHERE     (dbo.hotels.hotel_id = @hotel_id) AND (orders.start_date > @period_start) AND (orders.end_date < @period_end)
GROUP BY dbo.Types.name) as period_occupancy