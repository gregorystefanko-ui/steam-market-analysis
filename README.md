# Steam Market Analysis (2025 - Feb 2026)

## Project Overview
This project investigates revenue leakage and market risk across gaming genres for titles released between **January 2025 and February 2026**. By analyzing over 120,000 records, I identified specific genres facing the highest "Revenue at Risk" due to high refund rates and low user sentiment.

## Data Source
Raw data was sourced from the **Steam Web API**, specifically filtering for titles released from **2025 to early 2026**.

## Methodology & Critical Considerations
To ensure a granular analysis, I addressed two significant data challenges:

### 1. Owner Estimation (The Midpoint Method)
Because exact sales figures are private, I utilized the **Owner Midpoint** method. This averages the low and high estimates of total owners for each title.
* **The Limitation**: This is a high-level projection rather than an audited financial total.

### 2. Tag Explosion & Data Skewing
Steam games often belong to multiple genres (e.g., a single game can be tagged as both "Action" and "Adventure"). To analyze genres individually, I "exploded" these tags, creating a unique entry for every genre a game possesses.
* **Note on Skewing**: This method intentionally "double-counts" revenue across categories. The goal is to measure the **total footprint** of risk within a specific market segment (e.g., "The Action Market") rather than a non-duplicated sum of the entire platform.

### 3. Genre-First Focus
Analysis was performed by **Genre (Tags)** rather than a monthly scale to identify strategic trends in market segment volatility. This highlights which types of games are currently most prone to financial leakage regardless of release month.

## Key Insights & Results

Despite the broad nature of Steam's tagging system, the analysis yielded high-value strategic takeaways for the 2025-2026 release cycle:

* **The "High-Risk" Leaderboard**: Three genres dominate the revenue leakage landscape, accounting for over $8B in combined revenue at risk:
    1. **Action**: $3.42 Billion
    2. **Adventure**: $2.69 Billion
    3. **RPG**: $2.67 Billion
* **Action Category Utility**: While "Action" is the most ubiquitous tag on the platform, this data quantifies its volatility. It confirms that while the Action market is the largest, it also requires the most rigorous quality assurance and sentiment monitoring to prevent massive refund cycles.
* **Volume vs. Value**: The data revealed that "Indie" games have the highest total count (4,138 titles), yet their total revenue at risk ($1.69B) is significantly lower than the "Big Three" genres, suggesting that financial risk is concentrated in high-budget, multi-tagged AA/AAA titles.

## Tech Stack
* **Python (Pandas)**: Data cleaning and "exploding" nested genre tags.
* **SQL (SQLite)**: Relational database storage and aggregations to rank revenue leakage.
* **Excel**: Executive dashboard and PivotCharts for stakeholder visualization.

## Key SQL Query
```sql
SELECT 
    Tags AS Genre, 
    COUNT(*) AS Game_Count,
    SUM(revenue_at_risk) AS Total_Revenue_At_Risk
FROM analysis_table
GROUP BY Tags
HAVING COUNT(*) > 100
ORDER BY Total_Revenue_At_Risk DESC;
