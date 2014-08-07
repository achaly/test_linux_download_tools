#!/bin/python

import matplotlib.pyplot as plt

single_xlabel=['wget','curl','axel','myget','mget','linuxdown']
multi_xlabel=['axel','myget','mget','linuxdown']

line_color=['b','g','r','c']

single_avg_5=[2.75,2.2,2.6,3.05,2.9,2.95]
single_avg_20=[13,16.9,11.75,13.9,14.85,14.6]
single_avg_100=[75.7,57.9,57,56.6,68.4,68.3]
single_avg_1000=[576,595,513,537.5,440,465]

multi_avg_5=[
    [4.30769, 4, 2.84615, 3.69231, 3.46154, 3.30769, 3.07692, 5.84615, 3.61538, 3.53846],
    [5.38462, 4.07692, 4.76923, 4.30769, 4.69231, 4.38462, 4.84615, 6.69231, 5.46154, 5.46154],
    [4.15385, 3.46154, 2.92308, 3.84615, 3.76923, 3.46154, 3.69231, 4, 3.84615, 2.84615]
]

#4.30769 4 2.84615 3.69231 3.46154 3.30769 3.07692 5.84615 3.61538 3.53846 
#5.38462 4.07692 4.76923 4.30769 4.69231 4.38462 4.84615 6.69231 5.46154 5.46154 
#4.15385 3.46154 2.92308 3.84615 3.76923 3.46154 3.69231 4 3.84615 2.84615

multi_avg_200=[
    [89.3846, 78.6154, 72.7692, 80.4615, 81.1538, 82.8462, 81.6923, 78.3077, 82, 79.6923],
    [89.1538, 79.0769, 77.6154, 83.6923, 82, 83.1538, 81.9231, 90.0769, 82.8462, 82.3846],
    [88.7692, 79.7692, 73.5385, 82.3846, 82.5385, 82.3846, 82.1538, 80.0769, 83.0769, 85]
]

#89.3846 78.6154 72.7692 80.4615 81.1538 82.8462 81.6923 78.3077 82 79.6923 
#89.1538 79.0769 77.6154 83.6923 82 83.1538 81.9231 90.0769 82.8462 82.3846 
#88.7692 79.7692 73.5385 82.3846 82.5385 82.3846 82.1538 80.0769 83.0769 85



def single_bar_plot(fig,height,ylimit):
    plt.figure(fig)

    l=[1,2,3,4,5,6]
    h=height
    w=0.5

    plt.bar(l,h,w,color='b')

    plt.xlim(0.5,7)
    plt.ylim(0,ylimit)
    plt.title('Compare rate of different single-thread download tools.')
    plt.xlabel('Linux download tools.')
    plt.ylabel('Download time.(s)')
    plt.xticks(map(lambda n:n+w/2,l), single_xlabel)
    plt.show()

def multi_fig_plot(fig,m,y0,ylimit):
    plt.figure(fig)

    x=range(1,11)

    for i in range(0,3):
        plt.plot(x,m[i],color=line_color[i],label=multi_xlabel[i])

    plt.xlim(0,11)
    plt.ylim(y0,ylimit)
    plt.title('Compare rate of different multi-thread download tools.')
    plt.xlabel('Numbers of threads.')
    plt.ylabel('Download time of different download tools.')
    plt.legend(loc='upper left')
    plt.show()


if __name__ == '__main__':
    single_bar_plot(1,single_avg_5,4)
    single_bar_plot(2,single_avg_20,18)
    single_bar_plot(3,single_avg_100,80)
    single_bar_plot(4,single_avg_1000,600)

    multi_fig_plot(5,multi_avg_5,0,8)
    multi_fig_plot(6,multi_avg_200,40,120)
