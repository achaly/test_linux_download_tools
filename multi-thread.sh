#!/bin/bash

# Created by SKY.

echo ''
echo 'test download tools. multi-threads.'
echo ''
echo 'download tools: axel myget mget prozilla linuxdown aget.'
echo ''

#download times.
num=15

#total threads num.
threads=10

qqdownload='http://dldir1.qq.com/qqfile/qq/QQ6.1/11905/QQ6.1.exe'
wifidownload='http://192.168.43.1:8888/download_file_200'
filedownload='download_file_200'

download=$wifidownload

timefile='multi-time.txt'
if [ -f "$timefile" ]; then
    echo 'rm "'$timefile'"'
    rm $timefile
fi 
touch "$timefile"

tmpfile='tmpfile'
if [ -f "$tmpfile" ]; then
    echo $tmpfile
    rm $tmpfile
fi

for ((t_num=1;t_num<=threads;t_num++));do
    for ((i=0;i<num;i++));do
	dtime=''

# axel download.
	start=$(date +%s)
	axel -o axel.dl$i -n $t_num $download
	end=$(date +%s)
	dtime=$dtime$(($end - $start))' '
	echo 'axel finished.'
	
# myget download
	start=$(date +%s)
	mytget -f myget.dl$i -n $t_num $download
	end=$(date +%s)
	dtime=$dtime$(($end - $start))' '
	echo 'myget finished.'
	
# mget download.
	start=$(date +%s)
	mget -O mget.dl$i --num-threads $t_num $download
	end=$(date +%s)
	dtime=$dtime$(($end - $start))' '
	echo 'mget finished.'

# linuxdown download.
#	start=$(date +%s)
#	linuxdown $download $t_num
#	end=$(date +%s)
#	dtime=$dtime$(($end - $start))' '
#	echo 'linuxdown finished.'	

	echo $dtime >> $tmpfile$t_num
	bash ./clean.sh
	rm $filedownload
	
    done;

#    cat $tmpfile$t_num | awk '{sum1+=$1;sum2+=$2;sum3+=$3} END {print sum1/"'$num'",sum2/"'$num'",sum3/"'$num'"}' >> $timefile
    cat $tmpfile$t_num | awk '
BEGIN {
  for (i=1;i<=3;++i) {
    max[i] = 0
    min[i] = 100000
  }
}
{
  for (i=1;i<=3;++i) {
    max[i] = max[i] > $i ? max[i] : $i
    min[i] = min[i] < $i ? min[i] : $i
    sum[i] += $i
  }
  max1 = (max1 > $1) ? max1 : $1
  min1 = (min1 < $1) ? min1 : $1
  sum1 += $1
}
END {
  for (i=1;i<=3;++i) {
    sum[i] -= max[i]
    sum[i] -= min[i]
    sum[i] /= '$[num-2]'
  }

print sum[1],sum[2],sum[3]
}' >> $timefile

done;

echo 'all download finished!'
