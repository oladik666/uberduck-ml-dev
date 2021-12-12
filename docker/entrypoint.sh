#!/bin/bash
#sleep 3600
git clone -b sam-exp $4
#git clone -b sam-exp https://github.com/uberduck-ai/uberduck-ml-exp.git
#sleep 3600
#echo $1
#echo $2
#echo $3
echo $4
gcloud auth activate-service-account --key-file=/secrets/gcloud_key.json
export GOOGLE_APPLICATION_CREDENTIALS=/secrets/gcloud_key.json
gspath_data=$1
gspath_model=$2
gspath_results=$3
#sleep 3600
gsutil cp -r $gspath_data /data
gsutil cp $gspath_model /root/models
#gcsfuse uberduck-vertex-v0 /ub_bucket/
gcsfuse uberduck-vertex-v0/results /root/results
#gsutil cp -r $gspath_results /root/results
#sleep 3600
echo $4
#gcloud auth application-default login --quiet
echo $4
sleep 3600
python -m uberduck_ml_dev.exec.train_tacotron2 --config ./uberduck-ml-exp/experiments/taco2_lj_lachow/config.json
