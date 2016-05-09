source ../COMMON.csh
setenv LOGFILE 	logs/www_avn3.log

set device="GF|avn3.gif"
set grid=${MODEL}/gfs/${DATE}${1}_gfs215.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE	= $grid 
GDATTIM	= f06-f48-06
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
GVECT   = ! !vsub(squo(2.,vadd(wnd@500%pres,wnd@400%pres)),wnd@10%hght)
WIND    =                  !       !  bk31/0.9/1
SKIP    = 0                !       ! /4;4
CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
LINE    = 3/1/1/2           !15/1/2
TITLE   = 5/-2/ ~ GFS  CAPE,CIN AND 0-6KM SHEAR  |^ CAPE,CIN,0-6KM SHR ! 0
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

cp avn3.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f06.gif
cp avn3.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f12.gif
cp avn3.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f18.gif
cp avn3.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f24.gif
cp avn3.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f30.gif
cp avn3.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f36.gif
cp avn3.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f42.gif
cp avn3.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f48.gif

mv avn3.gif avn3_01.gif
mv avn3.gif.001 avn3_02.gif
mv avn3.gif.002 avn3_03.gif
mv avn3.gif.003 avn3_04.gif
mv avn3.gif.004 avn3_05.gif
mv avn3.gif.005 avn3_06.gif
mv avn3.gif.006 avn3_07.gif
mv avn3.gif.007 avn3_08.gif
keep avn3_0[1-8].gif 
mv avn3_0[1-8].gif  $WEBPIX/
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid 
GDATTIM	= f60-f120-12
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
GVECT   = ! !vsub(squo(2.,vadd(wnd@500%pres,wnd@400%pres)),wnd@10%hght)
WIND    =                  !       !  bk31/0.9/1
SKIP    = 0                !       ! /4;4
CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
LINE    = 3/1/1/2           !15/1/2
TITLE   = 5/-2/ ~ GFS  CAPE,CIN AND 0-6KM SHEAR  |^ CAPE,CIN,0-6KM SHR ! 0
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
cp avn3.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f60.gif
cp avn3.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f72.gif
cp avn3.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f84.gif
cp avn3.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f96.gif
cp avn3.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f108.gif
cp avn3.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_CAPE_CIN_0to6km_shear_f120.gif


mv avn3.gif avn3_09.gif
mv avn3.gif.001 avn3_10.gif
mv avn3.gif.002 avn3_10a.gif
mv avn3.gif.003 avn3_10b.gif
mv avn3.gif.004 avn3_10c.gif
mv avn3.gif.005 avn3_10d.gif
keep avn3_09.gif avn3_10.gif avn3_10[a-d].gif 
mv avn3_09.gif avn3_10.gif avn3_10[a-d].gif  $WEBPIX/
# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM = F06-F48-06
GLEVEL  = 0          !0     
GVCORD  = none!none        
GFUNC   = (quo(pwtr,25.4)) !lft4              
GVECT   =
CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.
LINE    = 0              !15/1/2        
TITLE   = 5/-2/ ~ GFS  PWTR AND LI    |^ PREC.WATER, LI  !0
SCALE   = 0
SKIP    = 0
FINT    = .5;.75;1.0;1.25;1.5;1.75;2.0
FLINE   = 0;21-25;28-30;14;15;2;5
CTYPE   = c/f                !c                
HILO    =                  !                 
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

cp avn3.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f06.gif
cp avn3.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f12.gif
cp avn3.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f18.gif
cp avn3.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f24.gif
cp avn3.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f30.gif
cp avn3.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f36.gif
cp avn3.gif.006 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f42.gif
cp avn3.gif.007 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f48.gif

mv avn3.gif avn3_11.gif
mv avn3.gif.001 avn3_12.gif
mv avn3.gif.002 avn3_13.gif
mv avn3.gif.003 avn3_14.gif
mv avn3.gif.004 avn3_15.gif
mv avn3.gif.005 avn3_16.gif
mv avn3.gif.006 avn3_17.gif
mv avn3.gif.007 avn3_18.gif
keep avn3_1[1-8].gif 
mv avn3_1[1-8].gif $WEBPIX/
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM = F60-F120-12
GLEVEL  = 0          !0     
GVCORD  = none!none        
GFUNC   = (quo(pwtr,25.4)) !lft4              
GVECT   =
CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.
LINE    = 0              !15/1/2        
TITLE   = 5/-2/ ~ GFS  PWTR AND LI    |^ PREC.WATER, LI  !0
SCALE   = 0
SKIP    = 0
FINT    = .5;.75;1.0;1.25;1.5;1.75;2.0
FLINE   = 0;21-25;28-30;14;15;2;5
CTYPE   = c/f                !c                
HILO    =                  !                 
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

cp avn3.gif ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f60.gif
cp avn3.gif.001 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f72.gif
cp avn3.gif.002 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f84.gif
cp avn3.gif.003 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f96.gif
cp avn3.gif.004 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f108.gif
cp avn3.gif.005 ${ddir2}/pix/avn/${1}z/avn_${DATE}${1}_PWTR_LI_f120.gif


mv avn3.gif avn3_19.gif
mv avn3.gif.001 avn3_20.gif
mv avn3.gif.002 avn3_20a.gif
mv avn3.gif.003 avn3_20b.gif
mv avn3.gif.004 avn3_20c.gif
mv avn3.gif.005 avn3_20d.gif
keep avn3_19.gif avn3_20.gif avn3_20[a-d].gif 
mv avn3_19.gif avn3_20.gif avn3_20[a-d].gif $WEBPIX/
#endif
