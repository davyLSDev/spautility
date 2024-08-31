@echo off
rem select-samples.bat
rem jaa 2022-11-15
rem bdw 2023-02-12
echo .

rem  this is a general purpose conversion batch file
rem  several processes are not needed as of now but avaiable for easy additional use
rem  skip down the step 1 for the working part of this batch file

rem ***********************************************************
rem set the location of saxon in following line
SET saxon="c:\Program Files\Saxonica\SaxonHE10.8N\bin\Transform.exe"
rem the followiing checks that you have Saxon installed
if not exist %saxon% goto :missingSaxon
rem  ***********************************************************

rem ***********************************************************
rem set the location of xsl in following line
SET xsl="programs\conversion\make-sample.xsl"
if not exist %xsl% goto :missingXSLfile
rem  ***********************************************************
rem ***********************************************************
rem set the location of input in following line

SET input="working\bl_catalog.xml"
if not exist %input% goto :missingInputFile
rem  ***********************************************************
rem ***********************************************************
rem assume the location of output in following line
SET output="working\bl_samples.xml"
rem  ***********************************************************

if  *%1*==*-help* goto :instructions
if  *%1*==*\help* goto :instructions
if  *%1*==*?* goto :instructions
if  *%1*==*-?* goto :instructions

rem ***********************************************************
rem set the location of tidy.exe in following line
SET tidy="programs\tidy.exe"
rem the followiing checks that you have Saxon installed
rem if not exist %tidy% goto :missingTidy
rem  ***********************************************************

rem ***********************************************************
rem set the location of cc in following line
rem remove rem on following line if using cc and also the rem on if not exist %ccw* 
set ccw="programs\cc\Ccw32.exe"
rem the followiing checks that you have cc installed
rem if not exist %ccw% goto :missingCC
rem ***********************************************************

rem ***********************************************************
rem this is not needed for this batch file
rem the following checks that you have included at least one parameter
rem      if *%1*==** goto :instructions
rem ***********************************************************

goto :step1

rem the following allows you to skip step1
rem you will go to %2
if not *%2*==** goto %2
rem ***********************************************************
:start

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

echo .
echo . start
echo .

:start
:tidy

echo ------------------------------------------------
echo . create %1.tidy from %1.htm
rem ***********************************************************
if not exist working\%1.htm goto :missingInputFileForTidy
rem  ***********************************************************
echo . --------------------------------------------------------------------------------------------------------------- > %1.history.txt
echo . process					output				date		 time >> %1.history.txt
echo . --------------------------------------------------------------------------------------------------------------- >> %1.history.txt
echo . tidy		cleanup html 			%1.tidy  			%date% - %time% >> %1.history.txt
echo .
echo . tidy
echo . input  working\%1.htm
echo . output working\%1.tidy
"programs\tidy.exe" --quote-nbsp false  --force-output true --output-xhtml true --show-warnings false    -o "working\%1.tidy"  "working\%1.htm"
echo ------------------------------------------------
echo . end tidy

goto :end

:step1

rem ***********************************************************
rem  ***********************************************************

echo . start step 1  make sample file  	  		%date% - %time% >> make-sample.history.txt
echo ------------------------------------------------
echo . start step 1  make sample file
echo . input:    %input%
echo . output: %output%
echo . xsl:    %xsl%
call %saxon% -o:%output% -s:%input%  -xsl:%xsl% -versionmsg:off
echo . end step1

goto end

:stepE
echo . stepE   sense-number			%1.stepE.sfm  		%date% - %time% >> %1.history.txt
echo ------------------------------------------------
echo . stepE - sense-number
echo ------------------------------------------------
echo . output: working\%1.stepE.sfm
echo . input:  working\%1.stepD.sfm
echo . cct:    BUMstepE.cct
call %ccw% -n -q -t programs\conversion\BUMstepE.cct -o working\%1.stepE.sfm working\%1.stepD.sfm
echo ------------------------------------------------

goto end
:tidy-only

echo ------------------------------------------------
echo . create %1.tidy from %1.htm
rem ***********************************************************
if not exist working\%1.htm goto :missingInputFileForTidy
rem  ***********************************************************
echo .
echo . tidy
echo . input  working\%1.htm
echo . output working\%1.tidy
"programs\tidy.exe"  --quote-nbsp false  --force-output true --output-xhtml true --show-warnings false    -o "working\%1.tidy"  "working\%1.htm"
echo ------------------------------------------------
goto end

:instructions

echo . ------------
echo . Instructions
echo . ------------
echo .
echo . Just run the batch file.  It is assumed that you have placed the input file in
echo .   %input%
echo . The output file can be found at
echo .   %output%
echo . And the xsl file can be found at
echo .   %xsl%
rem echo . or if you are doing tidy for the first time
rem echo . You can process tidy by invoking this batch file like
rem echo . %0 filenameToProcess tidy
echo .
echo . Want to see how long the process takes? Look at make-sample.history.txt
echo . ***********************************************************

goto :end

:missingXSL
echo .
echo . ---------------------------
echo . xsl file not found at
echo . programs\conversion\toss-out-some-links.xsl
echo . ---------------------------
goto :end

:missingCC
echo .
echo . ---------------------------
echo . cc program file not found at
echo . %ccw%
echo . ---------------------------
goto :end

:missingTidy
echo .
echo . ---------------------------
echo . Tidy.exe program file not found in current folder
echo . ---------------------------
goto :end

:missingInputFile
echo . ---------------------------
echo . Missing input file: %input%
echo . ---------------------------
echo .
goto :end

:missingXSLfile
echo . ---------------------------
echo . Missing xsl file: %xsl%
echo . ---------------------------
echo .
goto :end

:missingInputFileForTidy
echo . ---------------------------
echo . Missing input file: %1.htm
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
echo .   end step 1  toss out unneeded links  	  		%date% - %time% >> toss-out-some-links.history.txt
echo .
echo . --------------------------------------------------------------------------------------------------------------- >> toss-out-some-links.history.txt
echo . output file is %output%
echo . --------------------------------------------------------------------------------------------------------------- >> toss-out-some-links.history.txt
echo .
