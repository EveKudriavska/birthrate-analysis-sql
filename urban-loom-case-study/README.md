# Urban Loom Data Analytics Project

## Project Overview
Urban Loom is an online fashion retail store specializing in casual unisex clothing. The company aims to optimize its product line, improve customer satisfaction, and evaluate the effectiveness of marketing campaigns.  

This project analyzes product sales, return patterns, and marketing campaign performance to provide actionable insights for the Product and Marketing Leads.

---

## Data
The dataset includes the following tables:

| Table Name | Description |
|------------|-------------|
| `products.csv` | All products with details like category, type, color, size, and cost. |
| `order_transactions.csv` | Each sale or return transaction with dates and transaction types. |
| `order_line_items.csv` | Items sold or returned per transaction with revenue, quantity, and return reasons. |
| `customers.csv` | Customer details including city, country, and email. |
| `marketing_details.csv` | Marketing source, medium, and campaign for each order. |

---

## Queries & Insights

### **Query 1: Product Classification**
**Aim:** Classify all products into 4 groups based on sales, split sales and returns, and calculate return percentage per line item.  
**SQL File:** [query1_product_classification.sql](SQL/query1_product_classification.sql)  

**Explanation:**
- Joined Products and Order Line Items to aggregate sales and returns.
- Used LEFT JOIN to ensure all products are included.
- COUNT with CASE WHEN calculates sales and returns.
- SAFE_DIVIDE computes return percentage, avoiding divide-by-zero errors.
- CASE WHEN categorizes products as `Frequently Bought`, `Average`, `Rarely Bought`, or `Never Bought`.

**Insights for Product Lead (Jared):**
- Prioritize production of `Frequently Bought` and `Average` items.
- Scale down or discontinue `Rarely Bought` items.
- Temporarily pause production of `Never Bought` items.

---

### **Query 2: Top Return Reason**
**Aim:** Identify the main reason customers return each product to optimize production.  
**SQL File:** [query2_top_return_reason.sql](SQL/query2_top_return_reason.sql)  

**Explanation:**
- Used a window function (ROW_NUMBER) to rank return reasons per product.
- Joined Products table to get product names.
- Selected the most common return reason for each product.

**Insights for Product Lead (Jared):**
- Most returns relate to fit and sizing.
- Recalibrate product sizes for better fit.
- Add a size chart on the website.
- Consider reducing the current 9-size range to a more manageable selection.

---

### **Query 3: Marketing Campaign Analysis**
**Aim:** Measure customer acquisition, revenue, total sales, and returns per marketing campaign.  
**SQL File:** [query3_marketing_campaign_analysis.sql](SQL/query3_marketing_campaign_analysis.sql)  

**Explanation:**
- Created a CTE to calculate number of customers, revenue, sales, and returns per campaign.
- Used joins between Marketing Details, Order Transactions, and Order Line Items.
- Calculated return percentage per campaign using SAFE_DIVIDE.
- Grouped by marketing campaign, excluding NULLs.

**Insights for Marketing Manager (Kojo):**
- Focus on high-volume campaigns like organic search and welcome flow emails.
- Optimize smaller campaigns (Facebook, referrals) for niche reach or brand awareness.
- Encourage user-generated content and reviews.
- Improve post-purchase guidance for campaigns with high return percentage.

---

## Results
- Query outputs saved in: [query_results.xlsx](Google-Sheets/query_results.xlsx)  
- Visualizations of campaigns and sales trends: [Marketing Dashboard](Visualizations/marketing_campaigns_dashboard.html)  

---

## Data Model
The Logical Data Model (LDM) illustrates how all tables relate:

![Logical Data Model](Diagrams/logical_data_model.png)

---

## Conclusion
This analysis provides actionable insights for both the Product and Marketing teams:
1. Optimize the product line based on purchase frequency and returns.
2. Improve product sizing to reduce returns.
3. Focus marketing efforts on campaigns generating the most revenue and customers.
4. Suggest improvements in data collection to enhance future analytics capabilities.

---

## How to Reproduce
1. Clone this repository.
2. Load CSV files into your preferred SQL environment.
3. Run the queries in the `SQL/` folder.
4. Open visualizations from the `Visualizations/` folder in a browser.

