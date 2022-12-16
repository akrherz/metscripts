source ../COMMON.csh
setenv DATA_DIR	/data/gempak/model
setenv LOGFILE 	logs/www_eta2.log

#
set device="GF|eta2.gif"
set grid=${DATA_DIR}/nam/${DATE}${1}_nam212.gem
set grid1=${DATA_DIR}/nam/${DATE}${1}_nam211.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM	= f12-f60-12
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31
GAREA	= 22;-120;53;-64
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL  = 0                !0      !500
GVCORD  = none             !none   !pres
GFUNC   = cape             !cins
GVECT   = ! !vsub(squo(2.,vadd(wnd@500%pres,wnd@450%pres)),wnd@10%hght)
WIND    =                  !       !  bk31/0.9/1
SKIP    = 0                !       ! /4;4
CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
LINE    = 3/1/1/2           !15/1/2
TITLE   = 5/-2/ ~ ETA  CAPE,CIN AND 0-6KM SHEAR  |^ CAPE,CIN,0-6KM SHR ! 0
SKIP    = /2;2
FINT    = 500;1000;1500;2000;2500;3000;3500;4000;5000;6000
FLINE   = 0;26-16--2;14-8--2
CTYPE   = c/f                !c
STNPLT =0
HILO    =                  !
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy images to different name for eta model
cp eta2.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_CAPE_CIN_0to6km_shear_f12.gif
cp eta2.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_CAPE_CIN_0to6km_shear_f24.gif
cp eta2.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_CAPE_CIN_0to6km_shear_f36.gif
cp eta2.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_CAPE_CIN_0to6km_shear_f48.gif
cp eta2.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_CAPE_CIN_0to6km_shear_f60.gif

mv eta2.gif eta2_01.gif
mv eta2.gif.001 eta2_02.gif
mv eta2.gif.002 eta2_03.gif
mv eta2.gif.003 eta2_04.gif
mv eta2.gif.004 eta2_04b.gif
keep eta2_0[1-4].gif eta2_04b.gif
mv eta2_0[1-4].gif eta2_04b.gif $WEBPIX/
#
# Run GDPLOT and generate ETA model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM = F12-F60-12
GLEVEL  = 0          !180:0                !3000:0
GVCORD  = none!pdly         !hght
GFUNC   = (quo(pwtr,25.4)) !lft4              !hlcy
GVECT   =
CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.!150.;250.;300.;400.;600.
LINE    = 0              !15/1/2          ! 30/5/2
TITLE   = 5/-2/ ~ ETA  PWTR,LI AND HELICITY    |^ PREC.WATER, LI, HELICITY  !0
SCALE   = 0
SKIP    = 0
FINT    = .5;.75;1.0;1.25;1.5;1.75;2.0
FLINE   = 0;21-25;28-30;14;15;2;5
CTYPE   = c/f                !c                ! c
HILO    =                  !                 !
HLSYM   =
STNPLT =0
\$mapfil=hipowo.gsf
list
run


exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta
cp eta2.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_PWTR_LI_SRH_f12.gif
cp eta2.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_PWTR_LI_SRH_f24.gif
cp eta2.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_PWTR_LI_SRH_f36.gif
cp eta2.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_PWTR_LI_SRH_f48.gif
cp eta2.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_PWTR_LI_SRH_f60.gif

mv eta2.gif eta2_05.gif
mv eta2.gif.001 eta2_06.gif
mv eta2.gif.002 eta2_07.gif
mv eta2.gif.003 eta2_08.gif
mv eta2.gif.004 eta2_08b.gif
keep eta2_0[5-8].gif eta2_08b.gif
mv eta2_0[5-8].gif eta2_08b.gif $WEBPIX/
#
#endif
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid1
GDATTIM	= f12-f60-12
DEVICE	= $device 
PANEL	= 0
TEXT	= 1.2/21//hw
CONTUR	= 1
MAP     = 31/1/1
CLEAR	= yes
CLRBAR  = 31
GAREA	= 17;-122;53;-60
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL  = 0                !850              ! 700  !2
GVCORD  = pres             !pres             !pres  !hght
GFUNC   = (quo(p12m,25.4)) !(tmpc) ! (tmpc)! (tmpc)
GVECT   =
CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
LINE    = 20//2/0           !6/1/2          ! 7/1/2  ! 2/4/2
TITLE   = 5/-2/ ~ ETA 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, 6H PREC !0!0
SCALE   = 0
SKIP    = 0
FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE   = f                !c                ! c  ! c
HILO    =                  !  !  !
HLSYM   =
STNPLT=0
\$mapfil=hipowo.gsf
list
run

exit
EOF
# Copy ps.plt to different name for eta model
#mv ps.plt ps.plt_eta
cp eta2.gif ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f12.gif
cp eta2.gif.001 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f24.gif
cp eta2.gif.002 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f36.gif
cp eta2.gif.003 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f48.gif
cp eta2.gif.004 ${ddir2}/pix/eta/${1}z/eta_${DATE}${1}_2m_850mb_700mb_temps_12hr_precip_f60.gif

mv eta2.gif eta2_09.gif
mv eta2.gif.001 eta2_10.gif
mv eta2.gif.002 eta2_11.gif
mv eta2.gif.003 eta2_12.gif
mv eta2.gif.004 eta2_12b.gif
keep eta2_1[0-2].gif eta2_12b.gif eta2_09.gif
mv eta2_1[0-2].gif eta2_12b.gif eta2_09.gif $WEBPIX/
