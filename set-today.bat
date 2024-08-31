@echo off
set day=%date:~7,2%
set month=%date:~4,2%
set year=%date:~10,4%
set today=%year%-%month%-%day%
echo today = %today%
