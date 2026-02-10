# Identifying Profit Leakage in High-Volume Logistics 
### 📊 Strategic Assessment: Supply Chain Risk & Margin Analysis

**Dashboard Link:** [View Interactive Tableau Dashboard]https://public.tableau.com/views/IdentifyingProfitLeakageinHigh-VolumeLogistics/ExecutiveDashboard?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

---

## 💼 Business Problem
The Global Supply Chain division generates **$35.2M in revenue** but faces unexplained margin erosion in specific sectors. Stakeholders lacked visibility into how **operational inefficiencies** (specifically shipping delays) were impacting **net profitability** across different global regions.

**Objective:** Isolate specific products and regions where shipping delays correlate with negative profit margins to optimize logistics and reduce "profit leakage."

---

## 🛠️ The Solution: Executive Command Center
I engineered a full-stack analytics solution to visualize the correlation between **Shipping Speed** and **Profit Margin**.

### 1. Data Architecture (SQL & Python)
* **Data Cleaning:** Used Python to preprocess raw order data, handling null values and formatting dates.
* **Logic Layer (SQL):** Utilized **Common Table Expressions (CTEs)** to:
    * Join `Orders`, `People`, and `Returns` tables.
    * Filter for valid transactions (excluding returns).
    * Calculate `Actual Shipping Days` vs. `Scheduled Days`.
    * Create a dynamic `Profitability Status` flag (Profitable vs. Unprofitable).

### 2. Interactive Dashboard (Tableau)
Designed an **Executive Command Center** using the "F-Pattern" layout for rapid decision-making:
* **Risk Matrix (Scatter Plot):** A 4-quadrant view isolating "High Risk / Low Profit" markets (e.g., Central Asia).
* **Root Cause Analysis (Bar Chart):** A sorted view identifying **"Strength Training"** as the primary loss leader (-107.8% Margin).
* **Financial Health Trend:** A longitudinal analysis proving the company maintains net-positive profitability despite category-specific losses.

---

## 🚀 Key Findings
1.  **The Trap:** The **"Strength Training"** category is a critical deadweight, operating at a **-107.8% margin** despite high sales volume.
2.  **The Risk Zone:** Regions with an average shipping time **>4 days** (e.g., Southern Africa, Central Asia) show a strong correlation with negative profitability.
3.  **The Stability:** Despite these leaks, the overall business model remains healthy with a **10.8% Net Margin** ($3.8M Profit).

---

## 💻 Technical Stack
* **SQL (PostgreSQL):** CTEs, Window Functions, Joins.
* **Tableau Public:** Advanced Visualizations, LOD Expressions, Dashboard Actions.
* **Python:** Pandas for initial data profiling.

---

*Author: Tabassum K.* *Senior Business Data Analyst Portfolio*
