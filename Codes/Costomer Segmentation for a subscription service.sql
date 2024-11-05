SELECT * FROM [dbo].[LITA Capstone Dataset 2]

-----------Retrieve the total number of customers from each region-------
SELECT Region, COUNT(DISTINCT CustomerID) AS Customer_Per_Region FROM [dbo].[LITA Capstone Dataset 2]
GROUP BY Region

------Find the most popular subscription type by the number of customers--------
SELECT TOP 1 SubscriptionType, COUNT( DISTINCT CustomerID) AS Number_of_Customers FROM [dbo].[LITA Capstone Dataset 2]
GROUP BY SubscriptionType
ORDER BY Number_of_Customers DESC

-------Find customers who canceled their subscription within 6 months----------
SELECT CustomerID,  DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) AS Subscription_Duration 
FROM [dbo].[LITA Capstone Dataset 2]
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6

SELECT CustomerID, SubscriptionStart, SubscriptionEnd, DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) AS Subscription_Duration 
FROM [dbo].[LITA Capstone Dataset 2]
WHERE Canceled = 1 AND DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) <= 6

-------Calculate the average subscription duration for all customers------
SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS Average_Subscription_Duration
FROM [dbo].[LITA Capstone Dataset 2]
WHERE SubscriptionEnd IS NOT NULL

------Find customers with subscriptions longer than 12 months-------
SELECT CustomerID,  DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) AS Subscription_Duration FROM [dbo].[LITA Capstone Dataset 2]
WHERE DATEDIFF(MONTH, SubscriptionStart, SubscriptionEnd) > 12

-------Calculate total revenue by subscription type-----
SELECT SubscriptionType, SUM(Revenue) AS Total_Revenue FROM [dbo].[LITA Capstone Dataset 2]
GROUP BY SubscriptionType

--------Find the top 3 regions by subscription cancellations-------
SELECT TOP 3 Region, COUNT(*) AS Number_of_Cancellations FROM [dbo].[LITA Capstone Dataset 2]
WHERE Canceled = 1
GROUP BY Region
ORDER BY Number_of_Cancellations DESC

----------Find the total number of active and canceled subscriptions---------
SELECT COUNT(Canceled) AS Active_Subscriptions FROM [dbo].[LITA Capstone Dataset 2]
WHERE Canceled = 0 

SELECT COUNT(Canceled) AS Cancelled_Subscriptions FROM [dbo].[LITA Capstone Dataset 2]
WHERE Canceled = 1
