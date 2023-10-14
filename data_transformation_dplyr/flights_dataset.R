library(nycflights13)

#View(flights)

##review dataframe structure
glimpse(flights)

##filter data

flights %>%
  group_by(month) %>%
  summarise(n = n())

flights %>%
  count(month)
## Feb 2013, carrier most flights?
flights %>%
  filter(month == 2 & year == 2013) %>%
  group_by(carrier) %>%
  summarise(n = n()) %>%
  arrange(-n) %>%
  head(5)

flights %>%
  filter(month == 2 & year == 2013) %>%
  count(carrier) %>%
  arrange(-n) %>%
  head(5) %>%
  left_join(airlines, by="carrier")


## HW01 - 5 questions ask about flight dataset

#1. flights number of each carrier group by month

q1 <- flights %>%
 
  group_by(carrier) %>%
  count(month) %>%
  arrange(carrier,month) %>%
  select(month,flights_count = n) %>%
  inner_join(airlines, by="carrier") 
  
  
 print(q1, n=Inf)


#2.the average dep_delay for each carrier (minute) ?
 
q2 <- flights %>%
  group_by(carrier) %>%
  summarise(mean_dep_delay_min = mean(dep_delay, na.rm = T)) %>%
  inner_join(airlines, by = "carrier")
print(q2, n=Inf)

#3. top 5 airport that have the longest average flight time (hour)
  # when came from LaGuardia Airport (LGA) ?

q3 <- flights%>%
  filter(origin == "LGA") %>%
  group_by(dest) %>%
  summarise(mean_flight_time_hour = mean(air_time, na.rm = T)/60) %>%
  arrange(desc(mean_flight_time_hour)) %>%
  head(5)

print(q3)


#4. which flight have the average longest flight time ?

q4 <- flights %>%
  group_by(origin,dest) %>%
  summarise(mean_flight_time_hour = mean(air_time, na.rm = T)/60) %>%
  arrange(desc(mean_flight_time_hour)) %>%
  head(1)

print(q4)


#5. top 5 flight that have the fastest plane speed 
q5 <- flights %>%
  mutate(mile_per_h = distance/(air_time/60)) %>%
  group_by(origin,dest) %>%
  summarise(speed_MilePerH = max(mile_per_h,na.rm = T)) %>%
  arrange(-speed_MilePerH) %>%
  head(5)

print(q5)
 
 
