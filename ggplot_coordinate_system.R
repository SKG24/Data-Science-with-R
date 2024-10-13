# coordinate system
# coord_flip() switches the x- and y-axes
# coord_flip() switches the x- and y-axes, making the boxplots horizontal.
# Why Use coord_flip():-----------------
#Horizontal boxplots: Some visualizations are easier to interpret when the boxplots are horizontal, especially when comparing categories.
#Long labels: It’s easier to read long labels when they are placed on the y-axis (as they won’t overlap as much compared to being squeezed into the x-axis).

#When to Use:----------
#Use coord_flip() when labels on the x-axis are long and overlap.
#It’s also helpful for better visualization of certain datasets where horizontal orientation improves clarity.

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() + coord_flip()


#coord_quickmap()---------------------------
#Without coord_quickmap(): The default aspect ratio may distort the map, stretching or squishing it.
#coord_quickmap() adjusts the aspect ratio to ensure the map is proportional and correctly scaled.
#Why Use coord_quickmap()----------:
#Maintains correct proportions: Keeps the longitude and latitude in the correct scale for spatial data.
#Important for spatial accuracy: Prevents distortion when visualizing geographic maps.
#When to Use:--------------------------------
#Use coord_quickmap() whenever plotting spatial or map data to ensure the map appears accurate and proportional.

nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()

#coord_polar()-----------------------------------------------------
#Why Use coord_polar():
  
#Visual transformation: Polar coordinates create circular charts, which can highlight different relationships and add variety to data presentation.
#Coxcomb Chart: Also known as a Nightingale Rose, this chart is similar to a pie chart but with varying bar lengths.
#When to Use:
#Use coord_polar() when you want to represent data in a circular layout, such as when creating a Coxcomb chart, pie chart, or for visual appeal.

#coord_flip() creates a horizontal bar chart.
#coord_polar() transforms a bar chart into a circular chart

bar <- ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = cut), show.legend = FALSE, width = 1)+ 
  theme(aspect.ratio = 1) + 
  labs(x = NULL, y = NULL)

bar + coord_flip()
bar + coord_polar()

#1
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = "", fill = cut),  # x = "" ensures one bar, stacking by 'cut'
    width = 1
  ) +
  coord_polar("y") +  # Polar coordinates with y-axis for pie chart
  labs(x = NULL, y = NULL) +  # Remove x and y axis labels
  theme_void()  # Remove gridlines and background for a cleaner pie chart look

#3
#coord_quickmap vs coord_map
#coord_quickmap(): Quick, basic, and ensures correct aspect ratios for maps without projections. Ideal for smaller or regional maps where precise curvature adjustments aren't needed.
#coord_map(): Offers full control over map projections, essential for global maps or when specific projections are required for geographic accuracy.

