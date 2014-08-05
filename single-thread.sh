#!/bin/bash

# Create by SKY.

echo ''
echo 'test download tools.'
echo ''
echo 'download tools: wget curl axel myget mget prozilla linuxdown aget.'
echo ''

#download times.
num=2

qqdownload='http://dldir1.qq.com/qqfile/qq/QQ6.1/11905/QQ6.1.exe'
wifidownload='http://192.168.43.1:8888/download_file_1000'
filedownload='download_file_1000'

download=$wifidownload

timefile='tmp.txt'
if [ -f "$timefile" ]; then
    echo 'rm "'$timefile'"'
    rm $timefile
fi 
touch $timefile

for ((i=0;i<num;i++));do

    dtime=''

# wget download.
    start=$(date +%s)
    wget -O wget.dl$i $download
    end=$(date +%s)
    dtime=$dtime$(($end - $start))' '
    echo 'wget finished.'

# curl download.
    start=$(date +%s)
    curl $download > curl.dl$i
    end=$(date +%s)
    dtime=$dtime$(($end - $start))' '
    echo 'curl finished.'

# axel download.
    start=$(date +%s)
    axel -o axel.dl$i -n 1 $download
    end=$(date +%s)
    dtime=$dtime$(($end - $start))' '
    echo 'axel finished.'

# myget download
    start=$(date +%s)
    mytget -f myget.dl$i -n 1 $download
    end=$(date +%s)
    dtime=$dtime$(($end - $start))' '
    echo 'myget finished.'

# mget download.
    start=$(date +%s)
    mget -O mget.dl$i --num-threads 1 $download
    end=$(date +%s)
    dtime=$dtime$(($end - $start))' '
    echo 'mget finished.'
    echo 'linuxdown finished.'

# linuxdown download.
    start=$(date +%s)
    linuxdown $download 1 
    end=$(date +%s)
    dtime=$dtime$(($end - $start))' '

    echo $dtime >> $timefile
    bash ./clean.sh
    rm $filedownload

done;

cat $timefile | awk '{sum1+=$1;sum2+=$2;sum3+=$3;sum4+=$4;sum5+=$5;sum6+=$6} END {print sum1/"'$num'",sum2/"'$num'",sum3/"'$num'",sum4/"'$num'",sum5/"'$num'",sum6/"'$num'"}' > stime.txt

echo 'all download finished!'
