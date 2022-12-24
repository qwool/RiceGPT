# Import the necessary libraries
import random
from PIL import Image, ImageDraw, ImageColor

# Set the width and height of the wallpaper
width = 1920
height = 1080

# Set the custom color scheme
colors = ['#eceff4', '#e5e9f0', '#d8dee9', '#4c566a', '#434c5e', '#3b4252', '#2e3440']

# Choose a random color for the background
background_color = ImageColor.getrgb(random.choice(colors))

# Create a new image with the specified size and background color
image = Image.new('RGB', (width, height), background_color)

# Set the size of the shapes
shape_size = 10

# Set the number of shapes to draw
num_shapes = 100

# Set the line width
line_width = 20

# Create a drawing context
draw = ImageDraw.Draw(image)

# Draw the shapes
for i in range(num_shapes):
  # Choose a random color and position for the shape
  shape_color = ImageColor.getrgb(random.choice(colors))
  shape_x = random.randint(0, width - shape_size)
  shape_y = random.randint(0, height - shape_size)
  
  # Draw the shape
  draw.line((shape_x, shape_y, shape_x + shape_size, shape_y + shape_size), fill=shape_color, width=line_width)

# Save the image as a file
image.save('wallpaper-3.jpg')
