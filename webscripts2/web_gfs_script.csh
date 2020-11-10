
source ../COMMON.csh
setenv LOGFILE 	logs/www_gfs.log

set device="GF|gfs.gif"
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

GAREA	= 13;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 500:1000                  !0
GVCORD	= pres                      !none
GFUNC	= (sub(hght@500,hght@1000)) !EMSL@0%none
SCALE	= -1                        !0
CINT	= 6                         !4
LINE	= 3/3/1                     !20//2
GVECT	=
TITLE	= 5/-2/ ~ GFS MSL PRESSURE, 1000-500 MB THICKNESS|^ MSLP, 1000-500 THKN!0
SKIP	= 1
FINT	=
FLINE	=
CTYPE	= c
HLSYM   = 2;1.5//21//hw
HILO    = ! 25;2/H#;L#//20/15;15/y 
STNPLT  = 0
\$mapfil=
list
run

exit
EOF

#
# Run GPEND to clean up
gpend
#
# Copy ps.plt to different name for eta model


cp gfs.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f06.gif
cp gfs.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f12.gif
cp gfs.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f18.gif
cp gfs.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f24.gif
cp gfs.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f30.gif
cp gfs.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f36.gif
cp gfs.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f42.gif
cp gfs.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f48.gif

mv gfs.gif gfs_01.gif
mv gfs.gif.001 gfs_02.gif
mv gfs.gif.002 gfs_03.gif
mv gfs.gif.003 gfs_04.gif
mv gfs.gif.004 gfs_05.gif
mv gfs.gif.005 gfs_06.gif
mv gfs.gif.006 gfs_07.gif
mv gfs.gif.007 gfs_08.gif
keep gfs_0[1-8].gif 
mv gfs_0[1-8].gif $WEBPIX/

#
# Run GDPLOT and generate GFS model gfs
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

GAREA	= 13;-129;60;-45
PROJ	= lcc/25;-95;25
LATLON	= 0

GLEVEL	= 500:1000                  !0
GVCORD	= pres                      !none
GFUNC	= (sub(hght@500,hght@1000)) !emsl@0%none
SCALE	= -1                        !0
CINT	= 6                         !4
LINE	= 3/3/1                     !20//2
GVECT	=
TITLE	= 5/-2/ ~ GFS MSL PRESSURE, 1000-500 MB THICKNESS|^ MSLP, 1000-500 THKN!0
SKIP	= 1
FINT	=
FLINE	=
CTYPE	= c
HLSYM   = 2;1.5//21//hw
HILO    = ! 25;2/H#;L#//20/30;30/y 
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run


exit
EOF
# Copy ps.plt to different name for eta model

cp gfs.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f60.gif
cp gfs.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f72.gif
cp gfs.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f84.gif
cp gfs.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f96.gif
cp gfs.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f108.gif
cp gfs.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_MSLP_thickness_f120.gif

mv gfs.gif gfs_09.gif
mv gfs.gif.001 gfs_10.gif
mv gfs.gif.002 gfs_10a.gif
mv gfs.gif.003 gfs_10b.gif
mv gfs.gif.004 gfs_10c.gif
mv gfs.gif.005 gfs_10d.gif
keep gfs_09.gif gfs_10.gif gfs_10[a-d].gif 
mv gfs_09.gif gfs_10.gif gfs_10[a-d].gif $WEBPIX/

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f06-f48-06
GVCORD  = pres
GLEVEL	= 500
GVECT	= WND ! 
WIND    = bk31/0.9
SKIP    = /16;16 ! /16;16
GFUNC	= sm9s(sm9s(avor(wnd)))           !sm9s(sm9s(avor(wnd)))     !hght
CINT	= 2/10/99               !2/4/8                 !6
LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
HILO	= 2;6/X;N/10-99;10-99   !
SCALE	= 5                     !5                     ! -1
TITLE	= 5/-2/ ~ GFS  500 HEIGHTS AND VORTICITY|^ 500 HGHT AND VORTICITY!0
PROJ	= lcc/25;-95;25/1,3,0,0
FINT	= 16;20;24;28;32;36;40;44
FLINE	= 0;23-15
CTYPE	= c/f ! c
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model

cp gfs.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f06.gif
cp gfs.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f12.gif
cp gfs.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f18.gif
cp gfs.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f24.gif
cp gfs.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f30.gif
cp gfs.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f36.gif
cp gfs.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f42.gif
cp gfs.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f48.gif

mv gfs.gif gfs_11.gif
mv gfs.gif.001 gfs_12.gif
mv gfs.gif.002 gfs_13.gif
mv gfs.gif.003 gfs_14.gif
mv gfs.gif.004 gfs_15.gif
mv gfs.gif.005 gfs_16.gif
mv gfs.gif.006 gfs_17.gif
mv gfs.gif.007 gfs_18.gif
keep gfs_1[1-8].gif 
mv gfs_1[1-8].gif $WEBPIX/

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
GDATTIM	= f60-f120-12
GVCORD  = pres
GLEVEL	= 500
GVECT	= WND ! 
WIND    = bk31/0.9
SKIP    = /16;16 !
GFUNC	= sm9s(sm9s(avor(wnd)))           !sm9s(sm9s(avor(wnd)))     !hght
CINT	= 2/10/99               !2/4/8                 !6
LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
HILO	= 2;6/X;N/10-99;10-99   !
SCALE	= 5                     !5                     ! -1
TITLE	= 5/-2/ ~ GFS  500 HEIGHTS AND VORTICITY|^ 500 HGHT AND VORTICITY!0
PROJ	= lcc/25;-95;25/1,3,0,0
FINT	= 16;20;24;28;32;36;40;44
FLINE	= 0;23-15
CTYPE	= c/f ! c
STNPLT  = 0
\$mapfil=hipowo.gsf
list
run

exit
EOF
#
# Run GPEND to clean up
#
# Copy ps.plt to different name for eta model

cp gfs.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f60.gif
cp gfs.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f72.gif
cp gfs.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f84.gif
cp gfs.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f96.gif
cp gfs.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f108.gif
cp gfs.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_500mb_heights_vort_f120.gif

mv gfs.gif gfs_19.gif
mv gfs.gif.001 gfs_20.gif
mv gfs.gif.002 gfs_20a.gif
mv gfs.gif.003 gfs_20b.gif
mv gfs.gif.004 gfs_20c.gif
mv gfs.gif.005 gfs_20d.gif
keep gfs_19.gif gfs_20.gif gfs_20[a-d].gif 
mv gfs_19.gif gfs_20.gif gfs_20[a-d].gif $WEBPIX/

# Run GDPLOT and generate GFS model gfs
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE	= $grid
SCALE	= 0 !0 ! ! 3
GLEVEL  = 0 ! 0 ! 0 ! 700
GVCORD  = none !none  !none !pres
GVECT	=
CINT	= /.1/.1!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!4
LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 !2/1/1/1
SKIP	= 0
FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
FLINE   = 0;21-27;24;28-30;14;15;2;5
CTYPE	= f                !f                !c  !c
HILO    =                  !                 !25;2////30;30/y !
HLSYM   = 2;1.5//21//hw
STNPLT  = 0
\$mapfil=hipowo.gsf

DEVICE	= $device 
GDATTIM	= F06
TITLE	= 5/-2/ ~ GFS 6-HR TOTAL PCPN, MSLP, 700 VV|^ 6-HRLY TOT PCPN, MSLP, 700 VV!0!0
GFUNC   = (quo(APCP06,25.4)) !(quo(APCP06,25.4)) ! emsl@0%none !VVEL@700%pres
run

	GDATTIM	= F012
	DEVICE	= ${device}.001
TITLE	= 5/-2/ ~ GFS 12-HR TOTAL PCPN, MSLP, 700 VV|^ 12-HRLY TOT PCPN, MSLP, 700 VV!0!0
	GFUNC	= (quo(APCP12,25.4)) !(quo(APCP12,25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F018
	DEVICE	= ${device}.002
	GFUNC	= (quo(sub(APCP18,APCP06^f06),25.4)) !(quo(sub(APCP18,APCP06^f06),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F024
	DEVICE	= ${device}.003
	GFUNC	= (quo(sub(APCP24,APCP12^f12),25.4)) !(quo(sub(APCP24,APCP12^f12),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F030
	DEVICE	= ${device}.004
	GFUNC	= (quo(sub(APCP30,APCP18^f18),25.4)) !(quo(sub(APCP30,APCP18^f18),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F036
	DEVICE	= ${device}.005
	GFUNC	= (quo(sub(APCP36,APCP24^f24),25.4)) !(quo(sub(APCP36,APCP24^f24),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F042
	DEVICE	= ${device}.006
	GFUNC	= (quo(sub(APCP42,APCP30^f30),25.4)) !(quo(sub(APCP42,APCP30^f30),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F048
	DEVICE	= ${device}.007
	GFUNC	= (quo(sub(APCP48,APCP36^f36),25.4)) !(quo(sub(APCP48,APCP36^f36),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F060
	DEVICE	= ${device}.008
	GFUNC	= (quo(sub(APCP60,APCP48^f48),25.4)) !(quo(sub(APCP60,APCP48^f48),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F072
	DEVICE	= ${device}.009
	GFUNC	= (quo(sub(APCP72,APCP60^f60),25.4)) !(quo(sub(APCP72,APCP60^f60),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F084
	DEVICE	= ${device}.010
	GFUNC	= (quo(sub(APCP84,APCP72^f72),25.4)) !(quo(sub(APCP84,APCP72^f72),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F096
	DEVICE	= ${device}.011
	GFUNC	= (quo(sub(APCP96,APCP84^f84),25.4)) !(quo(sub(APCP96,APCP84^f84),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F108
	DEVICE	= ${device}.012
	GFUNC	= (quo(sub(APCP108,APCP96^f96),25.4)) !(quo(sub(APCP108,APCP96^f96),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F120
	DEVICE	= ${device}.013
	GFUNC	= (quo(sub(APCP120,APCP108^f108),25.4)) !(quo(sub(APCP120,APCP108^f108),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

exit
EOF
#

cp gfs.gif ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f06.gif
cp gfs.gif.001 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f12.gif
cp gfs.gif.002 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f18.gif
cp gfs.gif.003 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f24.gif
cp gfs.gif.004 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f30.gif
cp gfs.gif.005 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f36.gif
cp gfs.gif.006 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f42.gif
cp gfs.gif.007 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f48.gif
cp gfs.gif.008 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f60.gif
cp gfs.gif.009 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f72.gif
cp gfs.gif.010 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f84.gif
cp gfs.gif.011 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f96.gif
cp gfs.gif.012 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f108.gif
cp gfs.gif.013 ${ddir2}/pix/gfs/${1}z/gfs_${DATE}${1}_12hr_precip_MSLP_700VV_f120.gif

mv gfs.gif gfs_21.gif
mv gfs.gif.001 gfs_22.gif
mv gfs.gif.002 gfs_23.gif
mv gfs.gif.003 gfs_24.gif
mv gfs.gif.004 gfs_25.gif
mv gfs.gif.005 gfs_26.gif
mv gfs.gif.006 gfs_27.gif
mv gfs.gif.007 gfs_28.gif
mv gfs.gif.008 gfs_29.gif
mv gfs.gif.009 gfs_30.gif
mv gfs.gif.010 gfs_30a.gif
mv gfs.gif.011 gfs_30b.gif
mv gfs.gif.012 gfs_30c.gif
mv gfs.gif.013 gfs_30d.gif

keep gfs_2?.gif gfs_30.gif gfs_30[a-d].gif 
mv gfs_2?.gif gfs_30.gif gfs_30[a-d].gif $WEBPIX/
