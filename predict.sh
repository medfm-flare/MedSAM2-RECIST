#!/bin/bash

python3 eff_medsam2_infer_CT_lesion_npz_recist_local.py \
    --imgs_path /workspace/inputs \
    --pred_save_dir /workspace/outputs

#  docker build --no-cache -t efficient-medsam2:latest -f Dockerfile .
# docker container run -m 8G --rm -v $PWD/data/validation_public_npz:/workspace/inputs/ -v $PWD/data/out:/workspace/outputs/ efficient-medsam2:latest /bin/bash -c "sh predict.sh" 