# Intermediate SQL - Sales Analysis

Outline
1. Overview
2. Business Questions
3. Analysis Approach
    Q1, Q2, Q3 - Each with: a) Visualization b) Key Findings c) Business Insights.
4. Strategic Recommendations
5. Technical Details

---

## Overview
## Business Questions

### Q1: Customer Segmentation
#### Who are our most valuable customers?
### Q2 Cohort Analysis
#### How do different customer groups generate revenue?

- Tracked revenue and customer count per cohorts
- Cohorts were grouped by year of first purchase
- Analyzed customer retention at a cohort level

💻 Query: [2_cohort_analysis.sql](Scripts\2_cohort_analysis.sql)

#### Visualization

![Cohort Analysis](/images/2_cohort_analysis.png)


#### Key Findings

1. **Explosive Growth Phases (2018-2019 & 2022):** The business experienced two significant "scaling" events. In 2019, revenue peaked at **$\$22.3\text{M}$** from **$7,755$** new customers. This was followed by a massive acquisition surge in 2022, bringing in a record **$9,010$** new customers, though revenue remained slightly below the 2019 peak at **$\$20.6\text{M}$**.
    
2. **The 2020 Market Contraction:** There was a sharp and visible drop in both customer acquisition and revenue in 2020. Acquisition fell by over **$60\%$** compared to the previous year, suggesting a significant external market disruption or a pivot in business strategy that year.
    
3. **Revenue vs. Volume De-coupling:** While the number of customers in 2022 was **$16\%$** higher than in 2019, the total revenue generated was **$7\%$** lower. This indicates that while the company was able to acquire more customers, the value per individual customer was lower than in previous years.
    

#### High-Value Business Insights

1. **Acquisition Quality Dilution:** The "Average Revenue per Customer" (ARPU) for new cohorts has seen a general decline, dropping from a high of **$\$3,034$** in 2016 to **$\$2,043$** in 2023. This suggests that the current growth strategy is prioritized on **market share (volume)** over **premium acquisition (value)**. To maintain margins, the company should investigate if marketing spend is being allocated to lower-value channels.
    
2. **High-Value Retention Potential (2015-2017):** The earliest cohorts (2015-2017) demonstrated the highest individual spend per customer ($\sim\$3\text{k}$). These "legacy" segments are likely the company's most loyal and profitable base. A dedicated loyalty program targeting these high-spending archetypes could yield a higher ROI than aggressive new acquisition.
    
3. **Scaling Efficiency (The "2022 Strategy"):** The return to high-volume acquisition in 2022 after the 2020 slump shows strong recovery capability. However, the subsequent drop in 2023 and 2024 (partially due to incomplete year data) suggests that the company needs to stabilize its acquisition costs. If the cost to acquire the 9,010 customers in 2022 was high, the decreasing individual spend per customer could lead to a negative Customer Lifetime Value (LTV) to Acquisition Cost (CAC) ratio.

### Q3 Retention Analysis
#### Who hasn't purchased recently?

## Analysis Approach
    Q1
    Q2
    Q3
    (Each with a) Visualization b)Key Findings c) Business Insights)
## Strategic Recommendations
## Technical Details
