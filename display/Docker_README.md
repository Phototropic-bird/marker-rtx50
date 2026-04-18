# Project Name: Marker for RTX 50-series (sm_120)

## Description
This is a customized Docker image for `datalab-to/marker`, specifically optimized for NVIDIA RTX 50-series GPUs (Blackwell architecture, **sm_120**). It uses PyTorch Nightly with CUDA 12.8 support to unlock the full potential of high-end hardware.

## Marker Intro
Marker is a powerful **local first AI** PDF conversion tool (to .md file specifically). Because it processes everything locally on your machine:
- There is **No token limitation** compared to cloud-based APIs.
- It is entirely **Offline available**, ensuring complete privacy for your sensitive documents.
- The conversion **Performance only depends on User's computer efficacy**. The better your GPU, the faster it runs!

## Hardware Requirements
- **GPU:** NVIDIA RTX 5070 or higher (also compatible with RTX 20/30/40 series).
- **Driver:** Latest NVIDIA Drivers (Version supporting CUDA 12.8+ recommended).
- **Environment:** Docker Desktop with **WSL 2** backend (Windows 10/11 required).
- **RAM:** 16GB+ recommended.

---

## How to Use
> **Note:** If you are familiar with Docker and directory structures, you don't have to follow these paths strictly.

### 1. Setup Directories
Navigate to your desired directory (e.g., `C:\User-Marker`) and create the following folders:
- `input`: Place your input PDF files here.
- `output`: Your converted `.md` files will appear here.
- `marker-cache`: This stores the AI model weights. **Crucial:** Keep this folder to avoid re-downloading several GBs of data in every conversion.

### 2. Pull the Image
Open PowerShell and run:
```powershell
docker pull phototropicbird/marker-rtx50:latest
```

### 3. Run the Conversion
Below is an example of how to run the conversion on a single PDF file (e.g., `test.pdf`). Ensure you have a file named `test.pdf` inside your `input` folder. We mount the folders created in Step 1 to the container and use the `--gpus all` flag to utilize your RTX 50-series GPU.

The first conversion will take some time, since it needs to download the model weights, which is about 10GB.

```powershell
docker run --rm -it --gpus all `
  -v "${PWD}:/data" `
  -v "${PWD}\marker-cache:/root/.cache" `
  phototropicbird/marker-rtx50:latest `
  marker_single /data/input/test.pdf /data/output
```

> **Tip:** Replace `test.pdf` with the actual name of your file in the `input` directory. The converted markdown and extracted images will be saved to your `output` folder!

#### CPU-Only Fallback
If your GPU is not compatible or you do not have an NVIDIA GPU, you can still use this image by simply removing the `--gpus all` flag from the command above. 
> **Note:** Running the AI models on a CPU will work, but the conversion process will be significantly slower.

# Legal Disclaimer
1. Nature of the Work
    - This Docker image (phototropicbird/marker-rtx50) is an unofficial, community-maintained distribution of the "Marker" project. It has been specifically modified to support NVIDIA Blackwell architecture (RTX 50-series GPUs) and utilize PyTorch Nightly builds.

2. Attribution and Non-Affiliation
    - Original Work: "Marker" is an open-source project originally developed by Viktor Kerkez and the Datalab community (available at github.com/datalab-to/marker).
    - Non-Affiliation: The maintainer of this Docker image is not affiliated with, endorsed by, or sponsored by the original authors of the Marker project or the Datalab team. All trademarks and copyrights belong to their respective owners.

3. Use at Your Own Risk
    - This software is provided "AS IS" and "WITH ALL FAULTS." The maintainer makes no representations or warranties of any kind concerning the safety, suitability, lack of viruses, inaccuracies, typographical errors, or other harmful components of this software. There are inherent dangers in the use of any software, and you are solely responsible for determining whether this Docker image is compatible with your equipment and other software installed on your equipment.

4. Limitation of Liability
    - In no event shall the maintainer be liable for any direct, indirect, punitive, special, incidental, or consequential damages, including, without limitation, those resulting from loss of use, data, or profits, arising out of or in connection with the use or performance of this software, even if the maintainer has been advised of the possibility of such damages.

5. Educational and Research Use Only
    - This image is provided exclusively for educational, academic, and research purposes. Users are responsible for ensuring that their use of this tool, and the data processed by it, complies with the original project's license (e.g., GNU GPL) and any applicable local laws or third-party terms of service.