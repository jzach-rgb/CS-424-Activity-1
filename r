Joshua Zacharias
CS 424
Fabio Miranda
Assignment 1: Collecting data and sketching visualizations

# Task 1

For this project, I will be collecting data by using Cor Coffee’s Square Point of Sale (POS) System. Cor Coffee is a coffee shop that I work at, located near the University of Illinois at Chicago. All of the data used was approved by the manager.
	In this analysis, I plan to observe how customers’ choice drink modfiers varies across drinks, times, and sales amounts at Cor Coffee. My leading domain questions are:
•	Which drink modifers are ordered the most frequent, and how does the modifier popularity vary by drink  type?
•	How do customers’ modifier choices change throught the day or across different days of the week?
•	Are drinks with certain modifiers associated with higher average item prices than drinks without those modifers associated with higher average item prices than drinks without those modifers?
•	What combinations of modifers are regularly ordered together?

I will collect data from Cor Coffee from September 7th to October 2nd. One observation will consist of one transaction made by a customer. The attributes recorded for each transaction will include the date, time, price, and modifiers attached to the transaction. These attributes will be recorded automatically by the Square POS system after a barista enters the customer's order and any modifications. I plan to collect every transaction made through the POS system during Cor Coffee's operating hours of 9:00 AM to 4:00 PM. Collecting transactions throughout the entire day and across multiple weeks should provide meaningful variation compared with only collecting data during specific times or on specific days. Since I am working alone, I will be responsible for the entire collection process. One limitation of my collection process is that it may not capture situations where a certain syrup, milk, or other option was unavailable, which could cause customers to choose a different modifier than they normally would. Possible sources of bias also include outside factors such as weather conditions. For example, hotter weather may cause customers to purchase more iced drinks, while colder or rainy weather may lead to more hot drink purchases.


| Attribute | Type | Description | Example |
|---|---|---|---|
| item | Categorical | The drink or item purchased in the transaction | Latte |
| temp | Categorical | Whether the drink was ordered hot or iced | Iced |
| sales | Quantitative | The sales amount associated with the item | $5.75 |
| syrup | Categorical | The syrup or flavor added to the drink, if applicable | Vanilla |
| date | Temporal | The date the transaction occurred | 09/15/2026 |
| time | Temporal | The time the transaction occurred | 10:32 AM |
