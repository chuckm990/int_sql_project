# Intermediate SQL - Sales Analysis

## Outline

1. [Overview](#overview)
2. [Skills Demonstrated](#skills-demonstrated)
3. [Business Questions](#business-questions)
4. [Analysis Approach](#analysis-approach)
   - [Customer Segmentation Analysis](#1-customer-segmentation-analysis)
   - [Cohort Analysis](#2-cohort-analysis)
   - [Retention Analysis](#3-retention-analysis)
5. [Strategic Recommendations](#strategic-recommendations)
6. [Technical Details](#technical-details)
7. [Acknowledgements](#acknowledgements)

---

![Project_Cover](/images/project_cover.png)

## Overview

Analysis of customer behavior, retention, and lifetime value for an e-commerce company to improve customer retention and maximize revenue.

This project was completed as part of my Intermediate SQL learning journey using PostgreSQL, based on the material taught by [Luke Barousse](https://github.com/lukebarousse). Rather than passively following the course, I actively reproduced the analyses, practiced the queries independently, and expanded the business interpretation layer to strengthen both technical and analytical thinking.

---

## Skills Demonstrated

- Window Functions
- Common Table Expressions (CTEs)
- Percentile Functions
- Customer Segmentation
- Cohort Analysis
- Retention Analysis
- Business KPI Analysis
- PostgreSQL Analytics
- Data Visualization
- Analytical Storytelling
- Business-Oriented Reporting

---

## Business Questions

1. **Customer Segmentation:** Who are the company's most valuable customers?
2. **Cohort Analysis:** How do different customer groups generate revenue over time?
3. **Retention Analysis:** Which customers are no longer actively purchasing?

---

## Analysis Approach

# 1. Customer Segmentation Analysis

- Segmented the customer base into three distinct tiers using percentile functions (25th and 75th percentiles) to objectively define Low, Mid, and High LTV customers.
- Quantified revenue concentration by calculating the percentage of total company revenue contributed by each LTV segment.
- Benchmarked performance metrics across groups by comparing average lifetime value against customer population counts to identify the most and least profitable segments.

💻 Query: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

## Visual Analysis

<p align="center">
  <img src="/images/1_customer_segmentation_donut_chart.png" width="60%">
</p>

> The top quartile of customers ("High LTV") generates over 65% of company revenue, highlighting a critical dependence on a small premium segment.

<p align="center">
  <img src="/images/1_customer_segmentation_strategic_ltv_analysis.png" width="60%">
</p>

> This Pareto analysis confirms that High and Mid LTV tiers combined constitute nearly 98% of company value, visually supporting a strategy of automated-only engagement for the low-performing Low-LTV segment.

---

## Key Findings

1. **High-Value Pareto Distribution (The 66% Factor):**  
   The "3 - High LTV" segment constitutes approximately 25% of the unique customer base but is responsible for 66.0% of all net totals ($135.6M). This finding strongly supports a premium, retention-first business strategy.

2. **The Middle-Ground Revenue Engine:**  
   The "2 - Mid LTV" segment, while smaller in revenue share (32.3%), represents the largest active customer population (nearly 25k unique customers). This segment presents the strongest opportunity for upselling and lifecycle marketing.

3. **Low-End Scale with Minimal Contribution:**  
   The "1 - Low LTV" segment has a customer count nearly identical to the High-LTV group due to percentile-based segmentation, yet contributes only 2.1% of total revenue ($4.3M). Their average lifetime spend is just $347.

## Strategic Business Insights

1. **Revenue Vulnerability vs Operational Efficiency:**  
   The company depends heavily on the top quartile of customers for profitability. Any increase in churn within this segment would significantly impact revenue performance. However, these customers likely generate the highest operational efficiency relative to support cost.

2. **The Missed Upsell Opportunity:**  
   The monetization gap between Mid LTV customers ($2,682 average spend) and High LTV customers ($10,961 average spend) is substantial. Strategic cross-selling and personalized lifecycle campaigns could significantly increase customer value.

3. **Low-End Market Friction:**  
   Low-LTV customers contribute minimal revenue while still consuming customer support resources, marketing bandwidth, and logistics capacity. A low-cost automated engagement strategy is more economically sustainable than high-touch retention efforts.

---

## Actionable Marketing Strategy for Low-LTV Customers

*Managing customers who represent 25% of the customer base but only 2.1% of revenue requires a highly automated and operationally efficient approach.*

### Objective: Move or Minimize

1. **Automated Lifecycle Upscaling**
   - **Strategy:** Avoid high-cost advertising for low-value customers. Focus on automated, low-cost communication channels such as email sequences.
   - **Action:** Implement automated upsell campaigns for customers whose first purchase is below $500. Campaigns should encourage migration into higher-value product categories. Customers showing no engagement after multiple attempts should be removed from active marketing flows.

2. **High-Basket First Purchase Strategy**
   - **Strategy:** Reduce acquisition of low-value one-time buyers at the source.
   - **Action:** Shift promotions toward minimum-order-value incentives such as "10% off orders above $250" instead of low-threshold offers like "Free shipping over $50."

3. **Operational Efficiency Through Support Automation**
   - **Strategy:** Minimize live-support costs for low-monetization customer groups.
   - **Action:** Use chatbots, self-service return systems, FAQs, and automated support flows for low-value product categories while prioritizing live support for high-LTV customers.

---

# 2. Cohort Analysis

- Tracked revenue and customer counts across cohorts.
- Grouped cohorts by year of first purchase.
- Analyzed long-term revenue generation and customer acquisition performance over time.

💻 Query: [2_cohort_analysis.sql](/2_cohort_analysis.sql)

## Visual Analysis

<p align="center">
  <img src="/images/2_cohort_analysis.png" width="60%">
</p>

> This visualization tracks customer revenue generation across ten years of acquisition cohorts. By applying a quadratic polynomial fit, the analysis captures the accelerating decline in recent cohort performance and highlights a meaningful shift in customer value generation patterns.

---

## Key Findings

1. **Explosive Growth Phases (2018–2019 and 2022):**  
   The business experienced two major scaling periods. In 2019, revenue peaked at $22.3M from 7,755 new customers. In 2022, acquisition volume reached a record 9,010 customers, although total revenue remained slightly below the 2019 peak at $20.6M.

2. **The 2020 Market Contraction:**  
   Customer acquisition and revenue both declined sharply in 2020. Acquisition volume dropped by more than 60% compared to the previous year, suggesting either an external market disruption or a strategic business shift.

3. **Revenue vs Volume De-Coupling:**  
   Although customer acquisition volume in 2022 was 16% higher than in 2019, total revenue was approximately 7% lower. This suggests declining customer value despite increased acquisition scale.

## Strategic Business Insights

1. **Acquisition Quality Dilution:**  
   Average revenue per customer (ARPU) declined from approximately $3,034 in 2016 to $2,043 in 2023. This suggests the business may be prioritizing acquisition volume over premium customer quality.

2. **High-Value Retention Potential:**  
   The earliest cohorts (2015–2017) demonstrated the highest average customer spend (~$3k per customer). These cohorts likely represent the most loyal and profitable customer archetypes and should be prioritized in loyalty initiatives.

3. **Scaling Efficiency Risk:**  
   While the company demonstrated strong acquisition recovery in 2022, declining spend per customer may create long-term pressure on profitability if acquisition costs continue rising.

---

# 3. Retention Analysis

💻 Query: [3_retention_analysis.sql](/3_retention_analysis.sql)

## Visual Analysis

<p align="center">
  <img src="/images/3_retention_analysis.png" width="60%">
</p>

> This retention analysis measures long-term customer loyalty by segmenting cohorts into active and churned groups using a 6+ month inactivity threshold. Despite strong acquisition growth in certain years, the consistently high churn rate reveals a major opportunity for lifecycle marketing and post-purchase engagement strategies.

---

## Key Findings

1. **Low Baseline Retention:**  
   Across all cohorts between 2015 and 2023, retention rates remained below 11%, indicating strong dependence on one-time purchasers rather than recurring customers.

2. **Stable Churn Dynamics:**  
   Despite significant fluctuations in acquisition volume, the active-to-churned ratio remained relatively stable between 8.4% and 10.4%.

3. **Scale vs Retention (2022 Peak):**  
   The 2022 cohort was both the largest in company history and the cohort with the highest retention rate (10.4%), suggesting slightly stronger acquisition quality during that growth period.

## Strategic Business Insights

1. **The "Leaky Bucket" Problem:**  
   The company is effective at customer acquisition but struggles to maintain long-term engagement beyond the 6-month activity window. This points to weaknesses in post-purchase engagement or natural product replacement cycles.

2. **Untapped Value in Churned Customers:**  
   More than 42,000 customers were classified as churned across all cohorts. Re-activation campaigns targeting even a small percentage of these users could substantially expand the active customer base.

3. **Product-Market Fit and Retention:**  
   The consistently high churn rate suggests many products may behave as one-time purchases rather than recurring needs. Increasing LTV may require complementary products, subscription models, or recurring-service offerings.

---

## Strategic Recommendations

### 1. Customer Value Optimization (Customer Segmentation)

- Launch a VIP retention program for the 12,372 high-value customers responsible for 66% of total revenue.
- Create personalized upgrade paths for the Mid-LTV segment to increase customer monetization.
- Design low-cost automated promotions for the Low-LTV segment to selectively increase purchase frequency without increasing operational overhead.

### 2. Cohort Performance Strategy (Revenue by Cohort)

- Target 2022–2024 cohorts with personalized re-engagement campaigns.
- Implement loyalty or subscription-based programs to stabilize long-term revenue.
- Replicate successful acquisition strategies from high-performing 2016–2018 cohorts.

### 3. Retention and Churn Prevention

- Strengthen customer engagement during the first 12 months through onboarding incentives and loyalty rewards.
- Prioritize win-back campaigns for previously high-value churned customers.
- Develop predictive churn monitoring systems to identify at-risk customers before inactivity occurs.

---

## Technical Details

- **Database:** PostgreSQL
- **Analysis Tools:** PostgreSQL, DBeaver, pgAdmin 4
- **Visualization:** Python (Seaborn, Matplotlib)
- **Learning Source:** Intermediate SQL course by [Luke Barousse](https://github.com/lukebarousse).
    - [Link to video](https://www.youtube.com/watch?v=QKIGsShyEsQ)
- **Focus Areas:** Business Analytics, Customer Segmentation, Retention Analysis, Cohort Analysis

---

## Acknowledgements

This project was completed as part of my Intermediate SQL learning journey based on the excellent educational content created by [Luke Barousse](https://github.com/lukebarousse)

The overall analytical structure, business scenarios, and core SQL concepts presented in this repository were inspired by and developed from the material taught in his Intermediate SQL course. While I independently reproduced the analyses, wrote and practiced the queries myself, created the visualizations, and expanded the business interpretation layer, full credit belongs to Luke Barousse for the original instructional framework and teaching methodology.

This repository represents my personal implementation and learning process built upon the foundations provided in the course, which significantly strengthened my understanding of:
- PostgreSQL analytics
- Window functions and CTEs
- Cohort and retention analysis
- Business-oriented SQL workflows
- Analytical thinking and reporting

I am deeply grateful for the quality, clarity, and accessibility of the educational material, which played an important role in my continued transition into data engineering and analytics.