USE AdventureWorks2019
GO
CREATE VIEW Person.vPerson AS 
SELECT p.Title, p.FirstName, p.LastName, e.EmailAddress 
FROM Person.Person AS p 
JOIN Person.EmailAddress AS e 
ON p.BusinessEntityID = e.BusinessEntityID;

-----------------------------------

WITH ctehr 
	AS 
	 (SELECT hr.BusinessEntityId, hr.NationalIdNumber, hr.JobTitle, p.FirstName, p.LastName
	 FROM HumanResources.Employee AS hr
	 JOIN Person.Person AS p ON hr.BusinessEntityId = p.BusinessEntityID),
	 ctep
	 AS
	 (SELECT t.BusinessEntityId, t.NationalIdNumber, t.JobTitle, t.FirstName, t.LastName, pp.PhoneNumber
	 FROM ctehr AS t
	 JOIN Person.PersonPhone AS pp ON t.BusinessEntityId = pp.BusinessEntityID
	 )
SELECT * 
FROM ctep;
