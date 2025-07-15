FROM --platform=linux/amd64 pytorch/pytorch

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    CUDA_VISIBLE_DEVICES=""

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-dev \
        build-essential \
        libgl1 \
        libglib2.0-0 \
        git \
        curl \
        ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace/MedSAM2

# Copy from MedSAM2 
COPY . /workspace/MedSAM2

# Install MedSAM2 dependencies
RUN cd /workspace/MedSAM2 && \
    pip install --no-cache-dir -e '.[dev]'

# Make predict.sh executable
RUN chmod +x /workspace/MedSAM2/predict.sh

# Default command
CMD ["/bin/bash"]
