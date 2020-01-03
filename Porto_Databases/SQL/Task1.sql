-- List for a client request the facilities of the selected accommodation 

DECLARE @Selected_accomodation_id int = 10

SELECT   Accommodations.accommodation_id, Types.name AS Type, Facilities.name AS Facility
FROM         Accommodations INNER JOIN
                         Types ON dbo.Accommodations.type_ID = Types.type_id INNER JOIN
                         Facilities ON Types.type_id = Facilities.type_ID
WHERE     (Accommodations.accommodation_id = @Selected_accomodation_id)