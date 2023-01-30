#install.packages("languageserver")
#install.packages("ggplot2")
library(magrittr)
library(ggplot2)
library("GGally")
library(cluster)

#Zadanie 1
#1.1 - 10-elementowa lista
x <- 1:10
print(x)

#1.2 - funkcjonalność pipes
x %<>% log2() %>% sin() %>% sum() %>% sqrt()
print(x)

#1.3 - załadowanie danych
data(iris)

#1.4 - wyświetlenie kilku pierwszych wierszy
print(head(iris))

#1.5 - wyświetlenie średnich dla kadego gatunku
m <- iris %>% aggregate(. ~Species, ., mean)
print(m)

#Zadanie 2
#trzy histogramy wybranej zmiennej dla wszystkich rodzajów irysa
#pionowe linie geom_vline() dla średnich wartości dla kazdego gatunku
a <- ggplot(iris, aes(x = Sepal.Width)) + geom_histogram(aes(fill=Species, color=Species), bins=20) + geom_vline(data=m, aes(xintercept=Sepal.Width, color=Species), linetype="dashed") + labs(x='x_axis', y='y_axis', title='Mean values')
ggsave("/home/lab13_plot1.jpg", plot = a)

#funkcja ggpairs 
a <- ggpairs(data = iris, aes(color = Species))
ggsave("/home/lab13_plot2.jpg", plot = a)

#Zadanie 3
#podział zbioru 'iris' na x i y
x <- iris[,1:4]
y <- iris[,5]

#klasteryzacja zbioru x ze zmienną ilością środków
sum_sqr <- c() #lista na wyniki funkcji kmeans

for (i in 1:10){
    result <- kmeans(x, i) 
    sum_sqr <- append(sum_sqr, result$tot.withinss) 
}

#wyświetlenie uzyskanych wyników na wykresie
a <- ggplot(data.frame(iteration = 1:length(sum_sqr), value = sum_sqr), aes(x = iteration, y = sum_sqr)) + geom_line()
ggsave("/home/lab13_plot3.jpg", plot = a)

#wyświetlenie klasteryzacji dla 3 klastrów
kmeans3_result <- kmeans(x, 3) 
a <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = kmeans3_result$cluster)) + geom_point()
ggsave("/home/lab13_plot4.jpg", plot = a)

#wyświetlenie klasteryzacji dla oryginalnego podziału
a <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) + geom_point()
ggsave("/home/lab13_plot5.jpg", plot = a)