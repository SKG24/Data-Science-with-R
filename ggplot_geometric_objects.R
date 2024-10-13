#geometric objects
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = TRUE )

#multiple geom in same plot
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#better version
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + #global variable
  geom_point(mapping = aes(color = class)) + #local variable
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE )

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy, color = drv)
)+
  geom_point() + geom_smooth(se = FALSE)
#se ----> Display confidence interval around smooth? (TRUE by default, see level to control.)

#use of global variables
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

#use of local variables
ggplot() +
  geom_point(
    data = mpg,
    mapping = aes(x = displ, y = hwy) )+
  geom_smooth(
    data = mpg,
    mapping = aes(x = displ, y = hwy)
  )
