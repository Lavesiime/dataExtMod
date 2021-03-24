Retrun-Sonic
Extractor/Creator of Retro-Sonic datafiles
Version 1.51
(c) 2008-2017 Giuseppe Gatta (nextvolume)
--------------------------------------
Official website: http://unhaut.fav.cc/retrun

This program makes you able to extract and create Retro-Sonic datafiles
so Retro-Sonic hacking is now possible.
The program has to be run in the command prompt, execute it without any
arguments to get help about the options.
Since 1.0 it also supports the datafile format of the version of the Retro Sonic SDK
used in the Sonic CD remake, so have fun hacking. Thanks to Xeeynamo for his help!
Since 1.3 it also supports decryption of encrypted files in Sonic 1 datafiles.
Thanks to ValleyBell for helping with this!

Compilation is as easy as doing:
make
On Windows, MinGW:
make -f Makefile.win32

You need libmhash to compile Retrun-Sonic. Grab it at: http://mhash.sourceforge.net/

It works on Windows/Mingw32, and many *nix-like operating systems.
Compiling with Microsoft Visual Studio is not currently supported, for 
unknown reasons Microsoft doesn't implement what everyone else does.

EXAMPLES
-------------------------------------
Extract a datafile to the current directory:
retrun x Data.bin

Extract a datafile to the directory 'Unpack':
retrun x Data.bin -d=Unpack

List a datafile with verbosely:
retrun l Data.bin -v

Create a datafile 'Data.bin' from directory 'Hello' very verbosely.
return c Hello Data.bin -vv

To operate on a datafile in "Sonic CD" format, append -2 to the command line.
To operate on a datafile in "Sonic 1/Sonic 2" format, append -3 to the command line.
To operate on a datafile in "Sonic Mania" format, append -M to the command line.
There's no way to autodetect the format, and by default it will be the Retro-Sonic/Sonic Nexus format.

FAQ (FREQUENTLY ASKED QUESTIONS)
-------------------------------------
Q: How do I hack the levels?
A: There isn't a known way to do that, yet.
   Try your hand at it anyway and let me know if you manage to know a way to do it.
   
Q: I don't want to unpack and repack the datafile everytime I want to try out
   something I hacked.
A: Then put the data in a 'Data' subfolder in the directory where you have Retro-Sonic
   and rename 'Data.bin' to another name. Retro-Sonic will then use the data contained
   in the 'Data' directory.
   
Q: Does it work with the Sonic Nexus demo from SAGE 2008?
A: Yes, but you can't use an extracted 'Data' directory for hacking.
   It seems that using the Data folder instead of the datafile is supported by Sonic Nexus,
   but it is so buggy that it doesn't work.

Q: Does it work with SEGA's 2011 Sonic CD remake?
A: Yes, the Sonic CD remake is based on a newer version of the RSDK.
    Just append -2 to the command line.

Q: Does it work with SEGA's 2013 Sonic 1 remake?
A: Yes, the Sonic 1 remake is based on a newer version of the RSDK.
    Append -3 to the command line to specify the Sonic 1 format.
    This format isn't as simple to handle as Sonic CD's, so you should read sonic2013.html
    (included in the archive where you found this readme.txt file)

Q: Does it work with Sonic Mania?
A: Yes. Although file names still need to be figured out, and due to how the encryption works
   in Sonic Mania, you need the correct file name in order to decrypt a file correctly.
   
UNKNOWN FILE NAMES & USING LISTS
-------------------------------------
Since version 1.51, you can use filename lists to extract files whose path is not known by Retrun-Sonic.

Say our datafile has two files, Data/Hidden.bin and Data/Covered.bin, for which Retrun-Sonic does not know
their path, which for Sonic Mania files even means wrong decryption.

You make a file with two lines, one where you write Data/Hidden.bin, and one where you write Data/Covered.bin

Example:
Data/Hidden.bin
Data/Covered.bin

save it as myfiles.txt

Now let's suppose we want to extract a Sonic Mania datafile, invoke Retrun-Sonic as following:
retrun x Data.rsdk -M -L=myfiles.txt

WHAT'S NEW
-------------------------------------
1.51 - 2017/08/31
   - Support for filename lists.

1.5 - 2017/08/31
   - Initial support for Sonic Mania.

1.4 - 2013/05/27
   - Fixed directory making on Windows. The joys of standard
specifications...

1.4 - 2013/05/26
   - Filenames for Sonic 1 remake are now displayed and extracted
     with their filenames.
     For other files in datafiles in Sonic 1 format, it works as before
     (i.e. Data/X.bin will be the filename) because they are not
     known filenames.

   - Fixed Sonic 1 datafile creation. MD5 hashes were reversed...
   - sonic1.c refactored and made easier to read by ValleyBell

1.3 - 2013/05/23
   - Added support for decryption of encrypted files in Sonic 1 datafiles.

1.2 - 2013/05/22
   - Added support for Sonic 1 datafile creation.
   - Files from Sonic 1 datafiles are no longer extracted as X.bin but as Data/X.bin
   - Now the -d option can also be specified when creating a datafile.
   - Verbosity options in datafile creation fixed.

1.1 - 2013/05/18
   - Added partial Sonic 1 datafile support.
   - Fixed some directory bugs in datafile creation.

1.0 - 2012/03/24
   - Added Sonic CD datafile support.

0.91 - 2009/05/12   
   - Fixed endianness issues. Retrun-Sonic runs well on big-endian
     machines as well now.

CONTACT
-------------------------------------
Email me at <tails92@gmail.com> for everything related to this program,
like bugfixes, questions, etc.
