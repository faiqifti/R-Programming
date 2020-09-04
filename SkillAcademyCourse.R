
users = data.frame(
  name = c('faiq','iftirul','mahlidah'),
  gender = c('male','female','female'),
  age = c('20','17','23')
)

dataset <- read.csv('Dataset_superstore_simple.csv')

dataset_result <- filter(dataset, segment == 'Consumer', profit>0)

dataset_result <- mutate(dataset, avg_price = sales / quantity)

dataset_result <- select(dataset_result, c(segment, profit, avg_price))

dataset_result2 <- dataset %>% filter(segment == 'Consumer', profit>0) %>% 
  mutate(avg_price = sales / quantity) %>% 
  select(c(segment, profit, avg_price))

library(dplyr)

dataset %>% group_by(segment) %>% summarise(total_sales = sum(sales),
                                            avg_sales = mean(sales))



