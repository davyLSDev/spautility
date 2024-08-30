@echo off
rem a-run.bot
rem bdw 2023-04-17

echo Running the process to make BloomLib catalog files for Story Producer

rem download the BloomLib opds files
call download-opds

rem create the output folder for today's outputs
call set-today
if not exist %today% md %today%
echo output folder for today's outputs: %today%

rem create the SP Templates catalog file
call trim-links download\bl_catalog_opds.xml %today% bl_catalog.xml

rem create the SP Featured catalog file
call trim-links download\bl_catalog_feat_opds.xml %today% bl_catalog_feat.xml

rem create the samples files
rem TODO