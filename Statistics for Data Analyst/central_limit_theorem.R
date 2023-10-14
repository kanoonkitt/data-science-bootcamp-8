##central limit theorem

library(tidyverse)

#mean ของประชากร (53,940 records)
mu_price <- diamonds %>% 
  summarise(mean(price)) %>%
  pull()



##run simulation 1000 rounds

result_sample30 <- replicate(n = 1000, expr = {
  ##random sampling
  diamonds %>%
    sample_n(30) %>%
    summarise(mean(price)) %>%
    pull()
})

result_sample3000 <- replicate(n = 1000, expr = {
  ##random sampling
  diamonds %>%
    sample_n(3000) %>%
    summarise(mean(price)) %>%
    pull()
})


hist30 <- hist(result_sample30)
hist3000 <- hist(result_sample3000)

##ค่า mu(mean ของ population) ใกล้เคียงกับ 
## mean ของ sampling dist. (ยิ่ง sample size มากยิ่งใกล้)
print(mu_price)
print(mean(result_sample3000))
