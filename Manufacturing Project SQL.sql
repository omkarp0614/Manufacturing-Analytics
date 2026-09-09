#SQL PROJECT GROUP-6

#Total Manufactured Qty

SELECT ROUND(SUM(`today Manufactured qty`) / 1000000, 2) AS Total_Manufactured_Qty_Millions
FROM manufacturing_data;

#Total Rejected Qty

SELECT ROUND(SUM(`Rejected Qty`) / 1000000, 2) AS Total_Rejected_Qty_Millions
FROM manufacturing_data;

#Total Processed Qty

SELECT ROUND(SUM(`Processed Qty`) / 1000000, 2) AS Total_Processed_Qty_Millions
FROM manufacturing_data;

#Total Wastage Qty

SELECT ROUND(SUM(`Produced Qty` - `Processed Qty` - `Rejected Qty`) / -1000000, 2) 
       AS Total_Wastage_Qty_Millions
FROM manufacturing_data;

#Employee wise rejected qty

SELECT 
    `Emp Name`, 
    ROUND(SUM(`Rejected Qty`) / 1000000, 2) AS Rejected_Qty_Millions
FROM manufacturing_data
GROUP BY `Emp Name`
ORDER BY Rejected_Qty_Millions DESC;

#Top 7 Machine-wise rejected qty

SELECT 
    `Machine Code`, 
    ROUND(SUM(`Rejected Qty`) / 1000, 2) AS Rejected_Qty_Thousands
FROM manufacturing_data
GROUP BY `Machine Code`
ORDER BY Rejected_Qty_Thousands DESC
LIMIT 7;

#Production Comparison Trend

SELECT 
    DATE_FORMAT(`Doc Date`, '%Y-%m') AS YearMonth,
    ROUND(SUM(`today Manufactured qty`) / 1000, 2) AS Manufactured_Thousands,
    ROUND(SUM(`Processed Qty`) / 1000, 2) AS Processed_Thousands,
    ROUND(SUM(`Rejected Qty`) / 1000, 2) AS Rejected_Thousands
FROM manufacturing_data
GROUP BY YearMonth
ORDER BY YearMonth;

#Manufactured v/s Rejected Qty

SELECT 
    ROUND(SUM(`today Manufactured qty`) / 1000, 2) AS Total_Manufactured_Thousands,
    ROUND(SUM(`Rejected Qty`) / 1000, 2) AS Total_Rejected_Thousands
FROM manufacturing_data;

#Department wise manufactured v/s rejected qty

SELECT 
    `Department Name`,
    ROUND(SUM(`today Manufactured qty`) / 1000, 2) AS Manufactured_Thousands,
    ROUND(SUM(`Rejected Qty`) / 1000, 2) AS Rejected_Thousands
FROM manufacturing_data
GROUP BY `Department Name`
ORDER BY Manufactured_Thousands DESC;