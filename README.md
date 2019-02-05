# Histogram-Equalization
Histogram Equalization of an Image in Matlab without using inbuilt function.

## Algorithm

* Compute the number of occurrences of gray level k.(K - total number of gray levels in image).
* Compute the probability of an occurrence of a pixel of level k in the image.
* Compute the cumulative distribution function corrosponding to your above calculated probability of occurance of pixel.
*   Create a transformation k' to produce a new image using any one of 2 methods. You can learn more about these method [here](http://fourier.eng.hmc.edu/e161/lectures/contrast_transform/node2.html) .

* Use k' to calculate the new image.
* Plot new Image and Original image to observe the changes.
