#!/usr/bin/env bash
# Script to download MedSAM2 model checkpoints
# Create checkpoints directory if it doesn't exist
mkdir -p checkpoints
# Use either wget or curl to download the checkpoints
if command -v wget > /dev/null 2>&1; then
    CMD="wget -P checkpoints"
elif command -v curl > /dev/null 2>&1; then
    CMD="curl -L -o"
    CURL=1
else
    echo "Please install wget or curl to download the checkpoints."
    exit 1
fi

# Download the Efficient Track Anything checkpoint
ETA_BASE_URL="https://huggingface.co/yunyangx/efficient-track-anything/resolve/main"
ETA_MODELS=("efficienttam_s_512x512.pt")

for ETA_MODEL in "${ETA_MODELS[@]}"; do
    echo "Downloading ${ETA_MODEL}..."
    eta_model_url="${ETA_BASE_URL}/${ETA_MODEL}"

    if [ -n "$CURL" ]; then
        $CMD "checkpoints/${ETA_MODEL}" "$eta_model_url" || { echo "Failed to download checkpoint from $eta_model_url"; exit 1; }
    else
        $CMD "$eta_model_url" || { echo "Failed to download checkpoint from $eta_model_url"; exit 1; }
    fi
done
echo "Efficient Track Anything checkpoints have been downloaded successfully to the 'checkpoints' directory."


