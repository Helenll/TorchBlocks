CURRENT_DIR=`pwd`
export MODEL_DIR=$CURRENT_DIR/pretrained_models/bert-base-en
export DATA_DIR=$CURRENT_DIR/dataset
export OUTPUR_DIR=$CURRENT_DIR/outputs
export TASK_NAME=cola

python task_text_classification_sda_cola.py \
  --model_type=bert \
  --model_path=$MODEL_DIR \
  --model_name=bert-base-sda \
  --task_name=${TASK_NAME} \
  --do_train \
  --gpu=0,1 \
  --do_lower_case \
  --monitor=eval_mcc \
  --kd_coeff=1.0 \
  --data_dir=$DATA_DIR/${TASK_NAME}/ \
  --train_max_seq_length=128 \
  --eval_max_seq_length=128 \
  --per_gpu_train_batch_size=32 \
  --per_gpu_eval_batch_size=32 \
  --learning_rate=2e-5 \
  --num_train_epochs=10.0 \
  --logging_steps=134 \
  --save_steps=134 \
  --output_dir=$OUTPUR_DIR/${TASK_NAME}_output/ \
  --overwrite_output_dir \
  --seed=42
