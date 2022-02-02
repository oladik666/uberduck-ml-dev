gcloud compute scp /Users/samsonkoelle/Downloads/JRodrigues_HourLong_EBWhite.wav uberduck-sam-t4-west2c:/mnt/disks/uberduck-experiments-v0/data/long_raw/012722_0

TOOLS_DIR="/mnt/disks/uberduck-experiments-v0/NeMo/tools/ctc_segmentation/scripts"
MODEL="QuartzNet15x5Base-En" 
DATA_DIR="/mnt/disks/uberduck-experiments-v0/data/long_raw/012722_0"
OUTPUT_DIR="/mnt/disks/uberduck-experiments-v0/bucket/data/processed/012722_0"
#OUTPUT_DIR="/mnt/disks/uberduck-experiments-v0/data/processed/012722_0"
#OUTPUT_DIR="/mnt/disks/uberduck-experiments-v0/data/processed/012722_0"
THRESHOLD=-2

# ! bash $TOOLS_DIR/../run_segmentation.sh \
# --MODEL_NAME_OR_PATH=$MODEL \
# --DATA_DIR=$DATA_DIR \
# --OUTPUT_DIR=$OUTPUT_DIR_2 \
# --SCRIPTS_DIR=$TOOLS_DIR \
# --MIN_SCORE=$THRESHOLD  \
# --USE_NEMO_NORMALIZATION=False

chmod +x /mnt/disks/uberduck-experiments-v0/NeMo/tools/ctc_segmentation/scripts/../run_segmentation.sh

$TOOLS_DIR/../run_segmentation.sh \
--MODEL_NAME_OR_PATH=$MODEL \
--DATA_DIR=$DATA_DIR \
--OUTPUT_DIR=$OUTPUT_DIR \
--SCRIPTS_DIR=$TOOLS_DIR \
--MIN_SCORE=$THRESHOLD  \
--USE_NEMO_NORMALIZATION=False


$TOOLS_DIR/../run_segmentation.sh --MODEL_NAME_OR_PATH=$MODEL --DATA_DIR=$DATA_DIR --OUTPUT_DIR=$OUTPUT_DIR --SCRIPTS_DIR=$TOOLS_DIR --MIN_SCORE=$THRESHOLD --USE_NEMO_NORMALIZATION=False