#!/bin/bash

python3 eff_medsam2_infer_CT_lesion_npz_recist_local.py \
    --checkpoint tiny \
    --imgs_path /workspace/inputs \
    --pred_save_dir /workspace/outputs
