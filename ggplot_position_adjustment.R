#position adjustment

# color bar chart using aesthetic
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut)) #this will color the outline - boder

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut)) # this will fill the color

#clarity

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity)) # Clarity describes the internal purity of the diamond, with values like I1 (included), SI1, VS1 (very slightly included), etc.

#position = "identity"
# Places each object exactly where it falls without any adjustments for overlapping.
# Generally more useful for 2D geoms (like points), but for bars, it leads to overlapping.
# Use transparency (alpha) to see overlapping.
ggplot(
  data = diamonds,
  mapping = aes(x = cut, fill = clarity)
)+
  geom_bar(alpha = 1/5, position = "identity")

ggplot(
  data = diamonds,
  mapping = aes(x = cut, color = clarity)
)+
  geom_bar(fill = NA, position = "identity")

# position = "fill"
#Similar to stacking, but adjusts bars so that each group of stacked bars has the same height.
#Helps compare proportions across groups, since all bars will appear to be of equal height, 
#making it easier to focus on the relative contributions.
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )

#position = "dodge"
# Places overlapping objects beside one another, making it easier to compare individual values directly, rather than comparing stacked bars.
# Useful when you want a side-by-side comparison of categories, without stacking them.
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

#position = jitter
#: Used in scatterplots to add a small amount of random noise to each point to avoid overlapping (called overplotting).
#When Useful: Useful for scatterplots when many points overlap due to similar values, making it hard to see the density or spread of the data.
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy),
    position = "jitter"
  )

#exercise
#1
#problem is overlapping to avoid it use jitter and alpha
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter(alpha = 0.5)

#2
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter(width = 0.2, height = 0.2)

#3
#geom_jitter() is useful when you want to avoid overlapping points and show them individually by introducing random noise.
#geom_count() is better when you want to visualize the frequency of overlapping points at the same location, with the size of the points representing how many observations are at that spot.

#4
# The default position adjustment for geom_boxplot() is position = "dodge2".
# position_dodge2: This position adjustment ensures that, if there are multiple groups (for example, when you have multiple boxplots for different categories), the boxplots for each group are placed side by side rather than overlapping.
# It differs from regular position_dodge by handling cases where groups of different sizes are involved and by ensuring that boxplots of unequal width are spaced evenly.
