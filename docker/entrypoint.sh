#!/bin/bash
UBMLEXP=$4
git clone -b sam-exp $UBMLEXP
gcloud auth activate-service-account --key-file=/secrets/gcloud_key.json
export GOOGLE_APPLICATION_CREDENTIALS=/secrets/gcloud_key.json
DATA_DIR=$1
MODEL_DIR=$2
RESULT_DIR=$3
WARM_START_NAME=$5
FILELIST_TRAIN=$6
FILELIST_VAL=$7
NAME=$8
LOG_DIR=${RESULT_DIR}/${NAME}/logs
CHECKPOINT_PATH=${RESULT_DIR}/${NAME}/checkpoints
gcsfuse $RESULT_DIR /results #RESULT_DIR = uberduck-ver-v0/results
gcsfuse $DATA_DIR /data #DATA_DIR = uberduck-vertex-v0/data
gcsfuse $MODEL_DIR /models #MODEL_DIR = uberduck-vertex-v0/models
python -m uberduck_ml_dev.exec.train_tacotron2 --config ./uberduck-ml-exp/experiments/taco2_lj_lachow/config.json --log_dir $LOG_DIR --checkpoint_path $CHECKPOINT_PATH --training_audiopaths_and_text $FILELIST_TRAIN --val_audiopaths_and_text $FILELIST_VAL --warm_start_name $WARM_START_NAME
