# Covid19 Mortality Analysis with SQL (Microsoft SQL Server Management Studio 22)

## Which countries had the peak mortality rate during Covid19?

<img width="975" height="657" alt="image" src="https://github.com/user-attachments/assets/e80d174d-c352-4d78-8315-23915f34948a" />

From the query results, we can see that countries like Sudan, Guyana, Iran, Nicaragua, Guatemala, Gambia, and Philippines were suffering the most from the highest mortality rates (50-100%) during the February-March period of 2020.

## What about Canada? How was it doing in terms of mortality rate from Covid19?

<img width="975" height="657" alt="image" src="https://github.com/user-attachments/assets/a1ee6cdb-ea8a-424a-92a2-6c4735770dc8" />

 So, interestingly, the worst Canada had was in the May-June period  where its highest mortality rate from Covid was around 8.5%. Still not as bad as it was for some other countries round the world, thankfully.

## But when was the highest number of deaths? 

<img width="975" height="639" alt="image" src="https://github.com/user-attachments/assets/07f3ad6e-ae00-41d1-bdb4-3bb403842da8" />

Surprisingly, the most deaths it saw was in April of next year (2021). Even though the death percentage was around only 2%, over 23 thousand people died per day! We had to convert the ‘total_deaths’ column into INT here since its original data type was set as STRING, leading to erroneous results.

## Now let’s take a look at Bangladesh, on the other side of the world, struggling from the same pandemic.

<img width="975" height="656" alt="image" src="https://github.com/user-attachments/assets/5b22179b-2b24-4cab-947d-a67e7418f218" />

As expected, its worst mortality rate is much higher than Canada’s – 12.82% instead of 8.58%. They struggled with this the most around March-April period of 2020. 

## And when did most people die from Covid there?

<img width="975" height="639" alt="image" src="https://github.com/user-attachments/assets/9f4616b8-0a46-413c-9962-0453f755cf22" />

Luckily, it was around half of what it was in Canada – 11,000 daily deaths instead of 23,000. However, they both were around the same timeframe – April of 2021 – when possibly the second wave of Covid19 hit the world with its new variants. 

## Which countries suffered the most from high infection counts?

<img width="1262" height="746" alt="image" src="https://github.com/user-attachments/assets/d1fed6e9-2fef-4c31-a70f-e99a486dd577" />

As we can see here, first we had to ensure that the query is not regarding "World" or different continents to find the highest infection counts per country. After skipping them using the "NOT IN" clause, we found out that USA, India, and Brazil were the top three countries suffering from the highest infection counts. 
