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
# functions

# Download the OPDS
download_opds () {
  d_directory="download"
  filespec="bl_catalog_opds.xml"
  catalog_file=$d_directory"/"$filespec
  echo "Download bloom opds files to: " $d_directory
  [[ -d $d_directory ]] || mkdir $d_directory
  curl "https://api.bloomlibrary.org/v1/opds?minimalnavlinks=true&tag=list:Bible/SPApp-Templates&key=spapp.downloads@gmail.com:qJxUzLBdI0" > $catalog_file
}

# Trim the links
trim_links () {
  file_out=$1
  file_in=$2
  xsl_file=$3
  # %saxon% -o:%output% -s:%input%  -xsl:%xsl% -versionmsg:off
  transform -o:$file_out -s:$file_in  -xsl:$xsl_file -versionmsg:off
}

#=========================================================
xsl="programs/conversion/trim-links.xsl"
today=`date '+%Y-%m-%d'`
download_opds
[[ -d $today ]] || mkdir $today
trim_links "$today/bl_catalog.xml" "download/bl_catalog_opds.xml" $xsl

# missing step from a-run.bat is > trim-links "download/bl_catalog_feat_opds.xml" $today "bl_catalog_feat.xml"
# but you need also to download the OPDS for that also, if it is actually needed

# missing step, but also missing from a-run.bat > create the sample files, this is a TODO in a-run.bat

echo "DONE processing the xml files"