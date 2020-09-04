library(dplyr)
library(ggplot2)

dataset <- read.csv('Dataset_superstore_simple.csv')

#scatterplot
ggplot(dataset, aes(x = sales, y = profit)) + geom_point(colour = 'blue')

#histogram
ggplot(dataset, aes(x = sales)) + geom_histogram(bins = 10, binwidth = 1000)

#barchart
ggplot(dataset, aes(x = segment, y = sales)) + geom_bar(stat = 'Identity', 
                                                        width = 0.5, fill = 'blue')
ggplot(dataset, aes(x = segment, y = sales)) + geom_bar(stat = 'Identity', 
                                                        width = 0.5, 
                                                        aes(fill = category))

#piechart
sales_per_segment <- dataset %>% group_by(segment) %>% summarise(total_sales = sum(sales))
ggplot(sales_per_segment, aes(x="", y=total_sales, fill = segment)) + 
  geom_bar(stat = 'identity', width = 1) +
  coord_polar("y", start=0)

#linechart
#terlebih dahulu mengubah jadi tanggal
dataset$order_date <- as.Date(dataset$order_date)
dataset$order_month <- as.Date(cut(dataset$order_date, breaks = 'month'))
#pendekatan line chart dengan stat summary
ggplot(dataset, aes(x=order_month, y=sales)) + stat_summary(fun.y = sum, geom="line")
#pendekatan dengan geom line
#membuat summary masing2 bulan
monthly_sales <- dataset %>% group_by(order_month) %>% summarise(total_sales = sum(sales))
ggplot(monthly_sales, aes(x=order_month, y=total_sales)) + geom_line() + geom_point()
