# Library sets
create_library_set -name WC_LIBS -timing {"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_200a/tcbn65gpluswc0d72.lib"
"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gpluscglvt_200a/tcbn65gpluscglvtwc0d72.lib"
"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gpluscghvt_200a/tcbn65gpluscghvtwc0d72.lib"}

create_library_set -name TT_LIBS -timing {"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_200a/tcbn65gplustc0d8.lib"
"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gpluscglvt_200a/tcbn65gpluscglvttc0d8.lib"
"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gpluscghvt_200a/tcbn65gpluscghvttc0d8.lib"}

create_library_set -name BC_LIBS -timing {"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gplus_200a/tcbn65gplusbc0d88.lib"
"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gpluscglvt_200a/tcbn65gpluscglvtbc0d88.lib"
"/afs/iitd.ac.in/service/tools/public/asiclib/tsmc/L65/libraries/GP/TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn65gpluscghvt_200a/tcbn65gpluscghvtbc0d88.lib"}



create_timing_condition -name WC_COND -library_sets {WC_LIBS}
create_timing_condition -name TT_COND -library_sets {TT_LIBS}
create_timing_condition -name BC_COND -library_sets {BC_LIBS}

# -----------------------------------------------------
#  Functional MMMC Setup (Single Mode, Multiple Corners)
# -----------------------------------------------------



# 2. Define RC corners (if you don’t have RC files, keep default)
create_rc_corner -name RC_TYP
create_rc_corner -name RC_WC
create_rc_corner -name RC_BC

# 3. Define delay corners
create_delay_corner -name TT_CORNER -timing_condition TT_COND -rc_corner RC_TYP
create_delay_corner -name WC_CORNER -timing_condition WC_COND -rc_corner RC_WC
create_delay_corner -name BC_CORNER -timing_condition BC_COND -rc_corner RC_BC

# 4. Define constraint mode (your functional SDC file)
create_constraint_mode -name FUNC_MODE -sdc_files {"/afs/iitd.ac.in/user/e/ee/een242857/PRACTICE/real_project_5/Logic_synthesis/pre_syn_files_1/func.sdc"}




# 5. Define analysis views     (SINGLE-MODE MULTI-CORNER)
create_analysis_view -name TT_VIEW  -constraint_mode FUNC_MODE -delay_corner TT_CORNER
create_analysis_view -name WC_VIEW  -constraint_mode FUNC_MODE -delay_corner WC_CORNER
create_analysis_view -name BC_VIEW  -constraint_mode FUNC_MODE -delay_corner BC_CORNER

# 6. Assign setup/hold views
set_analysis_view -setup {WC_VIEW} -hold {BC_VIEW}
