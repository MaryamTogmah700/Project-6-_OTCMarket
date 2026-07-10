Project 6: OTC Market Transaction

A. Problem Context

The OTC Market consists of securities that are traded outside of major stock exchanges, such as NASDAQ and the NYSE. This project builds a business intelligence solution that utilizes ETL, SQL and Tableau to be able transform OTC trading data into a dimensional data warehouse and interactive visualizations/dashboards. The visualizations will assist users with analyzing trading activity, identifying trends, comparing market tiers while also gaining insights into the overall OTC market performance.
Requirements 

B. Requirements

1. Requirements Analysis

- Financial Analyst - Analyzes OTC trading activity and predicts market trends.
  
- Investment Researcher -  Utilizes technical indicators in order to compare market tiers

- Portfolio Manager - Evaluates security status as well as trading volume before making investment decisions

- Business Intelligence Analyst - Keeps dashboards and reports that are used for decision making.

Risks

- Missing or incomplete market data

- Performance issues with large datasets 

- Accuracy of reports being affected by data quality

- Wrong ETL transformations

  Costs

  - Tableau Desktop License $ 75 for standard plan and goes up to $115

Timeline

Phase 1: Planning - Looking over the project to get an understanding of what's required and identified business objectives.

Phase 2: Gathering and Implementing - Gathered OTC Market dataset. Created Dimensional Model (star schema), Implement ETL process and loaded the data warehouse.

Phase 3: Designing - Created architecture, SQL analytical queries, Tableau visualizations/dashboards and presentation slides.

Phase 4: Final Checking and Submission - Made sure the data was valid as well as the results. Uploaded and pushed all necessary documents to github.


Benefits

- A more organized OTC market data

- Market trends being easily recognizable

- A more quicker assessment of financials

- Enhances the investment decision making process


 2. Business Requirements

- Store OTC trading data in a centralized warehouse
 
- Organize securities by market tier and security status

- Allow users to review/look at past trading activities 

- Dashboards are given for technical indicators 

- Use Tableau to help business intelligence reporting


3. Functional Requirements

- Import OTC market datasets 

- Clean and transform raw data

- Load data into a dimensional model (star schema)

- Calculate business measures

- Perform SQL analytical queries
  
- Move results, to use for Tableau

- Show interactive visuals/dashboards


4. Data Requirements

Fact Data;

- Trading, Dollar, & Share Volume.

- Open, Close, High, & Low Price.

- RSI

- MACD

- Moving Averages

- Shares Outstanding

- Yearly Return

Dimension Data;

- Security

- Market Tier

- Security Status

- Trading Venue

- Data             

C. Information Architecture

It follows a Business Intelligence workflow;

<img width="1651" height="351" alt="OTC Information Architecture  drawio" src="https://github.com/user-attachments/assets/064e57f6-82fe-4003-86b6-1f91da76bc20" />

2. Data Architecture

- The OTC Market project follows a structured data flow. Data is collected from the OTC Market source, it is then clean and integrated, while being processed using SQL, stored in an SQL database and finally, visualized in Tableau for analysis.

<img width="774" height="144" alt="Screenshot 2026-07-09 at 10 09 35 PM" src="https://github.com/user-attachments/assets/89a7467a-71c6-4cff-8f63-84dfc84830d3" />


3. Technical Architecture

   Software - DuckDB, SQL, Python & Tableau Desktop
 
   Tools - CSV dateset, DuckDB database & Tableau for dashboards/visualizations
  
   Hardware - Personal computer


   <img width="1114" height="248" alt="Technical Architecture drawio" src="https://github.com/user-attachments/assets/ca1ca9c1-08ca-470f-8330-59c8a8fdbf42" />

4. Product Architecture

   The data moves from the raw CSV file and into DuckDb and that's where the transformations take place. The SQL queries are then able to make summaries of the dataset which are then visualized in Tableau.


<img width="678" height="159" alt="Screenshot 2026-07-09 at 10 13 15 PM" src="https://github.com/user-attachments/assets/2484f210-d819-46a9-8578-87566a5dd8d1" />



D.  Modeling

1.  Dimensional Modeling
   
  Facts: fact_otc_market_final
  
1.  Measures include: Share Volume, Dollar Volume, RSI, MACD, Shares Outstanding, Trade Count, & yearly Return

    Dimension: Date, Security, Venue, Security Status, & Market Tier

<img width="956" height="653" alt="Screenshot 2026-07-09 at 10 25 24 PM" src="https://github.com/user-attachments/assets/f45f49f9-4001-4d3e-9d50-66a60a49ab84" />

E.  Methodology and Implementation

This project used the structured waterfall approach.

Key phases: Data collection, Data processing, dimensional modeling, SQL development, testing and visualization.

1. Sprint 1: Set up and Data Collection - We collected OTC Market datasets and reviewed the available fields needed for the analysis

2. Sprint 2: Data Processing and Cleaning - Then we prepared the raw data by checking for missing values, duplicates and inconsistent formatting. 

3. Sprint 3: Dimensional Model Building - Next we Designed the data warehouse using a star schema consisting of one fact table and multiple dimension tables.

4. Sprint 4: SQL Development - As well as created SQL scripts for dimension tables, fact table, ETL loading & aggregation queries.

5. Sprint 5: Testing and Verification- Finally we Tested the primary key as well as the foreign key relationships and verified the data for precision and consistency.

6. Sprint 6: Deployment and Validation - Exported query results to CSV and used them to build Tableau dashboards. 

Metadata Management;

<img width="520" height="375" alt="Screenshot 2026-07-09 at 10 29 09 PM" src="https://github.com/user-attachments/assets/4ff711f4-6d1a-4bee-a2fd-2a7d61de2df0" />

Functions;

- Dimension table creation

- Fact table creation

- ETL loading

- SQL aggregation queries

ETL;

- Extract: Import CSV files

- Transform:

Tools;
- DuckDB

- SQL
  
- GitHub

- Tableau

F. Visualization

The dashboard contains 6 visualizations.

<img width="1347" height="691" alt="tcccc" src="https://github.com/user-attachments/assets/ec1a664b-c9e3-483b-b749-126eeed401bb" />

1: Top 10 OTC Securities by Trading Volume shows securities with the highest trading volume.

2: Average Dollar by Volume and Venue compares the trading activity between OTC Link & Grey Market venues.

3: Shares Outstanding by Security Status shows the distribution of shares among Active, Revoked, and Halted securities.

4: Average RSI by Market Tier compares Relative Strength Index across OTC market tiers.

5: Average MACD by Market Tier shows the average MACD values for each tier using a formatted data table.

6: Average Share Volume by Market Tier shows the average share volume across OTC market tiers.

G. Insights

- A large majority of the outstanding shares are active securities.

- Trading volume is concentrated among a small number of OTC securities.

- Pink Current securities exhibit the highest average share volume.

- OTC Link handles a significantly more average dollar volume than the Grey Market.

- Average RSI values differ significantly across market tiers.

H. Conclusion

We were able to develop a dimensional data warehouse using tools such as DuckDB, SQL and Tableau for our OTC market analysis. The visuals and dashboard give a better demonstration and understanding into trading activity, market tiers and security performance. In conclusion, the project showed how business intelligence tools can take raw data and transfrom it into valuable findings for a more effective decision making.

I. References

1. OTC Markets Group. (2025). OTC Markets. https://www.otcmarkets.com/

2. Kimball, R., & Ross, M. (2013). The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling (3rd ed.). Wiley.

3. Financial Industry Regulatory Authority. (n.d). OTC (Over-the-Counter) securities. https://www.finra.org/finra-search?q=otc
