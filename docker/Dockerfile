ARG BASE_IMAGE=rocker/ml-verse:4.4.1
FROM ${BASE_IMAGE}

#
# Environment variables
#
ARG SITS_TAG_VERSION=v1.5.3

# Torch-related env variables
ENV TORCH_INSTALL=0

# SITS-related env variables
ENV SITS_TAG_VERSION=${SITS_TAG_VERSION}

#
# Copy R script and renv.lock to the container
#
COPY docker/install.R /usr/local/bin/install.R
COPY renv.lock /renv.lock

#
# Install dependencies from renv.lock
#
RUN Rscript /usr/local/bin/install.R && \ 
    rm /usr/local/bin/install.R /renv.lock
