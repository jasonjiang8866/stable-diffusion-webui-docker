docker run --name rtx3090 --gpus=0 -p 8088:7860 -v P:/webui/stable-diffusion-webui/models:/app/models -v P:/webui/stable-diffusion-webui/outputs:/app/outputs -v P:/webui/stable-diffusion-webui/embeddings:/app/embeddings -v P:/webui/2024/stable-diffusion-webui/extensions:/app/extensions --env NVIDIA_VISIBLE_DEVICES=0 --env CUDA_VISIBLE_DEVICES=0 -d webui:v3