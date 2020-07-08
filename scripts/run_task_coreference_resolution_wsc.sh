CURRENT_DIR=`pwd`
export MODEL_DIR=$CURRENT_DIR/pretrained_models/bert-base
export DATA_DIR=$CURRENT_DIR/dataset
export OUTPUR_DIR=$CURRENT_DIR/outputs
export TASK_NAME=wsc

# ------------------ save best checkpoint model--------------
#python task_coreference_resolution_wsc.py \
#  --model_type=bert \
#  --model_path=$MODEL_DIR \
#  --task_name=$TASK_NAME \
#  --do_train \
#  --gpu=0,1 \
#  --do_lower_case \
#  --do_save_best \
#  --mcpt_mode=max \
#  --monitor=eval_acc \
#  --data_dir=$DATA_DIR/${TASK_NAME}/ \
#  --train_max_seq_length=128 \
#  --eval_max_seq_length=128 \
#  --per_gpu_train_batch_size=32 \
#  --per_gpu_eval_batch_size=32 \
#  --learning_rate=1e-5 \
#  --num_train_epochs=20.0 \
#  --patience=10 \
#  --logging_steps=20 \
#  --save_steps=20 \
#  --output_dir=$OUTPUR_DIR/${TASK_NAME}_output/ \
#  --overwrite_output_dir \
#  --seed=42

python task_coreference_resolution_wsc.py \
  --model_type=bert \
  --model_path=$MODEL_DIR \
  --task_name=$TASK_NAME \
  --do_predict \
  --gpu=0 \
  --eval_all_checkpoints \
  --do_lower_case \
  --do_save_best \
  --data_dir=$DATA_DIR/${TASK_NAME}/ \
  --train_max_seq_length=128 \
  --eval_max_seq_length=128 \
  --per_gpu_train_batch_size=32 \
  --per_gpu_eval_batch_size=32 \
  --output_dir=$OUTPUR_DIR/${TASK_NAME}_output/ \
  --overwrite_output_dir \
  --seed=42