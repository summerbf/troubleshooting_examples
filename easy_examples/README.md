# easy examples readme

One of the errors I received was that the TMPDIR did not exist. I searched where that was set and found it in the config file that we had been given directions to set up (CBIG_rdoc_preproc_config.sh). It is run from our .bash_profile and .bashrc. TMPDIR is set on lines 27-28. 

Unfortunately some of these easier errors I have deleted the error messages to keep things clean. But another error I was getting was "Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set)." I looked online and found the fix "git init" in the directory and then "export GIT_DISCOVERY_ACROSS_FILESYSTEM=1"

Another was that git -C command did not exist. We thought git was being loaded in the script, but that is not in there, so I figured out that you have to "module load git/2.14." 
