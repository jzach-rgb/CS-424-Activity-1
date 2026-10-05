## Assignment 1: Collecting data and sketching visualizations
Joshua Zacharias

CS 424

Fabio Miranda

## Task 1

For this project, I will be collecting data by using Cor Coffee’s Square Point of Sale (POS) System. Cor Coffee is a coffee shop that I work at, located near the University of Illinois at Chicago. All of the data used was approved by the manager.
	In this analysis, I plan to observe how customers’ choice drink modfiers varies across drinks, times, and sales amounts at Cor Coffee. My leading domain questions are:
•	Which drink modifers are ordered the most frequent, and how does the modifier popularity vary by drink  type?
•	How do customers’ modifier choices change throught the day or across different days of the week?
•	Are drinks with certain modifiers associated with higher average item prices than drinks without those modifers associated with higher average item prices than drinks without those modifers?
•	What combinations of modifers are regularly ordered together?

I will collect data from Cor Coffee from September 8th to October 2nd. One observation will consist of one transaction made by a customer. The attributes recorded for each transaction will include the date, time, price, and modifiers attached to the transaction. These attributes will be recorded automatically by the Square POS system after a barista enters the customer's order and any modifications. I plan to collect every transaction made through the POS system during Cor Coffee's operating hours of 9:00 AM to 4:00 PM. Collecting transactions throughout the entire day and across multiple weeks should provide meaningful variation compared with only collecting data during specific times or on specific days. Since I am working alone, I will be responsible for the entire collection process. One limitation of my collection process is that it may not capture situations where a certain syrup, milk, or other option was unavailable, which could cause customers to choose a different modifier than they normally would. Possible sources of bias also include outside factors such as weather conditions. For example, hotter weather may cause customers to purchase more iced drinks, while colder or rainy weather may lead to more hot drink purchases.


| Attribute | Type | Description | Example |
|---|---|---|---|
| Date | Temporal | Date the item was purchased | 2026-09-08 |
| Time | Temporal | Time the item was purchased | 09:12:17 |
| Category | Categorical | General Square category the purchased item belongs to | Espresso Drinks |
| Item | Categorical | Name of the item purchased | Latte |
| Modifiers Applied | Categorical | Modifications applied to the item, including temperature, syrup, milk, and other options | Regular, To go, Iced, Whole, Blueberry |
| Gross Sales | Quantitative | Price of the item before discounts | $5.50 |
| Discounts | Quantitative | Amount discounted from the item | $0.00 |
| Net Sales | Quantitative | Final sales amount after discounts | $5.50 |
| Count | Quantitative | Number of that item included in the observation | 1 |


## Task 2

### Pilot Data

| Date | Time | Category | Item | Modifiers Applied | Gross Sales | Discounts | Net Sales | Count |
|---|---|---|---|---|---:|---:|---:|---:|
| 2026-09-08 | 09:12:17 | Coffee Drinks | Cold Brew | To go, Vanilla, Half&Half (drip splash) | $5.00 | $0.00 | $5.00 | 1 |
| 2026-09-08 | 09:12:17 | Espresso Drinks | Latte | Regular, To go, Iced, Whole, Blueberry | $5.50 | $0.00 | $5.50 | 1 |
| 2026-09-08 | 09:09:30 | Espresso Drinks | Latte | Regular, To go, Iced, Whole, Vanilla | $5.25 | $0.00 | $5.25 | 1 |
| 2026-09-08 | 09:07:03 | Coffee Drinks | Coffee | Cinnamon Roll | $3.75 | $0.00 | $3.75 | 1 |
| 2026-09-08 | 09:06:10 | Espresso Drinks | Latte | Regular, To go, Iced, Almond, Blueberry, Cinnamon Roll, Cold Foam | $7.80 | $0.00 | $7.80 | 1 |
| 2026-09-08 | 09:06:10 | Espresso Drinks | Latte | Regular, To go, Iced, Oat, Cinnamon Roll | $6.30 | $0.00 | $6.30 | 1 |
| 2026-09-08 | 09:03:57 | Espresso Drinks | Latte | Regular, To go, Iced, Whole, Vanilla | $5.25 | $0.00 | $5.25 | 1 |
| 2026-09-08 | 09:03:25 | Coffee Drinks | Coffee | To go | $3.00 | $0.00 | $3.00 | 1 |
| 2026-09-08 | 09:02:45 | Teas | Matcha Latte | Cold Foam, To go, Iced, Whole | $6.25 | $0.00 | $6.25 | 1 |
| 2026-09-08 | 09:02:05 | Espresso Drinks | Latte | Regular, To go, Iced, Whole | $4.75 | $0.00 | $4.75 | 1 |




After getting my 10 samples of data, I was able to see that the Square data does contains the information needed for my analysis, but it also revealed some issues that needed to be considered before processing the full dataset. First, I originally considered one transaction to be one observation. However, I found that a single transaction can contain multiple drinks that are recorded on separate rows. Because I am interested in the item and its modifiers, I changed the definition of an observation to one item sold in order to be more precise. I also found that modifiers are not always recorded in exactly the same way. Some drinks explicitly contain an "Iced" modifier, while the temperature of other drinks could be implied by the item itself, such as Cold Brew. The type of syrup attribute also will need more processing because the modifier field contains other information such as milk type, whether the order is to go, and cold foam. Some drinks can also contain more than one syrup, such as a latte containing both Blueberry and Cinnamon Roll. Because of these findings, I will process the Square data before analysis by separating the modifier information into the attributes needed for this project. The final dataset will contain item, temperature, sales, syrup, date, and time. Missing syrups will be recorded as none rather than removing those observations. The pilot helped confirm that these attributes can be extracted from the Square data while also showing where additional cleaning is necessary.




After completing the pilot, I collected the full dataset from Cor Coffee's Square POS system for from September 7th through October 2nd. The data includes all items sold during the store's operating hours of 9:00 AM to 4:00 PM however it also included private information such as PAN suffix. I created a python script called getridofsensitveInfo (attached) in order to get rid of these columns and the final dataset is included in the repository as `sanitized_raw_data.csv`.


## Task 3

The final dataset has 2667 observations collected from Cor Coffee's Square POS system between September 7th and October 2nd. Each observation represents one item sold. The dataset contains information such as the date and time of the purchase, the item and category, the modifiers applied to the item, and its sales value. Because the data was collected across several weeks and throughout Cor Coffee's operating hours, it contains variation across different days, times, drinks, and modifier choices. One limitation of the dataset is that the Square system only records the final purchase and does not explain why a customer selected a particular modifier. It also does not record situations where an ingredient was unavailable, which could influence the customer's choice. Outside factors such as weather, events, or changes in customer traffic can also affect the purchasing patterns observed in the data. Modifier information can also be difficult to interpret because several different modifier types are stored together in the same field.


1. Which drink modifiers are ordered most frequently?

**I chose this question because knowing what modifiers are ordered the most frequently
   can help us know what types of flavors our customers like so we can choose better seasonal syrups (a flavor that 
   changes every month). This would give us safer choices for every time we choose a new seasonal syrup. For this
   I would just need modifiers applied**
   
2. How do modifier choices change depending on the time of day?

   **If we know what modifers are popular during one set of the day then we can better prepare for the rest of the day
   this lets us better prepare for rushes. All I would need is modifers applied and the Time.**

3. Are certain modifiers associated with higher sales prices?

  **It's helpful to know if a certain modifer generates more or less revenue per item because then we can either
  increase the quantity to meet demand or descrease to save money. The attributes I need for this one are modifers applied
  and Net Sales**

4. Which combinations of modifiers are most commonly ordered together?

  **I chose this question because if a certain combination sells more, then we can be sure that is more well liked. Knowing this we will know the prefrences of our customers so Cor can create better drinks suited to them. The attributes we will need are going to be Modifers Applied and Item**


## Task 4

### 1. Which drink modifiers are ordered most frequently?

**Action:** Identify and compare  
**Target:** Frequency of different drink modifiers

The goal is to identify which modifiers appear most often and compare their frequencies. This changes the original question from being specifically about Cor Coffee into the more general task of comparing categorical frequencies.

### 2. How do modifier choices change depending on the time of day?

**Action:** Compare and identify trends  
**Target:** Modifier frequency across different times of day

The goal is to compare modifier choices across different time periods and identify whether certain modifiers become more or less common throughout the day. This abstraction focuses on how a categorical variable changes across time.

### 3. Are certain modifiers associated with higher sales prices?

**Action:** Compare and identify relationships  
**Target:** Sales values associated with different modifiers

The goal is to compare sales values between different modifier groups and identify whether some modifiers are associated with higher sales. This turns the original question into a general task of examining the relationship between a categorical attribute and a quantitative attribute.

### 4. Which combinations of modifiers are most commonly ordered together?

**Action:** Identify and compare  
**Target:** Frequently occurring combinations of modifiers

The goal is to identify which modifier combinations occur together most often and compare their frequencies. This abstraction focuses on finding patterns and relationships between categorical values.
