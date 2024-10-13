#statistical transformation
str(diamonds)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color))

#You can generally use geoms and stats interchangeably. 
#For example, you can re-create the previous plot using stat_count() instead of geom_bar():
ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))

#Three reasons you might need to use a stat explicitly
#--You might want to override the default stat
#For example, in a bar chart, instead of counting rows (default behavior of geom_bar()), you can use the actual y-values by setting the stat to "identity":
ggplot(data = demo) +
  geom_bar(
    mapping = aes(x = a, y = b), stat = "identity"
  )
#--You might want to override the default mapping from transformed variables to aesthetics
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 1)
  )
#--You might want to draw greater attention to the statistical trans‐ formation in your code.
ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#exercise
#1--------------------------------------
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary", 
    fun.ymin = min, fun.ymax = max, fun.y = median
  )
#2--------------------------------------------
#geom_col() creates a bar chart where the heights of the bars are directly provided by a variable. It uses stat = "identity" by default, so it maps the values in the data directly to the bar height.
#geom_bar() on the other hand, counts the number of rows in each category by default and maps that count to the bar height (stat = "count").
#So, the difference is:
  
#  geom_col() → you provide the y-values explicitly.
#geom_bar() → the y-values are computed by counting occurrences.

#3--------------------------------------------------
#Some common geom-stat pairs are:
  
#geom_bar() & stat_count()
#geom_point() & stat_identity()
#geom_histogram() & stat_bin()
#geom_smooth() & stat_smooth()
#geom_boxplot() & stat_boxplot()
#Each geom visualizes a certain type of statistical transformation. 
#The stat function generates or computes the data needed for that visualization. 
#Often, the geom is responsible for drawing, while the stat transforms the raw data for visualization 
#(e.g., counting, binning, smoothing).

#4--------------------------------------------------
#What variables does stat_smooth() compute? What parameters control its behavior?
  #stat_smooth() computes:
  
  #y → the predicted value
#ymin and ymax → confidence interval bounds
#Parameters that control its behavior:
  
 # method → specifies the smoothing method (e.g., "lm" for linear models, "loess" for locally estimated scatterplot smoothing)
#se → whether to display confidence intervals (default is TRUE)
#span → controls the smoothness when using loess
#formula → the formula used when method = "lm"

#5--------------------------
#In our proportion bar chart, we need to set group = 1. Why? In other words, what is the problem with these two graphs?
#Without group = 1, ggplot cannot properly calculate the proportions across all the categories, 
#as it needs to know how to group the data for calculation. Here’s what’s happening in the two examples: