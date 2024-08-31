@echo off
if not exist download md download
echo Download bloom opds files to:
echo download\bl_catalog_opds.xml
curl "https://api.bloomlibrary.org/v1/opds?minimalnavlinks=true&tag=list:Bible/SPApp-Templates&key=spapp.downloads@gmail.com:qJxUzLBdI0" > "download\bl_catalog_opds.xml"

echo  and download\bl_catalog_feat_opds.xml
curl "https://api.bloomlibrary.org/v1/opds?minimalnavlinks=true&tag=list:SPApp-Featured&key=spapp.downloads@gmail.com:qJxUzLBdI0" > "download\bl_catalog_feat_opds.xml"
dir download\*.xml
echo .