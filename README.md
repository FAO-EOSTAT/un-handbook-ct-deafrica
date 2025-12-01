## UN Handbook - Chapter 20: Agricultural Mapping with Digital Earth Africa

This repository contains the reproducible analysis for crop type mapping using Digital Earth Africa data products, presented in UN Handbook Chapter 20. The project demonstrates how to use cloud-free geomedian composite images (GeoMADs) from Digital Earth Africa and the `sits` R package to create crop type classification maps using machine learning techniques.

The analysis focuses on the Muvumba River district of Rwanda, using reference data collected in 2020. The workflow demonstrates how high-quality satellite image composites can overcome common challenges in classification workflows, such as the curse of dimensionality and computational demand, while producing accurate crop type maps.

### Getting started

Begin by cloning this repository to your local machine. Open a terminal and navigate to the directory where you want to store the project. Then run the following command to create a local copy of the repository.

```shell
git clone https://github.com/FAO-EOSTAT/un-handbook-ct-deafrica
```

After cloning, navigate into the project directory using `cd un-handbook-ct-deafrica`. All subsequent commands should be executed from within this directory.

### Setting up the environment

The project uses Docker to ensure a consistent computational environment across different systems. The Docker image includes R version `4.4.1` with all necessary packages pre-installed, including the `sits` package for satellite image time series analysis.

You can obtain the Docker image in two ways. The simplest approach is to pull the pre-built image from Docker Hub. This image contains all dependencies and is ready to use immediately. Run the following command in your terminal to download it.

```shell
docker pull faoeostat/handbook:chp20
```

Alternatively, you can build the image locally from the Dockerfile. This approach is useful if you need to modify the environment or verify the build process. Navigate to the project directory and execute the build command. The build process installs all R packages specified in the `renv.lock` file, which may take several minutes depending on your system.

```shell
docker build -t "faoeostat/handbook:chp20" --file docker/Dockerfile .
```

### Running the analysis environment

Once you have the Docker image, start a container to run the analysis. The container runs RStudio Server, which provides a web-based interface for working with R. The command below starts the container in detached mode and maps port 8787 from the container to your local machine.

```shell
docker run \
    --name handbook-chp20 \
    --detach \
    --publish 8787:8787 \
    --env PASSWORD=rstudio \
    --volume ${PWD}:/home/rstudio/handbook faoeostat/handbook:chp20
```

After executing the command above, you can access RStudio by opening a web browser and navigating to [http://localhost:8787](http://localhost:8787). The default username is `rstudio` and the password is also `rstudio`.

### Opening the project

Once you have accessed RStudio in your browser, you need to open the project. The project files are available in the `handbook` directory, which is located in the RStudio user home directory. Navigate to this directory using the Files pane in RStudio. Then double-click on the `ct_deafrica.Rproj` file to open the project. This will configure RStudio with the correct working directory and project settings.

### Downloading the required data

The auxiliary data required to run this example (i.e., ground truth data) are stored on Zenodo. Before running the analysis, you need to download and extract these datasets. The data download process is automated through an R script located in the `auxiliary` directory.

Open the `auxiliary/download.R` file in RStudio. This script handles the complete download and extraction process. It defines the data file name and output directory, creates the necessary directories if they do not exist, downloads the zip file from Zenodo, extracts its contents, and removes the downloaded zip file to save disk space.

Execute the script by sourcing it in RStudio or running it line by line. The download may take some time depending on your internet connection speed, as the dataset can be several gigabytes in size. Ensure you have sufficient disk space available before starting the download.

### Running the analysis

The main analysis is contained in the `analysis.qmd` file, which is a Quarto document that combines code, text, and results. Open this file in RStudio and review its contents to understand the workflow. To execute the analysis, render the Quarto document using the Render button in RStudio or by running it chunk by chunk.
