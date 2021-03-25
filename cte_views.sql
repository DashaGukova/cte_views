CREATE VIEW Person.vPerson AS 
SELECT Title, FirstName, LastName, EmailAddress 
FROM Person.Person, Person.EmailAddress

-----------------------------------

WITH TestQuery 
	AS 
	(SELECT hr.BusinessEntityId, hr.NationalIdNumber, hr.JobTitle, p.FirstName, p.LastName, pp.PhoneNumber
	 FROM HumanResources.Employee AS hr
	 JOIN Person.Person AS p ON hr.BusinessEntityId = p.BusinessEntityID
	 JOIN Person.PersonPhone AS pp ON p.BusinessEntityID = pp.BusinessEntityID
	 )
SELECT * FROM TestQuery