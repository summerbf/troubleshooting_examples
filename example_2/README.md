# example 2 readme

This fix came from looking at 2 separate issues. 

**Part 1

Although CBIG_preproc_fMRI_preprocess.log said the regression step was running and finishing fine, the CBIG_preproc_regress.log continued to show errors in finding files. The bottom error (58-66) indicates it could not find the -wm file. Sure enough, that file did not exist. 

Searching in the CBIG_preproc_regression.csh for "wm" (104-151), it shows wm is part of the mask creation. I looked through to see if I could see where the error was happening. In the config script I was putting in, I was adding a -wm and a -csf flag (rdoc_preproc_config.txt, 9). In the CBIG_preproc_regress.log CSF gave the warning (6-7) from line 123-125 of CBIG_preproc_regression.csh but did not for wm (118-120), which didn't make sense.

I also went to CBIG_preproc_create_mask.log and sure enough, only the csf mask was being created. Not only that, but it said it finished without error, so it seemed that it wasn't even recognizing that wm was being set as a flag.

At this point I had my weekly meeting with my mentor and brought it up. He said to try hardcoding wm to 1 to see what happened (CBIG_preproc_regression.csh, 50). I tried harddcoding both csf and wm and both worked. I then only hardcoded wm and still both worked. I had the thought it might just be something wrong with the first flag in general, so I then tried a variety of different options. I changed -csf to be the first flag, which resulted in only a wm mask being created. I added -whole_brain to the front, and both -csf and -wm masks were made. This indicated that for some reason the program was not recognizing the 1st flag, no matter what it was (it wasn't a problem with wm).


**Part 2

I was also working through an error with Bandpass at the same time, the step after regression. CBIG_preproc_fMRI_preprocess.log indicated that the bandpass output file could not be found (39-40). Looking through the images, that file did not exist, but most importantly, it was not even developing a .log file for the bandpass step. This indicated that something was happening before line 71 of the CBIG_preproc_bandpass_fft.csh. However, lines 421-445 from the CBIG_preproc_fMRI_preprocess.csh were being echoed in the CBIG_preproc_fMRI_preprocess.log (35-40). I went through the first few lines trying to find something that wasn't working, but it is all hard coding and setting paramaters, and there didn't appear to be anything that wasn't working. 

Looking at it with my advisor, he said that the "-Outlier_stem" from line 34 of CBIG_preproc_fMRI_preprocess.log (which has the command for the preprocess step) did not appear to have an input after it and maybe an input wasn't being made earlier. He also ran the single line of code (34) by itself (I didn't realize I could do that on the supercomputer) and it said it wasn't recognizing .009 as a flag. 

That got me to thinking that maybe again it wasn't recognizing the first flag (in this case low). So using the new skill my mentor had shown me, I ran the single line of code with a random flag in front, and sure enough it began to work. So I now had two problems that were steming from the same overarching problem of not recognizing the first flag. 

From there, I searched "Outlier_stem" in all of the scripts, until I found the original where it states "stem of file including censor frames" (47 of CBIG_preproc_fMRI_preprocess.csh) and it is listed as a required argument for some of the scripts. I then found where that data came from, and added that preprocessing step (fslmcflirt_outliers), so that it would have the input, and it ran, fixing both problems as far as I could tell (this is the most recent fix, so it is still possible there are issues I haven't found yet).
