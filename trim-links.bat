@echo off
rem trim-links.bat
rem trims out the url links that Story Producer does not need
rem jaa 2022-08-24
rem bdw 2023-04-17

echo .

rem  parameter 1: input file
rem  parameter 2: output folder
rem  parameter 3: output file

rem  this is a general purpose conversion batch file
rem  several processes are not needed as of now but avaiable for easy additional use
rem  skip down the step 1 for the working part of this batch file

if  *%1*=="" goto :instructions
if  *%1*==*-help* goto :instructions
if  *%1*==*\help* goto :instructions
if  *%1*==*?* goto :instructions
if  *%1*==*-?* goto :instructions

rem ***********************************************************
rem assume the location of input in following line
SET input="%1"
if not exist %input% goto :missingInputFile
rem  ***********************************************************

rem ***********************************************************
rem set the location of output in following line
SET output="%2\%3"
echo %output%
rem  ***********************************************************

rem ***********************************************************
rem assume the location of xsl in following line
SET xsl="programs\conversion\trim-links.xsl"xsl="programs\conversion\trim-links.xsl"
if not exist %xsl% goto :missingXSL
rem  ***********************************************************

rem set the location of the history file
SET history="%2\trim-links.history.txt"
echo %history%

rem ***********************************************************
rem set the location of saxon in following line
SET saxon="c:\Program Files\Saxonica\SaxonHE10.8N\bin\Transform.exe"
rem SET saxon="programs\Transform.exe"
rem the followiing checks that you have Saxon installed
if not exist %saxon% goto :missingSaxon
rem  ***********************************************************

goto :step1

rem Can you pass a paramter to Saxon?
rem Sure. Declare
rem <xsl:param name="x" as="xs:integer" required="yes"/>
rem at the top level of a (2.0) stylesheet
rem and then invoke Saxon as
rem java -jar saxon8.jar source.xml style.xsl x=17
rem and then access the variable $x in any XPath expression.
rem (Or similarly in XSLT 1.0, but then the "as" and "required" attributes are not available).
rem
rem Michael Kay
rem http://www.saxonica.com/


:step1

rem ***********************************************************
rem  **********************************************************

echo . start step 1  trim out unneeded links  	  		%date% - %time% >> %history%
echo ------------------------------------------------
echo . Start step 1 -  trim out unneeded links
echo . input:    %input%
echo . output: %output%
echo . xsl:    %xsl%
call %saxon% -o:%output% -s:%input%  -xsl:%xsl% -versionmsg:off
echo . end step1

goto end

:instructions

echo . ------------
echo . Instructions
echo . ------------
echo .
echo . To run this batch file you must provide the output folder as parameter 1.
echo .
echo . It is assumed that you have placed the input file in
echo .   %input%
echo . The output file can be found at
echo .   %output%
echo . And the xsl file can be found at
echo .   %xsl%
echo .
echo . Want to see how long the process takes? Look at %history%
echo . ***********************************************************

goto :end



:missingInputFile
echo . ---------------------------
echo . Missing input file: %input%
echo . ---------------------------
echo .
goto :end

:missingXSL
echo . ---------------------------
echo . Missing xsl file: %xsl%
echo . ---------------------------
echo .
goto :end

: missingSaxon
echo . You need to declare where the Saxon program file is located.
echo . Please include the full path
echo . It was not found at %saxon%
echo . Make the change at the top of this batch file at SET Saxon ......
echo .
echo . If you don't have Saxon on your computer you can download a free verson from
echo . Saxonica
echo . https://github.com/Saxonica/Saxon-HE/tree/main/10/Dotnet 
echo . the .NET Home Edition  HE of Saxon is the free version
echo . as of 2023-02-01 the download is:
echo . https://github.com/Saxonica/Saxon-HE/blob/main/10/Dotnet/SaxonHE10-8N-setup.exe
echo . you may need to run as administrator to install
echo .
echo . There is also a Java version but you will need to change command to run it in Java
echo . ***********************************************************
goto :end

:end
echo .   end step 1  trim unneeded links  	  		%date% - %time% >> %history%
echo .
echo . --------------------------------------------------------------------------------------------------------------- >> %history%
echo . output file is %output%
echo . --------------------------------------------------------------------------------------------------------------- >> %history%
echo .
