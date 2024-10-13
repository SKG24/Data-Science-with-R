library(tidyverse)
head(mpg)
str(mpg)
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy))
ggplot(data=mpg) + geom_point(mapping = aes(x=hwy,y=cyl))

# add aesthetic to data points. ------ process caleed scaling
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy, color = class))
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy, size = class))
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy, alpha = class))
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=hwy, shape = class))

# manual aesthethic
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) +geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
# ggplot2 interprets "blue" as a category or group name, not the actual color. So, it assigns a default color (which happens to be red) to all points under this "blue" category

# Inside aes(): Interpreted as a mapping to a variable.
# Outside aes(): Used for setting a fixed aesthetic (like color) for all data points.

# categorial plot ..... category vs continuous 
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=model, color = class))

# multiple class
ggplot(data=mpg) + geom_point(mapping = aes(x=displ,y=model, color = class, size = class, alpha = class))

# stroke aesthetic in ggplot2 controls the width of the border
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), shape = 2, stroke = 1)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), shape = 2, stroke = 2)

# map an aesthetic to something other than a variable name, like aes(color = displ < 5)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

# in R + should be at end 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))

# facet are used for categorial variables ---- to split the plot into facets
#What happens if you facet on a continuous variable?
  #Faceting with continuous variables is generally not useful. 
  #ggplot2 will create a separate panel for each unique value, 
  #but since continuous variables can have many distinct values, 
  #it could generate a large number of unnecessary facets. 
  #The result is usually overwhelming and hard to interpret. 
  #It’s better to facet on categorical (discrete) variables.

#Advantages/Disadvantages of faceting vs. color aesthetic:
  
#Advantages of faceting:
  
#Faceting creates separate plots for each level of a categorical variable, which can make it easier to see trends and patterns within each group.
#It avoids the problem of overcrowded legends when there are many categories.
#More distinct visual separation of the groups, making it easier to compare across facets.
  
#Disadvantages:
  
#Faceting uses more space, making it harder to view all facets if you have many categories.
#You lose the ability to directly compare points across facets because they are in separate plots.
  
#Color aesthetic:
  
#Using color takes up less space and allows all data to be plotted in a single graph, but can become confusing if there are many categories.
#The balance between faceting and color changes with a larger dataset: faceting becomes harder to read with too many categories, while color might become cluttered with many levels.

#facet your plot by a single variable, use facet_wrap()
#The variable that you pass to facet_wrap() should be discrete
#The tilde (~) creates a formula. It means that each facet will represent a different value of the class variable.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 3)
#nrow is number of rows of plotted graph .... has to do with visual representation of layout

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

#The facet_grid() function in ggplot2 is used to create a grid of subplots (facets) based on two variables. 
#Each combination of the variables is shown in a separate facet, 
#allowing you to compare data across multiple dimensions.

# facet_wrap() is for one variable and automatically wraps the facets into a grid layout.
# facet_grid() is for two variables and creates a strict grid based on the 
#combination of row and column variables.
# Use facet_wrap() when you only need to facet by one variable or want a more flexible layout, 
#and use facet_grid() when comparing across two variables with a well-structured layout
