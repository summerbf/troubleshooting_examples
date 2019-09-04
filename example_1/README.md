# example 1 readme


This problem was in the regression step of preprocessing. Looking at the CBIG_preproc_fMRI_preprocess.log (27-32) it shows that is where it is stopping, and that the "8BY87_bld001_rest_skip0_residc.nii.gz" can not be found. I then went to the CBIG_preproc_regress.log. Looking through that briefly it gives a few errors, but none refer to the residc.nii.gz file that cannot be found. In that file that lists 2 errors, but upon research they had nothing to do with the original problem, but instead posed 2 other errors (one which will be discussed in example_2). 

When those did not pan out, I searched "residc" in both CBIG_preproc_fMRI_preprocess.csh (found lines 457-463 & 954) and CBIG_preproc_regression.csh.
