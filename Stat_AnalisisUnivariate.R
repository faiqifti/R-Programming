tinggi <- c(150, 155, 160, 175, 180, 164, 162, 153, 171, 156, 166, 145, 177, 173,
            155, 166, 162, 173, 174, 172, 171, 170, 153, 154, 155, 162, 164, 152)

#install packages frekuensi
install.packages("fdth")

library(fdth)

#membuat table frekuensi
tabelfre <- fdt(tinggi, k = 5)

summary(tabelfre)
#f = frekuensi
#rf = relatif frekuensi, persen dari keseluruhan
#cf = cumulative frekuensi

#ANALISIS BIVARIATE
#terjadi setelah dilakukan analisis univariate
#analisis 2 variabel, indepeden dan dependen. variabel ini mungkin berkorelasi

stiffness <- c(14.5, 12.5, 19, 20.22, 21.3, 20.4, 10.3, 12.1, 11.9, 11)
density <- c(2, 6, 9, 2, 5, 7, 6, 2, 5, 7)

scatter.smooth(x=density, y=stiffness, main="Stiffness - Density Plot")

#mengetahui seberapa besar korelasinya
cor(stiffness, density)
#korelasi positif minim 70%


#ANALISIS MULTIVARIATE
#analisis hubungan data yang memiliki beberapa variabel
#memungkinkan mengetahui pengaruh beberapa variabel
#supervised learning adalah algoritma mesin untuk mencari pola data berlabel dari prediktor
#label = variabel target = variabel dependen
#proses algoritma: memprediksi value>kalkulasi akurasi>perhitungan performa model>pengecekan prediksi dan output
#algoritma meliputi: regresi ganda dan decision tree

#unsupervised learning adalah algoritma pada data tidak berlabel yang hasilnya tidak diketahui
# algoritma: analisis cluster

penjualan <- c(54, 98, 62, 120, 155, 170, 220, 250, 300, 150)
promosi <- c(2, 5.3, 6.6, 2, 3.5, 4, 8, 1.9, 7, 6)
Kompetitor <- c(75, 68, 45, 35, 20, 22, 12, 9, 5, 10)
aktiva <- c(45, 22, 24, 27, 16, 18, 28, 64, 98, 19)

cor(penjualan, promosi)
cor(penjualan, aktiva)
cor(penjualan, kompetitor)

#model regresi
linearmod<-lm(penjualan ~ promosi + aktiva + kompetitor)
print(linearmod)

summary(linearmod)


#TES HIPOTESIS A/B
install.packages("pwr")
library(pwr)

prop.test(c(225,250), c(3450,3000))

#setiap a/b testing biasa yang diuji properti
