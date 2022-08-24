#!/bin/bash
date

echo assumeyes=1 >> /etc/yum.conf
yum update && yum install docker git -y
codepath="/root/sentiment-analysis/containerized_webapp/"
git clone https://github.com/BusinessOptimaCloud/sentiment-analysis.git
cd ${codepath}
cat_image_id=`docker images | grep -w sentimentapp:ver1 | awk '{print $3}'`
if [ $cat_image_id=="" ]; then
   continue;
else
   docker rmi ${cat_image_id} -f	
fi

dockerprocess=`systemctl status docker|grep Active|grep dead|wc -l`

if [ ${dockerprocess} -eq 1 ]; then
    systemctl restart docker
fi

docker build -t sentimentapp:ver1 ${codepath}
cat_image_id=`docker images | grep -w sentimentapp | awk '{print $3}'`
container_id=`docker ps|grep "sentimentapp"|awk '{print $1}'`
docker stop ${container_id}
docker rm ${container_id}
docker run -itd --name sentimentapp -p 80:5000 ${cat_image_id}
app_status=`docker ps|grep sentimentapp|wc -l`
public_ip=`curl http://checkip.amazonaws.com`


################################################PLEASE OPEN PORT 80 in EC2 Container#############
if [ ${app_status} -eq 1 ]; then
	echo ""
	echo ""
	echo "YOUR SENTIMENT APP IS UP AND RUNNING"
	echo "Please Use the below URL to OPEN SENTIMENT APP"
	echo -e "http://${public_ip}"
else
	echo "Container not started please check"
fi
