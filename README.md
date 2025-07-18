# MedSAM2-RECIST

Docker-based MedSAM2 inference pipeline for MICCAI FLARE25 Task1-PancancerRECIST-to-3D. 
This repository supports these baselines: MedSAM2 and Efficient MedSAM2 Small/Tiny.


## Building Docker

### For MedSAM2

- Download MedSAM2 RECIST checkpoint
```bash
sh download_MedSAM2.sh
```
- Navigate to `predict.sh` and please make sure the command is as follows
```bash
python3 medsam2_infer_CT_lesion_npz_recist.py \
    --imgs_path /workspace/inputs \
    --pred_save_dir /workspace/outputs
```
- Build docker image
```bash
docker build --no-cache -t medsam2:latest -f Dockerfile .
```
- Run on example case
```bash
docker container run -m 8G --rm \
  -v $PWD/data/validation_public_npz:/workspace/inputs/ \
  -v $PWD/data/out:/workspace/outputs/ \
  medsam2:latest \
  /bin/bash -c "sh predict.sh" 
```
- Save docker image
```
docker save medsam2:latest | gzip > medsam2.tar.gz 
```

### For Efficient MedSAM2 Small

- Download Efficient MedSAM2 small checkpoint
```bash
sh download_EfficientMedSAM2_Small.sh
```
- Navigate to `predict.sh` and please make sure the command is as follows
```bash
python3 eff_medsam2_infer_CT_lesion_npz_recist_local.py \
    --checkpoint small \
    --imgs_path /workspace/inputs \
    --pred_save_dir /workspace/outputs
```
- Build docker image
```bash
docker build --no-cache -t efficientmedsam2small:latest -f Dockerfile .
```
- Run on example case
```bash
docker container run -m 8G --rm \
  -v $PWD/data/validation_public_npz:/workspace/inputs/ \
  -v $PWD/data/out:/workspace/outputs/ \
  efficientmedsam2small:latest \
  /bin/bash -c "sh predict.sh" 
```
- Save docker image
```
docker save efficientmedsam2small:latest | gzip > efficientmedsam2small.tar.gz
```

### For Efficient MedSAM2 Tiny

- Download Efficient MedSAM2 Tiny checkpoint
```bash
sh download_EfficientMedSAM2_Tiny.sh
```
- Navigate to `predict.sh` and please make sure the command is as follows
```bash
python3 eff_medsam2_infer_CT_lesion_npz_recist_local.py \
    --checkpoint tiny \
    --imgs_path /workspace/inputs \
    --pred_save_dir /workspace/outputs
```
- Build docker image
```bash
docker build --no-cache -t efficientmedsam2tiny:latest -f Dockerfile .
```
- Run on example case
```bash
docker container run -m 8G --rm \
  -v $PWD/data/validation_public_npz:/workspace/inputs/ \
  -v $PWD/data/out:/workspace/outputs/ \
  efficientmedsam2tiny:latest \
  /bin/bash -c "sh predict.sh" 
```
- Save docker image
```
docker save efficientmedsam2tiny:latest | gzip > efficientmedsam2tiny.tar.gz
```

## Download baseline dockers directly
- MedSAM2 RECIST, Efficient MedSAM2 Small/Tiny RECIST dockers can be downloaded [here](https://huggingface.co/datasets/FLARE-MedFM/FLARE-Task1-PancancerRECIST-to-3D-Dockers).
To download all dockers, please run
```bash
sh download_dockers.py
```

## Acknowledgements

- We highly appreciate all the challenge organizers and dataset owners for providing the public datasets to the community.
- We thank Meta AI for making the source code of [SAM2](https://github.com/facebookresearch/sam2) and [EfficientTAM](https://github.com/yformer/EfficientTAM) publicly available. Please also cite these papers when using MedSAM2. 


## Bibtex

```bash
@article{MedSAM2,
    title={MedSAM2: Segment Anything in 3D Medical Images and Videos},
    author={Ma, Jun and Yang, Zongxin and Kim, Sumin and Chen, Bihui and Baharoon, Mohammed and Fallahpour, Adibvafa and Asakereh, Reza and Lyu, Hongwei and Wang, Bo},
    journal={arXiv preprint arXiv:2504.03600},
    year={2025}
}
```
Please also cite SAM2
```
@inproceedings{SAM2,
title={{SAM} 2: Segment Anything in Images and Videos},
    author={Nikhila Ravi and Valentin Gabeur and Yuan-Ting Hu and Ronghang Hu and Chaitanya Ryali and Tengyu Ma and Haitham Khedr and Roman R{\"a}dle and Chloe Rolland and Laura Gustafson and Eric Mintun and Junting Pan and Kalyan Vasudev Alwala and Nicolas Carion and Chao-Yuan Wu and Ross Girshick and Piotr Dollar and Christoph Feichtenhofer},
    booktitle={International Conference on Learning Representations},
    year={2025}
}
```

and EfficientTAM

```
@article{xiong2024efficienttam,
    title={Efficient Track Anything},
    author={Yunyang Xiong, Chong Zhou, Xiaoyu Xiang, Lemeng Wu, Chenchen Zhu, Zechun Liu, Saksham Suri, Balakrishnan Varadarajan, Ramya Akula, Forrest Iandola, Raghuraman Krishnamoorthi, Bilge Soran, Vikas Chandra},
    journal={preprint arXiv:2411.18933},
    year={2024}
}
```

