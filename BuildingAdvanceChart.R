library(dplyr)
library(ggplot2)

dataset <- read.csv('Dataset_superstore_simple.csv')

#scatterplot
plot1 <- ggplot(dataset, aes(x=sales, y=profit)) +
  geom_point() +
  geom_smooth(method = "lm") + #regresi liner
  labs(title = "Scatter Plot Sales vs Profit",
       subtitle = "Based on Dataset Superstore",
       caption = "R Language Tutorial")

plot2 <- plot1 +
  xlab('Order Sales') + ylab('Order Profit') +
  xlim(0,7500) + ylim(c(-2500,2500))

#ubah warna berdasarkan category
ggplot(dataset, aes(x=sales, y=profit)) +
  geom_point(aes(color = category), size = 2, shape = 18) +
  geom_smooth(method = "lm", color = 'grey', linetype = 'dotdash') + #regresi liner
  labs(title = "Scatter Plot Sales vs Profit",
       subtitle = "Based on Dataset Superstore",
       caption = "R Language Tutorial") +
  xlab('Order Sales') + ylab('Order Profit') +
  xlim(0,7500) + ylim(c(-2500,2500)) +
  theme(
    plot.title = element_text(color = 'blue', size = 14, face = 'bold'),
    plot.subtitle = element_text(color = 'black', size = 12, face = 'italic'),
    legend.position = 'right',
    legend.title = element_text(color = 'blue')
    )

#simpan grafik
ggsave('scatterplot_sales_vs_profit.png')
