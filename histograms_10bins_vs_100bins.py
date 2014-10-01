# -*- coding: utf-8 -*-
"""
Created on Tue Sep 30 21:59:39 2014

@author: Paul
"""

import numpy as np
import matplotlib.pyplot as plt

# generate 10,000 normally distributed normal numbers
mean = 0
StandardDeviation = 1
x = np.random.normal(mean,StandardDeviation,10000)

#create figure to hold plots
fig = plt.figure()


# add sub-plot to figure
fig.add_subplot(121)

# generate histogram in sub-plot
plt.hist(x, bins=10, color='blue')
plt.title("10 bins")
plt.ylabel("frequency")

plt.tight_layout()

# add sub-plot to figure
ax2 = fig.add_subplot(122)

# generate histogram in sub-plot
plt.hist(x, bins=100, color='blue')
plt.title("100 bins")
plt.ylabel("frequency")

plt.tight_layout()