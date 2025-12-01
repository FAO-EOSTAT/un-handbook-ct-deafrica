options(timeout = 1200)

# Step 1: Define the zip filename and output directory
zip_file <- "ct_digital_earth_africa.zip"
output_dir <- "data/ct_digital_earth_africa"

# Step 2: Create the data/ directory if it doesn't exist
if (!dir.exists("data")) {
  dir.create("data", recursive = TRUE)
}

# Step 3: Download the zip file
download.file(
  url      = "https://zenodo.org/api/records/17451690/files/ct_digital_earth_africa.zip/content",
  destfile = zip_file
)

# Step 4: Extract the zip file to the output directory
unzip(zipfile = zip_file, exdir = output_dir)

# Step 5: Remove the zip file after extraction
unlink(zip_file)
