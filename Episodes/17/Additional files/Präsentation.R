### Grundlegendes

## Deklaration/ Erstellung:
x <- 5 # einer Variable
x = 4

y <- c(2,5,3,6,3) #eines Vektors
y

m <- matrix(1:25, nrow = 5, ncol = 5, byrow = TRUE) # einer Matrix
m

## Hilfe / Manuals:
?matrix

## Zufallszahlen
?sample
?rnorm


### Allgemeiner Aufbau einer Analyse

## Schritt 1: Einlesen
?read.table
mydata = read.table("/Users/dianastefan/R/mydata.txt", header = TRUE)
mydata

mydata$Alter

# Im weiteren nutze ich einen der bereits vorhandenen Datensätze
# Liste aller bereits vorhandenen Datensätze: library(help = "datasets")
head(iris)
View(iris)

## Schritt 2: Analyse der Daten:

# Über eine Schleife
column_means <- NULL
for(column in 1:ncol(iris)){
  column_means[column] <- mean(iris[,column])
}
column_means

# Über eine apply Funktion
lapply(iris, mean)

# Über einen bereits vorhandenen Befehl
summary(iris)


## Schritt 3: Graphische Aufbereitung
boxplot(iris, main = "Boxplot zu den Blüten vers. Schwertlilien",
        xlab = "Variable", ylab = "Ausprägung" , col = 10:15)

boxplot(Sepal.Length~Species, data=iris, col = c("purple", "yellow","blue"),
        xlab="Lilienart", ylab="Kelchblatt Länge in cm", main="Schwertlilien Boxplot")

# Nutzen von Packages
# Wenn zuvor nicht installiert: install.packages("ggplot2")
library(ggplot2)
?ggplot2
box <- ggplot(data=iris, aes(x=Species, y=Sepal.Length))
box + geom_boxplot(aes(fill=Species)) + xlab("Lilienart") +
  ylab("Kelchblatt Länge in cm") + ggtitle("Schwertlilien Boxplot") +
  stat_summary(fun=mean, geom="point", shape=5, size=4) 

#In den Code schauen
geom_boxplot
