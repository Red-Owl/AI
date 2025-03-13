from huggingface_hub import hf_hub_download
import os

# Repository Hugging Face
repo_id = "stabilityai/stable-diffusion-xl-base-1.0"

# Directory di destinazione
output_dir = "D:/ai/StableYogiRealism/sdxl_base"

# Crea la directory se non esiste
os.makedirs(output_dir, exist_ok=True)

# Lista dei file necessari per SDXL
files_to_download = [
    "model_index.json",                     # Root config file
    "unet/config.json",                     # UNet config
    "unet/diffusion_pytorch_model.safetensors",  # UNet weights
    "vae/config.json",                      # VAE config
    "vae/diffusion_pytorch_model.safetensors",   # VAE weights
    "text_encoder/config.json",             # Text encoder 1 config
    "text_encoder/model.safetensors",       # Text encoder 1 weights
    "text_encoder_2/config.json",           # Text encoder 2 config
    "text_encoder_2/model.safetensors",     # Text encoder 2 weights
    "scheduler/scheduler_config.json",      # Scheduler config
    "tokenizer/merges.txt",                 # Tokenizer 1 files
    "tokenizer/special_tokens_map.json",
    "tokenizer/tokenizer_config.json",
    "tokenizer/vocab.json",
    "tokenizer_2/merges.txt",               # Tokenizer 2 files
    "tokenizer_2/special_tokens_map.json",
    "tokenizer_2/tokenizer_config.json",
    "tokenizer_2/vocab.json"
]

# Scarica ogni file con il nome leggibile
for file in files_to_download:
    print(f"Scaricamento di {file}...")
    hf_hub_download(
        repo_id=repo_id,
        filename=file,
        local_dir=output_dir,
        local_dir_use_symlinks=False
    )

print(f"Tutti i file sono stati scaricati in: {output_dir}")
