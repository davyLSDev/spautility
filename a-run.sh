#!/bin/bash -e
# ===== HISTORY =====================================
# Date: 28-Aug-2024
# Version: 0
# Author: DWT
#=====================================================
# This is the "all-in-one" script to do the SP-BL
# catalog processing
#=====================================================

# ====================================================
# functions - likely I don't need all these as modules!

# Set today
set_today () {
  today=`date '+%Y-%m-%d'`
  echo "The date today is: " $today
}

# Download the OPDS
download_opds () {
  d_directory="download"
  filespec="bl_catalog_opds.xml"
  catalog_file=$d_directory"/"$filespec
  echo "Download bloom opds files to: " $d_directory
  [[ -d $d_directory ]] || mkdir $d_directory
  curl "https://api.bloomlibrary.org/v1/opds?minimalnavlinks=true&tag=list:Bible/SPApp-Templates&key=spapp.downloads@gmail.com:qJxUzLBdI0" > $catalog_file
}

# Select the samples used for the alpha build
select_samples () {
  # sudo apt install tidy
  # install saxon, http://www.saxonica.com/
  # there are a few other programs expected as well: cc\Ccw32.exe aka ccwInitial commit of bash script
  # and some files: \programs\conversion\BUMstepE.cct,
  # programs\conversion\toss-out-some-links.xsl,
  # programs\conversion\make-sample.xsl
  echo "This is the bit that selects the samples used for alpha builds"
}

# Trim the links
trim_links () {
  #
  echo "This is the bit that trims the links"
}

#=========================================================
set_today
download_opds
select_samples
trim_links

echo "DONE"