source ../COMMON.csh
setenv LOGFILE 	logs/www_ruc3.log

set device="GF|ruc2.gif"
set grid=/data/gempak/model/ruc/${DATE}${1}_ruc236.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = f00-f12-03
DEVICE  = $device
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = grid
PROJ    = lcc/25;-95;25
LATLON  = 0

GLEVEL  = 2      !2 !10
GVCORD  = hght
GFUNC   = dwpf!tmpf!
GVECT   =   !      !wnd
WIND    = !  !bk29/0.6
SKIP    = !    !/2;2
SCALE   = 0 ! 0 !
CINT    = 5! 5 !
LINE    = 2/1/1/2           !32/1/2 !
TITLE   = 5// ~ RUC SFC T, DEW POINT (shaded) & WINDS |^ SFC T,DEW POINT & WINDS! 0
FINT    = -40;-10;0;10;20;25;30;40;50;55;60;65;70;75;80! !
FLINE   = 0;27-16--1;14-8--1
CTYPE   = c/f                !c !
HILO    =                  !
STNPLT  =0 !
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
#
# Run GPEND to clean up
#
#$GEMEXE/gpend

# Copy images to different name for eta model
if (-e ruc2.gif) then

  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_sfcT_Td_winds_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_sfcT_Td_winds_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_sfcT_Td_winds_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_sfcT_Td_winds_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_sfcT_Td_winds_f12.gif


  mv ruc2.gif ruc2_16.gif
  mv ruc2.gif.001 ruc2_17.gif
  mv ruc2.gif.002 ruc2_18.gif
  mv ruc2.gif.003 ruc2_19.gif
  mv ruc2.gif.004 ruc2_20.gif
  keep ruc2_1[6-9].gif ruc2_20.gif
  mv ruc2_1[6-9].gif ruc2_20.gif $WEBPIX/
endif

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = F00-F12-03
GLEVEL  = 1000:0
GVCORD  = hght
GFUNC   = hlcy
GVECT   =
CINT    = 50.;100.;150.;200.;250.;300.;400.
LINE    = 3/5/2
TITLE   = 5/-2/ ~ RUC  0-1KM HELICITY    |^ 0-1KM HELICITY
SCALE   = 0
SKIP    = 0
FINT    = 50.;100.;150.;200.;250.;300.;400.
FLINE   = 0;26-16--2;14-8--2
CTYPE   =  c/f
HILO    =
HLSYM   =
STNPLT =0
\$mapfil=hipowo.gsf
list
run
                                                                                                 
                                                                                                 
exit
EOF

if (-e ruc2.gif) then

  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_0_to_1km_SRH_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_0_to_1km_SRH_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_0_to_1km_SRH_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_0_to_1km_SRH_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_0_to_1km_SRH_f12.gif


  mv ruc2.gif ruc2_21.gif
  mv ruc2.gif.001 ruc2_22.gif
  mv ruc2.gif.002 ruc2_23.gif
  mv ruc2.gif.003 ruc2_24.gif
  mv ruc2.gif.004 ruc2_25.gif
  keep ruc2_2[1-5].gif 
  mv ruc2_2[1-5].gif $WEBPIX/
endif

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = F00-F12-03
GLEVEL  = 0          !180:0                !3000:0
GVCORD  = none!pdly         !hght
GFUNC   = (quo(pwtr,25.4)) !lft4              !hlcy
GVECT   =
CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.!150.;250.;300.;400.;600.
LINE    = 0              !15/1/2          ! 30/5/2
TITLE   = 5/-2/ ~ RUC  PWTR,LI AND HELICITY    |^ PREC.WATER, LI, HELICITY  !0
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

if (-e ruc2.gif) then

  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_PWTR_LI_SRH_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_PWTR_LI_SRH_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_PWTR_LI_SRH_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_PWTR_LI_SRH_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_PWTR_LI_SRH_f12.gif

  mv ruc2.gif ruc2_26.gif
  mv ruc2.gif.001 ruc2_27.gif
  mv ruc2.gif.002 ruc2_28.gif
  mv ruc2.gif.003 ruc2_29.gif
  mv ruc2.gif.004 ruc2_30.gif
  keep ruc2_2[6-9].gif ruc2_30.gif
  mv ruc2_2[6-9].gif ruc2_30.gif $WEBPIX/
endif
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = F00-F12-03
GLEVEL  = 0                !0      !500
GVCORD  = none             !none   !pres
GFUNC   = cape             !cins
GVECT   = ! !vsub(squo(2.,vadd(wnd@500%pres,wnd@450%pres)),wnd@10%hght)
WIND    =                  !       !  bk31/0.8/1
SKIP    = 0                !       ! /3;3
CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
LINE    = 3/1/1/2           !15/1/2
TITLE   = 5/-2/ ~ RUC CAPE,CIN AND 0-6KM SHEAR  |^ CAPE,CIN,0-6KM SHR ! 0
SKIP    = /3;3
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

if (-e ruc2.gif) then

  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_CAPE_CIN_0to6km_shear_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_CAPE_CIN_0to6km_shear_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_CAPE_CIN_0to6km_shear_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_CAPE_CIN_0to6km_shear_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_CAPE_CIN_0to6km_shear_f12.gif

  mv ruc2.gif ruc2_31.gif
  mv ruc2.gif.001 ruc2_32.gif
  mv ruc2.gif.002 ruc2_33.gif
  mv ruc2.gif.003 ruc2_34.gif
  mv ruc2.gif.004 ruc2_35.gif
  keep ruc2_3[1-5].gif 
  mv ruc2_3[1-5].gif $WEBPIX/
endif

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = F00-F12-03
GLEVEL  = 0                !2      !2
GVCORD  = none             !hght   !hght
GFUNC=quo(mul(cape,hlcy@3000:0%hght),160000.)!dwpf!tmpf
GVECT   =                  !       !
WIND    =                  !       !
SKIP    = 0                !       !
SCALE   = 0 ! 0 ! 0
CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
LINE    = 3/1/1/2           !15/1/2 ! 31/1/1/1
TITLE   = 5/-2/ ~ RUC EHI, SFC T & DEW POINT   |^ RUC, SFC T & DEW POINT ! 0
FINT    = 1;1.5;2;3;4;5;6;7;8!
FLINE   = 0;26-16--2;14-8--2
CTYPE   = f                !c ! c
HILO    =                  !  !
STNPLT  =0
\$mapfil=hipowo.gsf
list
run
                                                                                                 
exit
EOF

if (-e ruc2.gif) then
 
  cp ruc2.gif ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_EHI_sfcT_Td_f00.gif
  cp ruc2.gif.001 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_EHI_sfcT_Td_f03.gif
  cp ruc2.gif.002 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_EHI_sfcT_Td_f06.gif
  cp ruc2.gif.003 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_EHI_sfcT_Td_f09.gif
  cp ruc2.gif.004 ${ddir2}/pix/ruc/${1}z/ruc_${DATE}${1}_EHI_sfcT_Td_f12.gif  

  mv ruc2.gif ruc2_36.gif
  mv ruc2.gif.001 ruc2_37.gif
  mv ruc2.gif.002 ruc2_38.gif
  mv ruc2.gif.003 ruc2_39.gif
  mv ruc2.gif.004 ruc2_40.gif
  keep ruc2_3[6-9].gif ruc2_40.gif
  mv ruc2_3[6-9].gif ruc2_40.gif $WEBPIX/
endif
