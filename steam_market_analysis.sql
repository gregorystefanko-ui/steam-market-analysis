SELECT 
    Tags AS Genre, 
    COUNT(*) AS Game_Count,
    SUM(revenue_at_risk) AS Total_Revenue_At_Risk
FROM analysis_table
GROUP BY Tags
HAVING COUNT(*) > 100
ORDER BY Total_Revenue_At_Risk DESC;
