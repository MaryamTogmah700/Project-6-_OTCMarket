Business Requirements
This Business needs a product intelligence system that will be able to help a retail analytics team and also help the team analyze the effectiveness of an Amazon product using Apify product listing data. Essentially we want to compare brands, categories, sellers, prices, ratings, reviews, stock status and product rankings. Retail analytics, managers, business executives, pricing analysts, product managers and marketing are all part of our top/main users. Which products have the biggest discounts, what brands have the highest ratings, what features of products are commonly advertised, what/which products have the most reviews, which sellers are associated with the most product and etc, are all questions that must be answered by the system. Lastly, a RAG system and analytics for a data warehouse should both be put in place to allow customers/users to ask questions regarding product listing descriptions. 
Functional Requirements
The system must ensure that customers cann analyze products by brands, category, price, seller, rating, stock status, as well as reviews. They should also be able to compare current price against listing price, calculate discount amount and discount percentage, identify high-rated products and products with many reviews and also view rating breakdowns from 5 start to 1 star ratings. The system should also allow users to inquire about product information through natural language. Return policies, stock status, delivery information, products titles and features should be accessible for users to search for. In order for the system to answer product information and data inquiries using one system, it combines data warehouse results along with RAG to support questions that are both numerical and text based.  
Data Requirements
Apify Amazon Product listing data is the source of the information. Structure data are ASIN, brand, list price, answered questions, stock status, seller review count, review count, price, seller name, seller rating, star rating, shipping prices, and rating breakdown. While text fields contain features, stock availability text, product title, breadcrumbs, seller details, delivery text, support information and seller details. For every date, a single photo of every product is kept in the warehouse. Duplicates, missing brands & prices, ASINs, unavailable stock, inconsistent categories and inconsistent pricing format, are all things that should be found through data quality checks.
Requirements Analysis and Assumptions
According to the requirements, it is evident that the solution needs two connected parts, the data warehouse and RAG system. Structured questions like, counts, averages, numbers, comparisons, ranking, and grouping are all questions the data warehouse should answer. The following assumptions were used for this solution. Each row represents one Amazon product listing snapshot. ASIN uniquely identifies each product and is used to remove duplicates. Breadcrumbs are used to create the category hierarchy. Product, Category, Seller, Brand, Date and Stock Status are modeled as tables, whereas reviews, prices, ratings, answered questions and discounts are modeled as facts.
Dimensional Modeling (Star Schema)

Information Architecture

Data Architecture

Technical Architecture

Product Architecture


Conclusions and Reflections
This system, by combining a RAG and data warehouse systems, was able to develop an Amazon Product intelligence platform. Both served different purposes, RAG allowed product listing details like delivery, features, seller information and return policies to be searched and summarized while the data warehouse assisted with analysis of products performance, pricing, reviews, sellers, rating categories and availability. This system is able to guide & help users make better decisions on products, pricing, brand and inventory decisions, all from just one system. But, since the system relies on current Amazon data, it's crucial that RAG is frequently checked on for precision. Later in the future, improvements include/contain better data quality checks, automatic data updates, alerts for stock and price changes and improved product comparison features.
References
Apify Technologies. (n.d) Amazon Product Scraper. Retrieved June 27, 2026 from https://apify.com/junglee/amazon-crawler?utm_source
Kimball, R., & Ross, M. (2013). The data warehouse toolkit: The definitive guide to dimensional modeling(3rd ed.). John Wiley & Sons.
