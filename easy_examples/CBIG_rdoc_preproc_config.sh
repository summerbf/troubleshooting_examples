#! /bin/sh
# Last successfully run on Jan 12nd, 2018
# Written by CBIG under MIT license: https://github.com/ThomasYeoLab/CBIG/blob/master/LICENSE.md

# DO NOT CHANGE: This clears old freesurfer variables if they previously exists
if [ -n "$FREESURFER_HOME" ]; then
	$FREESURFER_HOME/bin/clear_fs_env.csh 
fi

# PLEASE CHANGE: Please specify location of CBIG repository
export CBIG_CODE_DIR=/fslhome/summerf/fsl_groups/fslg_rdoc/compute/CBIG-master

# PLEASE CHANGE: define locations for these libraries
export FREESURFER_HOME=/fslhome/summerf/fsl_groups/fslg_rdoc/compute/software/freesurfer-5.3.0
export CBIG_MATLAB_DIR=/apps/matlab/r2018b
#export CBIG_SPM_DIR=/apps/arch/Linux_x86_64/spm/spm12
export CBIG_AFNI_DIR=/fslhome/summerf/fsl_groups/fslg_rdoc/compute/software/afni/afni_2011
export CBIG_ANTS_DIR=/fslhome/summerf/fsl_groups/fslg_rdoc/compute/software/ANTs/ANTs-2.2.0
export CBIG_WB_DIR=/fslhome/summerf/fsl_groups/fslg_rdoc/compute/software/workbench_1.3.2
#export CBIG_CARET_DIR=/apps/arch/Linux_x86_64/caret/
export CBIG_FSLDIR=/fslhome/summerf/fsl_groups/fslg_rdoc/compute/software/fsl_5.0.8/fsl

# DO NOT CHANGE: set up your environment with the configurations above
SETUP_PATH=$CBIG_CODE_DIR/setup/CBIG_generic_setup.sh
source $SETUP_PATH

# DO NOT CHANGE: set up temporary directory for MRIread from FS6.0
export TMPDIR=/fslhome/summerf/fsl_groups/fslg_rdoc/compute/CBIG-setup/tmpstore #####The original of this line was: "export TMPDIR=/tmpstore". Realized because this is set up in .bashrc & .bashprofile and I have permission restrictions for the supercomputer, it wasn't allowing this to be created, so set it up in my group instead. 

# Do NOT CHANGE: set up MATLABPATH so that MATLAB can find startup.m in our repo 
export MATLABPATH=$CBIG_CODE_DIR/setup

# specified the default Python environment.
# Please UNCOMMENT if you follow CBIG's set up for Python environments.
# We use Python version 3.5 as default.
# Please see $CBIG_CODE_DIR/setup/python_env_setup/README.md for more details.
# source activate CBIG_py3
