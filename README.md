# popstationr
popstationr is ISO to EBOOT.bin converter to convert PSX ISO images to use with modded PSPs or adrenaline for PS Vita

## About
This version is a cleaned version from copstation without wall of text, a good readme (this one)
and a work in progress help and usage parameter in the compiled popstationr

## Credits
* [Dark\_Alex] - for the Basic Idea and Conversion Method
* [Tinnus]    - for the CDDA Fix - AKA TOC Converter
* [Coldbird]  - for the updated copstation version <vanburace@gmail.com>

## Features
 * standard stuff like the one from dark\_alex
 * CDDA Fix from Tinnus
 * Bootscreen Exchange (the warning screen). Place a greyscale LOGO.PNG in the same folder as the ISO (do not use a coloured PNG)
 * No more BASE.PBP madness (everything needed is on the source-side
 * improved image handling (no need to place a ICON0.png into the ISO folder. Without it it will create normal icon-less PSX EBOOT
 * ISO exctraction support
 * process display
 * auto GameID scanning. Use AUTO instead of the game code
 * Use features from newest DA popstation. There is a DATA.PSP included. If you want to use your own place the DATA.PSP into your ISO folder.
 * CDDA fix is now multiplattform
 * added iniparser-single
 * exported binary data / toc procedures to their own C files
 * fixed ISO size calculation (thx flatwhatson!)
 * Cleaned Up Progress Display

## Compiling
### Dependencies
The only dependency for popstationr is **zlib**. Of course you need **gcc** and **make**

### Building
Change into the directory and run make
```bash
make
```

FIXME add make install target

## Nice to know
When you wan't to include Icons, Backgrounds, Sounds, etc...
Make sure that they are all in CAPS! 

Use a greyscaled logo as *LOGO.PNG* (480x272, Greyscale, PNG) in the same folder as the ISO. If not used my custom bootup Screen is patched in

A game icon as *ICON0.PNG* and pictures as *PIC0.PNG* and *PIC1.PNG*

If you want to include Subchannel and Audio-Data into your EBOOT.bin (Important for Games like FF9, that otherwise will freeze somewhere in-game)
dump your Gamedisc using CloneCD (CloneCD works fine both in Windows and under VMWare... therefore also on Unix Systems)
and instead of the .iso / .bin File, you drag all three Files into the Folder where popstation resides...

Then just point popstation at the .img file (one of the three generated files... .ccd, .img, .sub). It will automatically include Subchannel Data aswell as Audio-Tracks.

For the ISO-Extraction Support... Simply call uppon the Tool with the following Parameter:
```bash
popstation -iso outputfilename.iso
```
It will look for a EBOOT.PBP in the same Folder popstation resides in and output the ISO contained in it to
outputfilename.iso. Both Compressed and Uncompressed EBOOTs are supported.

To force popstationr to scan for the GameID - rather than using a ID you provide, just call popstation with the
Parameter AUTO as your gamecode.
