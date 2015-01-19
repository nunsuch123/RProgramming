s <- split(iris, iris$Species)
lapply(s, function(x) colMeans(x[, c("Sepal.Length","Sepal.Width")]))


s <- split(airquality, airquality$Month)
sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))


apply(iris[1:4], 2, mean)
with(mtcars, tapply(mpg, cyl, mean))