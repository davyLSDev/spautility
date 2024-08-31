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
1) saxon is installed, if not, then [look here to install it](http://www.saxonica.com/)
    * specifically, [download linux version 12 from here](https://www.saxonica.com/download/c.xml)
    * uncompress the file, then put the query, transform, and validate executables in a useful path, say ~/bin
    * copy the libs/nix/libsaxon-eec-12.5.0 to /usr/libs/ [according to](https://www.saxonica.com/saxon-c/documentation12/index.html#!starting/installing/installingLinux)
    * Then ensure to => export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
2) tidy is installed, if not, then sudo dnf install tidy | sudo apt-get install tidy | etc.
3) Some of the batch files do operations that are more general purpose, have not been implemented.
4) No checking is implemented in this, at least first level implementation
5) make a-run.sh executable => chmod a+x a-run.sh

## Outstanding questions
1) Where does this file come from? programs\conversion\BUMstepE.cct

*[Story Producer App](https://github.com/sillsdev/StoryProducer)
