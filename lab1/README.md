# Lab1

## Project02-02 : Reducing the Number of Intensity Levels in an Image

### Function:
`quantizedImage = reduceIntensityLevel(originalImage, intensityLevel)`

Input a value after running the program. 

The value is for the argument intensityLevel.

When the program ends, it will pop out a figure with two images which are the original image and the reduced image.


## Project02-03 : Zooming and Shrinking Images by Pixel Replication

### Function:
`resizedImage = resizedImage_replication(originalImage, scalingFactor)`

Input a value after running the program. 

The value is for the argument scalingFactor.

When the program ends, it will pop out a figure with three images.

* The left image is the original image.

* The middle image is an image shrink or zoom by the original.<br>
It depends on the `scalingFactor`.  
`scalingFactor < 1` -> shrink.  
`scalingFactor >=1` -> zoom.

* The right image is an image shrink or zoom by the middle image.<br>
It depends on the `1/scalingFactor`.    
`1/scalingFactor < 1` -> shrink.    
`1/scalingFactor >=1` -> zoom.


## Project02-04 : Zooming and Shrinking Images by Bilinear Interpolation

### Function:
`resizedImage = resizedImage_bilinear(originalImage, scalingFactor)`

Input a value after running the program. 

The value is for the argument scalingFactor.

When the program ends, it will pop out a figure with three images.

* The left image is the original image.

* The middle image is an image shrink or zoom by the original.<br>
It depends on the `scalingFactor`.    
`scalingFactor < 1` -> shrink.  
`scalingFactor >=1` -> zoom.    

* The right image is an image shrink or zoom by the middle image.<br>
It depends on the `1/scalingFactor`.  
`1/scalingFactor` < 1 -> shrink.    
`1/scalingFactor` >=1 -> zoom.  

## Reference

### Project : 
https://www.imageprocessingplace.com/DIP-3E/dip3e_student_projects.htm

### Images : 
https://www.imageprocessingplace.com/DIP-3E/dip3e_book_images_downloads.htm
