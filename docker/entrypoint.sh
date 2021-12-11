#!/bin/bash
sleep 3600
git clone -b sam-exp https://github.com/uberduck-ai/uberduck-ml-exp.git
#sleep 3600
echo $1
echo $2
echo $3
gspath_data=$1
gspath_model=$2
gspath_results=$3
#sleep 3600
gsutil cp -r $gspath_data /data
gsutil cp $gspath_model /root/models
gsutil cp -r $gspath_results /root/results
#sleep 3600
python -m uberduck_ml_dev.exec.train_tacotron2 --config ./uberduck-ml-exp/experiments/taco2_lj_lachow/config.json
