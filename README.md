# Bash scripts and xsl stylesheets to process Story Produce App / Bloom catalog entries

The "all-in-one" file that is used in a windows environment, is "a-run.bat".
The linux implementation of a simplification of what is needed to do the basic processing is, "a-run.sh".

## Authors
* Bryan Wussow (SIL, Language Tech) - the overall Windows batch scripts
* Jim Albrecht (SIL) - XML / XSLT work
* Dawson Tennant (SIL, Language Tech) - for the linux implementation, i.e. bash script

## Rev
* The first revision is based on SB-PL catalog processing 2023-04-17 hosted on a Google drive SPA projcet location

## Assumptions for the linux bash script, "a-run.sh":
1) Saxon is installed
2) Some of the batch files do operations that are more general purpose, these have not been implemented.
3) No checking is implemented in this, at least first level implementation
4) make a-run.sh executable => chmod a+x a-run.sh

*[Story Producer App](https://github.com/sillsdev/StoryProducer)
