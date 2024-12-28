#!/bin/bash

# # Define the log files
# training_log="training.log"
# evaluation_log="evaluation.log"

# # Create the log files (truncate if they already exist)
# # shellcheck disable=SC2188
# > "$training_log"
# # shellcheck disable=SC2188
# > "$evaluation_log"

# # Get the current working directory and assign it to EXECUTION_PATH
# #cd ./dataset_processor
# #EXECUTION_PATH=$(pwd)
# #echo "execution path: $EXECUTION_PATH"

# echo "processing data . . . "
# echo "tokenizing data . . . "

# #python3 ./2.inputid_dataset_processor.py
# echo "injecting with errors data . . . "
# #python3 ./3.injected_dataset_processor.py


# EXECUTION_PATH=$(pwd)

# # Print the execution path
# echo "execution path: $EXECUTION_PATH"
# #source /path/to/your/venv/bin/activate
# echo "activating virtual environment"

# echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
# echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
# echo "                  TRAINING PHASE"
# echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
# echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"



# echo "Starting TRAINING"
# echo "---------------------------------------------------"
# echo "               TRAINING model01-plain "
# echo "---------------------------------------------------"
# # shellcheck disable=SC2164
# cd ./model01-plain/
# python3 training.py | tee -a "$training_log"
# cd ..
# echo "---------------------------------------------------"
# echo "              TRAINING model02-fourO "
# echo "---------------------------------------------------"
# cd ./model02-fourO/
# python3 training.py | tee -a "$training_log"
# cd ..
# echo "---------------------------------------------------"
# echo "        TRAINING model03-ConvBiLSTMclassifier "
# echo "---------------------------------------------------"
# cd ./model03-ConvBiLSTMclassifier/
# python3 training.py | tee -a "$training_log"
# cd ..
# echo "---------------------------------------------------"
# echo "             TRAINING model04-fiveO "
# echo "---------------------------------------------------"
# cd ./model04-fiveO/
# python3 training.py | tee -a "$training_log"
# cd ..



echo "********************************************************"
echo "********************************************************"
echo "                EVALUATION PHASE"
echo "              PerSpacer | PerSpaCor"
echo "********************************************************"
echo "********************************************************"


perspacer_evaluation
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "               EVALUATING model01-plain "
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "----------------------  PerSpacer ----------------------"
python3 ./perspacer_evaluation.py --model_dir ./model01-plain/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --output_dir ./results/ | tee -a "$evaluation_log"
echo "----------------------  PerSpaCor ----------------------"
python3 ./perspacor_evaluation.py --alpha 0.5 --model_dir ./model01-plain/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --injected_dir ./_data/datasets/batched/bert-base-multilingual-uncased/injected/ --output_dir ./results/ | tee -a "$evaluation_log"

echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "              EVALUATING model02-fourO "
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "----------------------  PerSpacer ----------------------"
python3 ./perspacer_evaluation.py --model_dir ./model02-fourO/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --output_dir ./results/ | tee -a "$evaluation_log"
echo "----------------------  PerSpaCor ----------------------"
python3 ./perspacor_evaluation.py --alpha 0.5 --model_dir ./model02-fourO/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --injected_dir ./_data/datasets/batched/bert-base-multilingual-uncased/injected/ --output_dir ./results/ | tee -a "$evaluation_log"

echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "        EVALUATING model03-ConvBiLSTMclassifier "
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "----------------------  PerSpacer ----------------------"
python3 ./perspacer_evaluation.py --model_dir ./model03-ConvBiLSTMclassifier/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --output_dir ./results/ | tee -a "$evaluation_log"
echo "-------------------------  PerSpaCor -------------------"
python3 ./perspacor_evaluation.py --alpha 0.5 --model_dir ./model03-ConvBiLSTMclassifier/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --injected_dir ./_data/datasets/batched/bert-base-multilingual-uncased/injected/ --output_dir ./results/ | tee -a "$evaluation_log"

echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "               EVALUATING model04-fiveO "
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "----------------------  PerSpacer ----------------------"
python3 ./perspacer_evaluation.py --model_dir ./model04-fiveO/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --output_dir ./results/ | tee -a "$evaluation_log"
echo "----------------------  PerSpaCor ----------------------"
python3 ./perspacor_evaluation.py --alpha 0.5 --model_dir ./model04-fiveO/model/ --dataset_dir ./_data/datasets/batched/bert-base-multilingual-uncased/ --injected_dir ./_data/datasets/batched/bert-base-multilingual-uncased/injected/ --output_dir ./results/ | tee -a "$evaluation_log"


