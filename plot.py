#!/bin/python

import matplotlib.pyplot as plt

single_xlabel=('wget','curl','axel','myget','mget','linuxdown')
multi_xlabel=('axel','myget','mget','linuxdown')

def bar_plot():

    plt.figure(1)
    l=[1,2,3,4,5,6]
    h=[10,20,30,40,50,60]
    w=0.5

    plt.bar(l,h,w,color='b')

    plt.xlim(0.5,7)
    plt.ylim(0,70)
    plt.title('Compare rate of different single-thread download tools.')
    plt.xlabel('Linux download tools.')
    plt.ylabel('Download rate.(s)')
    plt.xticks(map(lambda n:n+w/2,l), single_xlabel)
    plt.show()

    plt.figure(2)
    l=[1,2,3,4]
    h=[10,20,30,40]
    w=0.5

    plt.bar(l,h,w,color='b')

    plt.xlim(0.5,5)
    plt.ylim(0,50)
    plt.title('Compare rate of different multi-thread download tools.')
    plt.xlabel('Linux download tools.')
    plt.ylabel('Download rate.(s)')
    plt.xticks(map(lambda n:n+w/2,l), multi_xlabel)
    plt.show()

if __name__ == '__main__':
    bar_plot()


