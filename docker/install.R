#
# Global definitions
#
options(timeout = 1200)

#
# 1. Install renv if not already installed
#
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

#
# 2. Restore packages from renv.lock
#
renv::restore(lockfile = "/renv.lock")

#
# 3. Fix torch
#
torch::install_torch()
