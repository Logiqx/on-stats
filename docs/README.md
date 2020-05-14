# ONS Statistics

## Analysis of Excess Deaths

Author: Michael George

Date Created: 12 May 2020



### Introduction

Let me begin this article by stating that I am not an epidemiologist and that I'm a software engineer who has been something of a data geek for around 25 years. I worked in data warehousing and related reporting in the 90's, data engineering and analytics since the turn of the millennium and focused on data science projects in recent years.

Since mid-February, I have acquired something of an interest in the data and developments relating to SARS-CoV-2 (virus) and COVID-19 (disease) and I've done a fair bit of data exploration out of my own personal curiosity. Since several weeks worth of the epidemic are now included in the weekly data published by the Office for National Statistics (e.g. weekly deaths in England and Wales), I have decided to do a write up of how the current year compares to the past 50 years; 1970 onwards. This analysis follows on from an article that I wrote a couple of weeks ago - [COVID-19 - UK Trends and Observations](https://logiqx.github.io/covid-stats/).

This document was mainly created from the number of daily deaths recorded by the ONS over the past 50 years; Jan 1970 to Dec 2018. Provisional daily figures for Jan 2019 to July 2019 were taken from the Excess Winter Deaths report published by the ONS in November 2019. The weekly figures for August 2019 onwards are taken from the weekly death registrations as published by the ONS.

Note: The weekly figures (August 2019 onwards) suffer from registration delays over bank holiday periods (e.g. Easter, May, August, Christmas / New Year). The weekly figures for August 2019 and Christmas 2019 have therefore been smoothed / re-distributed for this piece of analysis to avoid any confusion when they are compared with historical figures. On average it usually takes around 5 days for a death to be registered in England and Wales with 74% of all deaths being registered within 7 calendar days, according to the latest [analysis](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/articles/impactofregistrationdelaysonmortalitystatisticsinenglandandwales/2018) by the ONS.



### Excess Winter Deaths

It is well recognised that there are more deaths during the winter months than in the summer months. This happens every year and always has some variation, depending on the severity of any influenza outbreaks, cold weather and various other common causes of death in the elderly. The additional deaths during the colder months of the year are referred to as "Excess Winter Deaths" (EWD).

Yearly [bulletins](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/previousReleases) are published by the ONS every November and the chart below shows how the number of EWD has varied since 1970.

Note: I created the chart below from the exact number of daily deaths based on date of occurrence (rather than the date of registration) and my EWD figures are identical to the figures in the latest ONS [bulletin](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final).

![alt text](img/excess_winter_deaths_1970_2019.png" "Excess Winter Deaths 1970-1971 to 2018-2019")

It is worth mentioning how EWD are calculated in the UK. The chart below shows the number of weekly deaths in England and Wales during the past twenty years. EWD are defined as the number of additional deaths during the 4 "winter" months (1 December to 31 March), over and above the average number of deaths during the 4 months preceding and 4 months following the "winter" months.

![alt text](img/excess_winter_deaths.png" "Weekly Deaths 2000-2019")

It can clearly be seen that the number of deaths between the months of April and November have not varied much over the past 20 years whereas the "winter" deaths show far more variation. This variation during the winter months is due to the EWD.

Peaks in EWD are not unusual and there have been about a dozen of them during the past 50 years. I have highlighted the most significant peaks since 1970 using red circles and all of these peaks are examined within this document, plus last year; 2018-2019.

![alt text](img/excess_winter_deaths_1970_2019_alt.png" "Excess Winter Deaths 1970-1971 to 2018-2019 (highlighted)")



### Excess Deaths

In addition to the concept of "Excess Winter Deaths" it is also common to report the number of "Excess Deaths", either weekly or monthly. These are defined as the number of deaths over and above the 5-year average for that specific week / month of the year.

By plotting the weekly deaths registered during 2019-2020 it can be seen that up to Friday 20 March (week 12) the number of deaths being registered in England and Wales was consistent with the 5-year average. I haven't adjusted the dates to cater for registration delays (likely to be ~5 days on average) since it is not clear whether registration delays are better or worse than is "normal" at this time.

From April onwards the number of weekly deaths would be expected to be falling because the winter "flu season" has ended. If you are wondering whether there is a precedent for such a large numbers of excess deaths outside of the flu season you will have that question answered by this report. This report will also compare what we have seen in April 2020 against all of the worst spikes in EWD over the past 50 years.

![alt text](img/excess_deaths.png" "Excess Deaths 2019-2020")




### Five Decades (1970-2020)

For each decade, I have plotted a graph containing every single year (mainly using grey lines) and coloured the "worst" years for clarity. The figures for 2019-2020 (red line) have also been included in all of the charts for ease of comparison.



#### 2000-2020

Both decades have been plotted on a single graph due to their obvious similarities. It can be seen clearly that there is not much in the way of variation between the individual years from 2000 to 2019, especially during the months between April and November. Since the year 2000-2001 there haven't been any significant weekly spikes in deaths but a consistently high number of weekly deaths during 2017-2018 (blue line) lead to [49,410](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final) EWD which was the highest recorded since 1975-1976.

The year 2019-2020 had been consistent with the 5 year average and was typical of the past 20 years, until Friday 27 March (week 13) when there was a small but "unexpected" increase in the number of weekly deaths. Weeks 14 to 18 showed a big spike, mainly due to COVID-19 related deaths but some of the other causes have yet to be confirmed.

Note: "Swine Flu" was prevalent in the UK during 2009 but there were [few deaths](https://www.nhs.uk/news/cancer/swine-flu-deaths-examined/) despite many people being very sick and hospitalised.

![alt text](img/weekly_deaths_2000_2020.png" "Weekly Deaths 2000-2020")



#### 1990-2000

This is where historical comparisons start to become slightly more interesting. Several winter spikes can be seen during the 1990s but the number of EWD in 2017-2018 still was higher than any of the winters in the 1990s. It was estimated that just under [22,000](http://news.bbc.co.uk/1/hi/health/4358364.stm) people were killed by seasonal flu in the year 1999/2000 (blue line) when the EWD was [48,420](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales). The incidence of acute bronchitis in the elderly during 1999/2000 was at record levels and coincided with seasonal flu which in itself was [not exceptional](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2870877/). It was also estimated that just under [21,400](http://news.bbc.co.uk/1/hi/health/4358364.stm) people were killed by flu in the year 1996/97 (orange line) when the EWD was [47,700](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales).

When comparing the peak in April 2020 to the 1990s you should consider that at no point during the last 50 years has any noticeable spike been observed in weekly deaths for the months of April to November. The 2020 peak for the week ending Friday 17 April (week 16) was also very much an "artificial" peak due to the UK lockdown measures. Without reducing the spread of the virus in March and early April the numbers of weekly deaths would have been several times higher during April 2020. There is little room for doubt because of the principles of the [SIR](https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology) model and the elaborations that have underpinned epidemiology for nearly a century. You can learn the very basics of epidemiology from a couple of short videos on YouTube; [TED](https://www.youtube.com/watch?v=eHlu6Vi_wxo) and [3Blue1Brown](https://www.youtube.com/watch?v=Kas0tIxDvrg).

![alt text](img/weekly_deaths_1990_2000.png" "Weekly Deaths 1990-2000")



#### 1980-1990

The 1989/90 winter period was the [worst since 1975/76](https://www.nytimes.com/1989/12/24/world/british-flu-epidemic-claims-lives-and-is-forcing-delays-in-surgery.html) and was the last [flu epidemic](https://www.theguardian.com/world/2000/jan/10/qanda.infectiousdiseases) to hit the UK. The epidemic began in late November (peaking in December) and it was estimated that 600 people per 1,000 fell ill, leading to [26,000](https://www.theguardian.com/world/2000/jan/10/qanda.infectiousdiseases) deaths. The total number of EWD in 1989/90 was [47,200](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales) which was not dissimilar to other bad winters throughout the 1990s.

I've also highlighted 1985/86 (orange line) when the number of EWD was [49,330](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales) and 1984/85 (green line) when the number of EWD was [47,380](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales). It is worth noting that although the peak in 1985/86 (orange line) was less pronounced than 1989/90 (blue line) the total number of EWD was approximately 2,000 higher in 1985/86. This illustrates how excess deaths can be compressed into a shorter timeframe or spread out over a longer timeframe but still result in a similar total.  

Since the flu epidemic in 1989/1990 there have been yearly campaigns for widespread flu vaccinations which partly explains why we haven't seen any big spikes or large numbers of flu related deaths since the turn of the millennium.

![alt text](img/weekly_deaths_1980_1990.png" "Weekly Deaths 1980-1990")



#### 1970-1980

Throughout the 1970s there were substantial flu epidemics during most winters but subsequent decades have been somewhat less severe. It is sometimes said that doctors entering general practice after 1990 have not really experienced a "serious" influenza epidemic.

The number of EWD in 1975/76 was [58,100](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales) which is a record that has not been surpassed in almost 45 years. The number of EWD in 1978/79 was [48,490](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales) and the number of EWD in 1972/73 was [46,630](https://www.ons.gov.uk/peoplepopulationandcommunity/birthsdeathsandmarriages/deaths/bulletins/excesswintermortalityinenglandandwales/2018to2019provisionaland2017to2018final#excess-winter-mortality-in-england-and-wales). These years are both comparable to the worst EWD figures in the 1980s and 1990s but significantly lower that 1975/76.

The winters of 1972/73 (orange line) and 1978/79 (green line) also illustrate how excess deaths either can be compressed into a shorter time frame or spread out over a longer time frame. The year showing the highest peak does not necessarily correspond to the highest EWD.

As an aside, the [heatwave of 1976](https://en.wikipedia.org/wiki/1976_British_Isles_heat_wave) can also be seen in June/July and was thought to have caused 20% of the "excess deaths" that year. 

![alt text](img/weekly_deaths_1970_1980.png" "Weekly Deaths 1970-1980")



### Summary

You will regularly hear Chris Whitty (Chief medical officer) or Sir Patrick Vallance (Chief Scientific Advisor) state that excess deaths will be the basis on which comparisons can be made in the fullness of time; all-cause mortality, age adjusted. In reality it is not possible to do a complete analysis until almost a year from now (maybe even two or three years) but observations can still be made for April 2020.

The chart below compares the number of weekly deaths (all causes) for 2019-2020 against the 5-year average. The previous charts throughout this document also make it very clear that April 2020 has been far from "normal". Yes, people die every year due to the flu but not in such large numbers and not in such a short period of time, even when looking back over the past 50 years. Spikes have never been observed between April and November during the past 50 years and such a big spike has never been seen even during the "winter" months during the past 50 years.

Note: The peak in the week ending Friday 17 April (week 16) was also very much an "artificial" peak due to the UK lockdown measures. Without reducing the spread of the virus in March and early April the numbers of weekly deaths would have been several times higher during April 2020. There is little room for doubt because of the principles of the [SIR](https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology) model and the elaborations that have underpinned epidemiology for nearly a century.

![alt text](img/excess_deaths.png" "Excess Deaths 2019-2020")



### Conclusions

It can clearly be seen that the autumn and winter of 2019/20 closely matched the 5-year average and it is reasonable to have expected week 13 onwards (end of March) to have also followed the 5-year average, given there has been little variation over the past 20 years. The 5-year average for EWD was 35,000 during the years 2014-2019 and 2019-2020 was on track to be in the same ballpark, right up until week 12 when the "winter" season was coming to an end, prior to COVID-19. It is only reasonable to conclude that without COVID-19 we'd have seen a perfectly "normal" winter in 2019/20 winter which would have equated to around 35,000 EWD.

Note: As an aside, the calculation for EWD has worked reliably for over 120 years but will be somewhat "unsuitable" for 2019/2020. This April will be the first time in at least 50 years where the average number of spring/summer deaths are likely to exceed the "winter" deaths. It makes me wonder what the ONS will do when they produce their EWD bulletin in November since 2019/2020 was a perfectly normal "winter" until COVID-19 arrived and the usual EWD calculation won't reflect this due to the unprecedented figures in April 2020.

During the 6 weeks between week 13 (Friday 27th March 2020) and week 18 (Friday 1st May) there have been approximately 47,500 excess deaths registered in England and Wales, regardless of the underlying cause. This significant number of excess deaths is unprecedented during the past 50 years and it is tragic that so many people have sadly died before their time. The big question is how much earlier their deaths occurred (months, years, even decades) but this may become apparent through further analysis in a few years time.

The latest serology testing (antibody testing) indicates that around [4%](https://youtu.be/Whz7M4gYrZE?t=2712) of the UK population have already been infected with COVID-19 and suggests that without the lockdown we'd have seen a much larger number of deaths during April 2020. This all comes back to the ability for a virus to reproduce and it is widely recognised that the doubling time was around 3-4 days in March 2020. The consequence of continuing to live our lives as normal would have been the number of infections doubling every 3-4 days during the last week of March and into April. That would have lead to many times more hospitalisation and subsequent deaths in April which would have been truly horrific.

Every single death is tragic but to put these numbers in perspective it is worth remembering that the early models of a "reasonable worst case scenario" said that [500,000](https://www.imperial.ac.uk/mrc-global-infectious-disease-analysis/covid-19/report-9-impact-of-npis-on-covid-19/) people could die in the UK, without lockdown. If the latest 4% figure from serological testing is reliable then it is relatively straightforward to take the numbers that we already know (number of infections, number of deaths, doubling time, R<sub>0</sub>) and conclude that the 500,000 estimate was perfectly plausible and may even been slightly on the low side. It is clear that lockdown had a profound effect on reducing the spread of the virus (reducing R<sub>0</sub> from ~2.9 to ~0.8) and avoiding a much higher peak in infections, hospitalisations and deaths during April 2020.

Wednesday 13th May introduced some modest relaxations to the lockdown in the UK with regards to outdoor activities and returning to work for a small number of industries. How this will affect the basic reproduction number (R<sub>0</sub>) and if / when we will see a rise in case numbers across the UK is yet to be seen but it will largely be down to how the UK public behave and their ability to maintain social distancing. It's is an extremely difficult balancing act trying to regain some semblance of normality in our lives whilst keeping the virus in check. The government has an unenviable task of balancing the immediate health risks to the public and the short/medium/long term risks to the economy, due to the two being inextricably linked. I don't envy anyone having to make such difficult decisions!

Stay safe.

