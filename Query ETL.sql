SELECT
CustomerID,
CustomerName,
CustomerGender, 
CustomerEmail
FROM 
OLTP_Electronic..MsCustomer

SELECT
StaffID,
StaffName,
StaffGender 
FROM
OLTP_Electronic..MsStaff


SELECT
ElectronicID,
ElectronicName,
ElectronicPrice, 
ElectronicTypeName
FROM
OLTP_Electronic..MsElectronic el
JOIN OLTP_Electronic..MsElectronicType et 
ON
et.ElectronicTypeID = el.ElectronicTypeID


SELECT
SalesDate as Date
FROM OLTP_Electronic..TrSalesHeader


SELECT
[Date] = AllDate.Date,
[Day] = DAY(Alldate.Date),
[MONTH] = MONTH(Alldate.Date),
[Quarter] = DATEPART(QUARTER, Alldate.Date),
[Year] = YEAR(Alldate.Date)
FROM(
SELECT
SalesDate as Date
FROM OLTP_Electronic..TrSalesHeader
) AS AllDate

--Filter Time Stamp








IF NOT EXISTS(
	SELECT *
	FROM FilterTimeStamp
	WHERE TableName = 'TimeDimension'
)
BEGIN
SELECT
[Date] = AllDate.Date,
[Day] = DAY(Alldate.Date),
[MONTH] = MONTH(Alldate.Date),
[Quarter] = DATEPART(QUARTER, Alldate.Date),
[Year] = YEAR(Alldate.Date)
FROM(
SELECT
SalesDate as Date
FROM OLTP_Electronic..TrSalesHeader
) AS AllDate
END
ELSE
BEGIN
SELECT
[Date] = AllDate.Date,
[Day] = DAY(Alldate.Date),
[MONTH] = MONTH(Alldate.Date),
[Quarter] = DATEPART(QUARTER, Alldate.Date),
[Year] = YEAR(Alldate.Date)
FROM(
SELECT
SalesDate as Date
FROM OLTP_Electronic..TrSalesHeader
) AS AllDate
WHERE
	Alldate.Date > (
		SELECT LastETL
		FROM FilterTimeStamp
		WHERE TableName = 'TimeDimension'
		)
END

-->FilterTimeStamp
IF NOT EXISTS(
	SELECT * 
	FROM FilterTimeStamp
	WHERE TableName = 'TimeDimension'
	)
	BEGIN
	INSERT INTO FilterTimeStamp VALUES('TimeDimension', GETDATE())
	END
	ELSE
	BEGIN
	UPDATE FIlterTimeStamp 
	SET LastETL = GETDATE()
	WHERE TableName = 'TimeDimension'
	END
