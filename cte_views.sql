USE AdventureWorks2019
GO
CREATE VIEW Person.vPerson AS 
SELECT p.Title, p.FirstName, p.LastName, e.EmailAddress 
FROM Person.Person AS p 
JOIN Person.EmailAddress AS e 
ON p.BusinessEntityID = e.BusinessEntityID;

-----------------------------------

WITH ctep
        AS 
	 (SELECT BusinessEntityID, FirstName, LastName
	  FROM Person.Person
	 ),
	 ctet
	AS
	 (SELECT BusinessEntityID, PhoneNumber
	  FROM Person.PersonPhone
	 )
SELECT hr.BusinessEntityId, hr.NationalIdNumber, hr.JobTitle, p.FirstName,p.LastName, t.PhoneNumber
FROM HumanResources.Employee AS hr
JOIN ctep AS p ON hr.BusinessEntityId = p.BusinessEntityID
JOIN ctet AS t ON p.BusinessEntityID = t.BusinessEntityID
