library(dplyr)

data(airquality)

class(airquality)
airquality <- tbl_df(airquality)

class(airquality)
airquality

select(airquality, Ozone, Solar.R, Day)
