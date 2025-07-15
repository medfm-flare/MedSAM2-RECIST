from huggingface_hub import snapshot_download

local_dir = "./FLARE-Task1-PancancerRECIST-to-3D"
snapshot_download(
    repo_id="FLARE-MedFM/FLARE-Task1-PancancerRECIST-to-3D-Dockers",
    repo_type="dataset",
    local_dir=local_dir,
    local_dir_use_symlinks=False,
    resume_download=True,
)