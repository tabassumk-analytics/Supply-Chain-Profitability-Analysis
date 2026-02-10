/*
PROJECT: Global Supply Chain Profitability & Risk Analysis
GOAL: Identify products and regions where shipping delays cause negative profit margins.
TECH STACK: PostgreSQL, CTEs, Window Functions
*/

-- Step 1: Filter out Returned Orders to focus on valid sales
WITH Valid_Orders AS (
    SELECT 
        o."Order ID",
        o."Order Date",
        o."Ship Date",
        o."Ship Mode",
        o."Customer ID",
        o."Product ID",
        o."Sales",
        o."Quantity",
        o."Discount",
        o."Profit",
        o."Region",
        o."Category",
        o."Sub-Category"
    FROM public."Orders" o
    LEFT JOIN public."Returns" r ON o."Order ID" = r."Order ID"
    WHERE r."Returned" IS NULL -- Exclude returned items
),

-- Step 2: Calculate Shipping Speed & Margin Metrics
Performance_Metrics AS (
    SELECT 
        *,
        -- Calculate actual days taken to ship
        (DATE("Ship Date") - DATE("Order Date")) AS actual_shipping_days,
        
        -- Calculate Profit Margin %
        ROUND(("Profit" / NULLIF("Sales", 0)) * 100, 2) AS profit_margin_pct,
        
        -- Categorize profitability
        CASE 
            WHEN "Profit" > 0 THEN 'Profitable'
            ELSE 'Unprofitable'
        END AS profitability_status
    FROM Valid_Orders
)

-- Step 3: Final Output for Tableau Dashboard
SELECT 
    Region,
    Category,
    "Sub-Category",
    COUNT("Order ID") AS total_orders,
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit,
    AVG(actual_shipping_days) AS avg_shipping_days,
    AVG(profit_margin_pct) AS avg_margin_pct
FROM Performance_Metrics
GROUP BY 1, 2, 3
ORDER BY total_profit ASC; -- Sorting by lowest profit to identify loss leaders
