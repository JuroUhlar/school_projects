-- List for a client request the facilities of the selected accommodation 

DECLARE @Selected_accomodation_id int = 15

SELECT   Accommodations.id, Types.name AS Type, Facilities.name AS Facility
FROM         Accommodations INNER JOIN
                         Types ON dbo.Accommodations.typeID = Types.id INNER JOIN
                         Facilities ON Types.id = Facilities.typeID
WHERE     (Accommodations.id = @Selected_accomodation_id)