# FWEI-ZXBASIC-Artemis-visualiser
Fun little hack to get Artemis data from AROW and visualise it in (emulated - Fuse) ZX Spectrum

# Data
I'm only interested in some parameters... for Pos;

2003. craftXPos
1. craftYPos
1. craftZPos

... and for Vel;

2009. craftXVel
1. craftYVel
1. craftZVel

... and for Attitude;

2012. craftAttitudeQuatX
1. craftAttitudeQuatY
1. craftAttitudeQuatZ
1. craftAttitudeQuatW

# Fuse
Run Fuse like this to create a file connected to its Interface 1's RS232 port and load the program;
```
rs232Rx=/tmp/fuse/rs232-rx
mkdir --parents --verbose `dirname ${rs232Rx}` && mkfifo ${rs232Rx} && fuse --interface1 --recreated-spectrum --rs232-rx ${rs232Rx} --snapshot Fuse/Artemis-visualiser.snapshot
```

## Initial test of connectivity
Based on the manual, I started with this ZX BASIC;
```
10 FORMAT "t";4800
20 OPEN #4;"t"
30 PRINT INKEY$ #4;
40 GO TO 30
```
... and Bash like;
```
echo Hello\ world > ${rs232Rx}
```
... as basic proof that I could send data into the emulator, and developed from there.

# Bash
Then send data into the emulated RS232 port with;
```
Bash/get-data.bash ${rs232Rx}
```

# Credits
I used;
* [The Recreated ZX Spectrum](https://recreatedzxspectrum.com/) (USB, Layer A) - it's really not just "a Bluetooth keyboard"... - and [Fuse](https://fuse-emulator.sourceforge.net/) for the best emulated ZX Spectrum experience.
* [reddit: r/ArtemisProgram: Additional-Good-3311: I reversed engineered the Google Cloud telemetry json](https://www.reddit.com/r/ArtemisProgram/comments/1scka5i/i_reversed_engineered_the_google_cloud_telemetry/) to understand the JSON from AROW.
* [Internet Archive: ZX Interface 1 and Microdrive manual: Chapter 8 - using the RS232 interface](https://ia800103.us.archive.org/view_archive.php?archive=/27/items/World_of_Spectrum_June_2017_Mirror/World%20of%20Spectrum%20June%202017%20Mirror.zip&file=World%20of%20Spectrum%20June%202017%20Mirror/sinclair/books/m/MicrodriveAndInterface1Manual.html#chapter8) for details of using Interface 1's RS232 from ZX BASIC.