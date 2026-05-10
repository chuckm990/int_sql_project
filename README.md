# Intermediate SQL - Sales Analysis

Outline
1. [Overview](#overview)
2. [Business Questions](#business-questions)
3. [Analysis Approach](#analysis-approach)
    * [Customer Segmentation Analysis](#1-customer-segmentation-analysis)
    * [Cohort Analysis](#2-cohort-analysis)
    * [Customer Retention Analysis](#3-retention-analysis)
4. [Strategic Recommendations](#strategic-recommendations)
5. [Technical Details](#technical-details)

---

## Overview
Analysis of customer behavior, retention, and lifetime value for an e-commerce company to improve customer retention and maximize revenue.

## Business Questions
1. **Customer segmentation**: Who are our most valuable customers?
2. **Cohort analysis**: How do different customer groups generate revenue?
3. **Retention analysis**: Who hasn't purchased recently?

## Analysis Approach

### 1. Customer Segmentation Analysis

- Segmented the customer base into three distinct tiers using Percentile Functions ($25^{th}$ and $75^{th}$ percentiles) to objectively define Low, Mid, and High LTV. 
- Quantified revenue concentration by calculating the percentage of total company revenue contributed by each LTV segment.
- Benchmarked performance metrics across groups, comparing average lifetime value against customer population counts to identify the most and least profitable segments.

💻 Query: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

#### Visualization

![Customer Segmentation](/images/1_customer_segmentation_donut_chart.png)
> The top quartile of customers ("High LTV") generates over $65\%$ of company revenue, highlighting a critical dependence on a small, premium segment.

![Strategic LTV Analysis](/images/1_customer_segmentation_strategic_ltv_analysis.png)
> This Pareto analysis confirms that High and Mid LTV tiers combined constitute nearly $98\%$ of company value, visually justifying a strategy of automated-only engagement for the non-performing Low-LTV segment.

***

### Key Findings
1.  **High-Value Pareto Distribution (The 66% Factor):** The "3 - High LTV" segment constitutes approximately **$25\%$** of the unique customer base but is responsible for a massive **$66.0\%$** of all net totals ($135.6M). This single finding anchors the need for a premium, retention-first business model.
2.  **The Middle-Ground Engine:** The "2 - Mid LTV" segment, while smaller in revenue percentage (32.3%), represents the **bulk of your active customer population (nearly $25k$ unique individuals)**. This segment has the greatest potential for upscaling via targeted lifecycle marketing.
3.  **Low-End Scale with Minimal Contribution:** The "1 - Low LTV" group has a customer count identical to the High-LTV group (a quirk of percentile splitting, but useful for comparison), yet their combined net total is only **$2.1\%$** of revenue ($4.3M). Their average lifetime spend is just **$347**.

### High-Value Business Insights
1.  **Revenue Vulnerability vs. Operational Cost:** The company relies almost exclusively on the top quartile of its customers for profitability. This is a potential risk: any competitive threat or churn within this group will significantly impact net profit. However, these customers likely cost the least to support on a per-revenue-dollar basis, offering the highest operational efficiency.
2.  **The Missed Upsell Opportunity:** The "Mid LTV" segment is highly diversified (the largest group). The monetisation gap between a $2,682 average (Mid) and a $10,961 average (High) is substantial. The business must shift resources from low-end acquisition to "Monetisation and Cross-selling" for this Mid-tier engine to maximize profitability.
3.  **Low-End "Market Friction":** While the "Low LTV" customers contribute negligible revenue, they consume customer support resources, marketing bandwidth, and operational logistics. They likely came in via deep discounts and bought only one or two small items. The strategy here should be about automated "re-activation or off-boarding" rather than active engagement.

***

### Actionable Marketing Strategy for Low-LTV Customers
*Dealing with customers who make up $25\%$ of your base but only $2.1\%$ of revenue requires an automated, low-cost approach to either upscale them or minimise their resource consumption.*

**Objective: Move or Minimise**

1.  **Automation of Lifecycle (Low-Cost Upscaling):**
    * **Strategy:** Never target these customers with high-cost advertising (like paid social retargeting). Use $100\%$ free/low-cost channels like automated email lifecycle triggers.
    * **Action:** Implement an "Upsell trigger sequence" for any customer who places an initial order under $500. The emails should *only* focus on upgrading them to higher-value product categories (e.g., Audio -> TV/Video). If they don't respond to three automated attempts within 6 months, off-board them from marketing communications.

2.  **"High-Basket" First Purchase Requirement:**
    * **Strategy:** If a large portion of this low-end group is new acquisition, adjust entry-level marketing.
    * **Action:** Remove entry-level or loss-leader products from prominent display on the homepage for new traffic. Instead, enforce minimum-order-value discounts (e.g., "$10\%$ off orders over $250" instead of "Free shipping on orders over $50"). This stops the acquisition of new "single-item, low-value" customers at the source.

3.  **Service Friction Management (Operational Efficiency):**
    * **Strategy:** These customers often have the highest support requests relative to their revenue contribution. Reduce the burden on live support agents.
    * **Action:** Ensure the support funnel for low-cost categories (Audio, Toys, etc.) is heavily automated via Chatbots, Help Center FAQs, and self-service return portals. Reserve live agent bandwidth strictly for high-monetization inquiries or high-tier LTV accounts.


### 2. Cohort Analysis

- Tracked revenue and customer count per cohorts
- Cohorts were grouped by year of first purchase
- Analyzed customer retention at a cohort level

💻 Query: [2_cohort_analysis.sql](/2_cohort_analysis.sql)

#### Visualization

![Cohort Analysis](/images/2_cohort_analysis.png)
> This visualization tracks initial customer revenue across ten years. By applying a quadratic polynomial fit, the analysis highlights a non-linear decline, capturing the accelerating drop-off in recent cohorts. This data-driven approach identifies a shift in customer value, essential for strategic recalibration of acquisition spending.

#### Key Findings

1. **Explosive Growth Phases (2018-2019 & 2022):** The business experienced two significant "scaling" events. In 2019, revenue peaked at **$\$22.3\text{M}$** from **$7,755$** new customers. This was followed by a massive acquisition surge in 2022, bringing in a record **$9,010$** new customers, though revenue remained slightly below the 2019 peak at **$\$20.6\text{M}$**.
    
2. **The 2020 Market Contraction:** There was a sharp and visible drop in both customer acquisition and revenue in 2020. Acquisition fell by over **$60\%$** compared to the previous year, suggesting a significant external market disruption or a pivot in business strategy that year.
    
3. **Revenue vs. Volume De-coupling:** While the number of customers in 2022 was **$16\%$** higher than in 2019, the total revenue generated was **$7\%$** lower. This indicates that while the company was able to acquire more customers, the value per individual customer was lower than in previous years.
    

#### High-Value Business Insights

1. **Acquisition Quality Dilution:** The "Average Revenue per Customer" (ARPU) for new cohorts has seen a general decline, dropping from a high of **$\$3,034$** in 2016 to **$\$2,043$** in 2023. This suggests that the current growth strategy is prioritized on **market share (volume)** over **premium acquisition (value)**. To maintain margins, the company should investigate if marketing spend is being allocated to lower-value channels.
    
2. **High-Value Retention Potential (2015-2017):** The earliest cohorts (2015-2017) demonstrated the highest individual spend per customer ($\sim\$3\text{k}$). These "legacy" segments are likely the company's most loyal and profitable base. A dedicated loyalty program targeting these high-spending archetypes could yield a higher ROI than aggressive new acquisition.
    
3. **Scaling Efficiency (The "2022 Strategy"):** The return to high-volume acquisition in 2022 after the 2020 slump shows strong recovery capability. However, the subsequent drop in 2023 and 2024 (partially due to incomplete year data) suggests that the company needs to stabilize its acquisition costs. If the cost to acquire the 9,010 customers in 2022 was high, the decreasing individual spend per customer could lead to a negative Customer Lifetime Value (LTV) to Acquisition Cost (CAC) ratio.

### 3. Retention Analysis

💻 Query: [3_retention_analysis.sql](/3_retention_analysis.sql)

#### Visualization

![Retention Analysis](/images/3_retention_analysis.png)
> Cohort Retention Dynamics (2015–2023) This analysis quantifies long-term loyalty by segmenting cohorts into active and churned status (defined as 6+ months of inactivity). While acquisition volume peaked in 2022, the consistent 90%+ churn rate across a decade identifies a critical business opportunity for post-purchase re-engagement and lifecycle marketing.

### Key Findings

1. **Low Baseline Retention:** Across all cohorts from 2015 to 2023, the retention rate remains consistently below **$11\%$**. This indicates that the business model relies heavily on one-time purchasers rather than repeat customers.
    
2. **Stability in Churn Rates:** Despite fluctuations in the total number of customers acquired (with a significant peak in 2022), the ratio of active-to-churned customers has remained remarkably stable, fluctuating only between **$8.4\%$ and $10.4\%$**.
    
3. **Scale vs. Retention (2022 Peak):** The 2022 cohort was the largest in history with over **9,000 customers**. Interestingly, it also achieved the highest retention rate in the dataset at **$10.4\%$**, suggesting that the high-volume acquisition year also brought in slightly higher-quality leads.
    

### Business Insights

1. **The "Leaky Bucket" Challenge:** The business is highly efficient at acquisition (as seen in the 2018, 2019, and 2022 volume spikes) but struggles to retain those users beyond the 6-month window. This suggests that the **post-purchase experience** or the product's natural replacement cycle needs to be addressed.
    
2. **Untapped Value in Churned Segments:** With over **$42,000$ customers classified as churned** across all cohorts, there is a massive opportunity for "Win-Back" or "Re-activation" campaigns. Re-acquiring a past customer is statistically cheaper than acquiring a new one; focusing on even a $5\%$ re-activation rate could nearly double the current active base.
    
3. **Product-Market Fit for Retention:** The consistent $90\%+$ churn rate across a decade suggests that the product may be a "one-off" purchase (durable goods) rather than a recurring need. If the goal is to increase LTV, the business should consider introducing complementary consumables, accessories, or a subscription-based service to provide a reason for customers to return.

## Strategic Recommendations

1. Customer Value Optimization (Customer Segmentation)

    - Launch VIP program for 12,372 high-value customers (66% revenue)
    - Create personalized upgrade paths for mid-value segment ($66.6M → $135.4M opportunity)
    - Design price-sensitive promotions for low-value segment to increase purchase frequency

2. Cohort Performance Strategy (Customer Revenue by Cohort)

    - Target 2022–2024 cohorts with personalized re-engagement offers
    - Implement loyalty/subscription programs to stabilize revenue fluctuations
    - Apply successful strategies from high-spending 2016–2018 cohorts to newer customers

3. Retention & Churn Prevention (Customer Retention)

    - Strengthen first 1–2 year engagement with onboarding incentives and loyalty rewards
    - Focus on targeted win-back campaigns for high-value churned customers
    - Use predictive churn intervention system before customer lifecycle lapse

## Technical Details

- **Database**: PostgreSQL
- **Analysis tools**: PostgreSQL, DBeaver, PGAdmin 9.0
- **Visualization**: Seaborn (python) + Gemini 3.1

