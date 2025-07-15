#!/bin/bash

# ==========================================================
# FOR EFFICIENT-MEDSAM2

python3 eff_medsam2_infer_CT_lesion_npz_recist_local.py \
    --checkpoint small \
    --imgs_path /workspace/inputs \
    --pred_save_dir /workspace/outputs
# ==========================================================


# ==========================================================
# FOR MEDSAM2

# python3 medsam2_infer_CT_lesion_npz_recist.py \
#     --imgs_path /workspace/inputs \
#     --pred_save_dir /workspace/outputs
# ==========================================================