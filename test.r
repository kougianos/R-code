library(dplyr)

data(airquality)

class(airquality)
airquality <- tbl_df(airquality)

class(airquality)
airquality

select(airquality, Ozone, Solar.R, Day)

filter(airquality, Month >5, Month < 9, Day <3)

filter(airquality, Day ==1 | Day ==2)

# Sort by Ozone (asc by default) first , then by Solar.R
arrange(airquality, Ozone, desc(Solar.R))

mutate(airquality, Temp.C = round((Temp -32)*5/9))

# pipe operator, square root of 9
9 %>% sqrt()

?starts_with

