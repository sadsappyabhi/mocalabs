+++
date = '2025-12-18T13:55:10-06:00'
draft = false
title = 'NYC MTA Subway Hourly Ridership'
+++

Recently, I created some visualizations in Tableau to explore a dataset that is personally interesting to me. I am passionate about public transit and walkable cities, and will be forever disappointed that pretty much all of North America besides NYC allowed car dependency to destroy our cities from the mid 20th century on. If the previous sentence is surprising to you, [Jason Slaughter](https://en.wikipedia.org/wiki/Not_Just_Bikes) has a series of video essays that are a great introduction to the subject.

This data was sourced from [Kaggle](https://www.kaggle.com/datasets/princehobby/metropolitan-transportation-authority-mta-datasets), specifically the sheet titled [MTA Subway Hourly Ridership Beginning February 2022](https://www.kaggle.com/datasets/princehobby/metropolitan-transportation-authority-mta-datasets?select=MTA_Subway_Hourly_Ridership__Beginning_February_2022.csv).  

Fair warning/disclaimer: This was part of a project for school and the writing below was directed by the assignment guidelines. If you'd rather just see the Tableau Story it's available on [Tableau Public](https://public.tableau.com/app/profile/abhilasha.figueroa/viz/MTASubwayHourlyRidershipSince2022/FinalStory). 

***

![NYC MTA Hourly Ridership Since 2022 Cover Image](/posts/2025/nyc-mta-subway-hourly-ridership/img/Story%20Title%20Page.png)

The five questions that will be answered with these visualizations are:
1. What are the peak subway ridership hours in each borough?
2. How do ridership patterns differ between OMNY and MetroCard users?
3. What are the busiest stations, and how does this vary by time of day?
4. What are the most common transfer stations and how are they distributed by borough?
5. How does the ridership of MetroCard Unlimited 7-Day Pass riders compare to those with the 30-Day Pass. 

***

To find peak subway ridership in each borough, a good place to begin is with a heatmap of transit entrances per hour, categorized by borough. 

![Dashboard containing a Heat Map, Line Graph, and a Tree Map of hourly ridership by borough](/posts/2025/nyc-mta-subway-hourly-ridership/img/Q1%20Dashboard.png)

The highest concentration of rider entrances occurs in Manhattan during the afternoon. This indicates that:
1. Most ridership occurs during rush hour.
2. Departures from Manhattan in the afternoon make up a majority of the daily traffic. 

In the line graph, the distribution between each borough can be seen more clearly. An interesting pattern emerges when we compare each borough’s high point: Brooklyn, Queens, and the Bronx all have their peaks during the morning rush hour. This suggests that most rush hour traffic flows from these boroughs into Manhattan in the morning, and then in the afternoon all these same people depart from Manhattan heading back to their borough of residence. 

The Tree Map further reinforces this finding. It shows that afternoon departures from Manhattan make up the largest portion of entrances. In contrast, Brooklyn, Queens, and the Bronx experience their peaks in ridership around seven or eight in the morning. 

***

To answer the question of OMNY vs MetroCard, one can break down the usage of OMNY versus MetroCard based on three different factors: hour of the day, day of the week, and borough. 

![Dashboard containing bar charts of OMNY and MetroCard users by hour of the day, day of the week, and borough](/posts/2025/nyc-mta-subway-hourly-ridership/img/Q2%20Dashboard.png)

The hourly bar graph shows that MetroCard is the preferred method of payment during the morning rush hour. However, from 11 AM through two in the morning, OMNY prevails as the dominant payment method. 

When examining the breakdown by day of the week, MetroCard leads on all weekdays. OMNY, however, is used more than MetroCard on weekends.  

Looking at the boroughs, MetroCard is the preferred payment method in all areas except for Manhattan. The common travel pattern is outer borough residents commuting to Manhattan in the morning and returning to their borough of residence in the afternoon. The popularity of MetroCard during the morning rush hour and weekdays suggests that locals predominantly use it to commute to work. In contrast, tourists and leisure travelers tend to use OMNY in the evenings and on weekends. Therefore, one can assume that locals use a dedicated fare payment card, while tourists might simply tap their phones at the turnstile.

***

Analyzing the data for the busiest stations produced some expected results and a few surprises.

![Dashboard containing a bar chart, map, and  line graph of the top 10 busiest subway stations](/posts/2025/nyc-mta-subway-hourly-ridership/img/Q3%20Dashboard.png)

As expected, nine out of ten of the busiest stations were in Manhattan. It is, however, surprising how much Midtown dominated over lower Manhattan and the Financial District. 

Given that Manhattan has two financial centers (Midtown and the Financial District), one could have expected a more even split between the two. However, all but three of the top 10 stations were in Midtown. The two non-midtown and non-financial-district top 10 stations were 14th St-Union Square and 74th-Broadway in Queens. Union Square can be explained by it being a haven for shopping and tourists, but 74th-Broadway in Queens is a different story. Queens has large areas that are underserved by subway trains; therefore, many Queens residents will start their journey on a bus. 74th-Broadway is a station where the 7 train intersects with the E, F, M, and R trains. Consequently, this is a prime location for riders of multiple lines to enter the subway system, making it the only non-Manhattan station to make the top 10.

When examining the top 10 stations by hourly riders, an interesting phenomenon appears: all but one of these stations have both a morning and afternoon rush hour peak. The 47-50th St-Rockefeller Center station is highlighted because it is the singular top ten station with only an afternoon peak. The absence of a morning rush suggests that the surrounding area is more of a destination than a place to depart from. The diagram to the right shows that the surrounding area is lacking in residential buildings but is full of tourist attractions. There are also fewer transfers available here compared to the other top 10 stations. This explains why this is the single top ten station that is lacking a morning rush.

***

When exploring transfers in this dataset, it is important to note that transfers represented here are a subset of total ridership for each station. Only bus-to-subway and out-of-network transfers are counted. Persons transferring from one subway line to another at the same station are not counted. This is because most line-to-line transfers do not exit the station and therefore do not require passing through a turnstile at the transfer station (this data was collected from turnstile swipes). This fundamentally changes the insights that can be gathered from the data. In the previous section, it was noted that many Queens residents begin their journey by bus prior to transferring to the subway. This would explain why seven out of the ten top stations by transfers are in Queens.

![Dashboard containing a bar chart, line chart, and a map of the top 10 transfer stations](/posts/2025/nyc-mta-subway-hourly-ridership/img/Q4%20Dashboard.png)

When comparing boroughs, it is clear to see that Queens, Brooklyn, and the Bronx all have their maximum transfer volume during the morning rush hour, while Manhattan’s is during the afternoon rush. This further reinforces the previously observed pattern of people residing in outer boroughs commuting into Manhattan in the morning, and out of manhattan in the afternoon.

Plotting this data on a map shows that the station with the greatest number of transfers is the last stop on the 7 train in Queens (Flushing-Main St). It being the end of the line indicates that this is where a significant number of people enter the subway system from suburban Nassau and Suffolk counties.

***

Finally, question 5 explores the differences between MetroCard Unlimited 7-Day passes and 30-Day passes. The hypothesis here is that locals who commute to work are more likely to purchase 30-Day Unlimited passes, while 7-Day Unlimited passes are more popular amongst visitors who will not stay in town for more than a week.

![Dashboard containing a comparison between MetroCard Unlimited 7-Day and 30-Day passes](/posts/2025/nyc-mta-subway-hourly-ridership/img/Q5%20Dashboard.png)

This view of hourly ridership shows that 30-Day pass ridership has both a morning and afternoon peak coinciding with rush hour, while 7-Day pass users have a single peak in the afternoon.

Further reinforcing this divide between locals and visitors is the breakdown by borough. Manhattan is the only borough in which 7-Day passes make up a significantly higher amount of total ridership compared to 30-Day passes. This coincides with the fact that most tourists stay in and visit attractions in Manhattan.

Furthermore, we see this pattern continue when viewing this data for the top 20 stations. Throughout Manhattan, all but one of the busiest stations have significantly higher ridership from 7-Day pass users. Meanwhile, the two stations representing Queens show a more even dispersion between the two. This indicates a high concentration of residents in Queens while most tourists enter the transit system in Manhattan.

![Thank You Slide](/posts/2025/nyc-mta-subway-hourly-ridership/img/Story%20Ending%20Page.png)

There you have it! This was certainly a fun dataset to work with. I now welcome your comments and hatemail - you can find both my email and Mastodon on the contact page of my [artist website](https://www.abhiche.com/).