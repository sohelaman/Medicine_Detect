import cv2
import numpy as np
import operator

img = cv2.imread('sample_1.jpg',0)
img = cv2.medianBlur(img,5)
cimg = cv2.cvtColor(img,cv2.COLOR_GRAY2BGR)

circles = cv2.HoughCircles(img,cv2.cv.CV_HOUGH_GRADIENT,1,20,
                            param1=50,param2=30,minRadius=30,maxRadius=40)

circles = np.uint16(np.around(circles))
print sorted(circles[0,:], key=lambda x : x[1])
for i in circles[0,:]:
    # draw the outer circle
    cv2.circle(cimg,(i[0],i[1]),i[2],(0,255,0),2)
    # draw the center of the circle
    cv2.circle(cimg,(i[0],i[1]),2,(0,0,255),3)

cv2.imshow('Detected Medicines', cimg)
cv2.waitKey(0)
cv2.destroyAllWindows()
