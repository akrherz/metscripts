
source ../COMMON.csh

setenv DATA_DIR	/data/gempak/model
setenv LOGFILE 	logs/www_eta.log

set device="GF|eta1.gif"
set grid=${DATA_DIR}/nam/${DATE}${1}_nam212.gem
set grid2=${DATA_DIR}/nam/${DATE}${1}_nam215.gem
set dattim="f00-f60-6"

if !(-e $grid) then
	echo "ABORT: Can not find grid file $grid"
	echo "ETA Model -> $grid" >> RERUNS
	exit 2
endif


##################################
#  NAM EMSLP and 500 hPa Thickness

$GEMEXE/gdplot_gf << EOF > $LOGFILE

	GDFILE	= $grid
	GDATTIM	= ${dattim}
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31

	GAREA	= grid
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL	= 500:1000                  !0
	GVCORD	= pres                      !none
	GFUNC	= (sub(hght@500,hght@1000)) !emsl@0%none
	SCALE	= -1                        ! 0
	CINT	= 6                         ! 4
	LINE	= 3/3/1                     ! 20//2
	GVECT	=
	TITLE	= 5/-2/~ NAM MSL PRESSURE, 1000-500 MB THICKNESS
	SKIP	= 1
	FINT	=
	FLINE	=
	CTYPE	= c
	HLSYM   = 2;1.5//21//hw
	HILO    = ! 25;2/H#;L#///30;30/y 
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run


	exit
EOF

if (-e eta1.gif) then
../scripts/saveEta.csh eta1 etaTHK${date}${1} etaTHK
endif


###############################################
# NAM 500 hPa heights and vort

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GVCORD  = pres
	DEVICE	= $device 
	GLEVEL	= 500
	GVECT	= WND ! 
	WIND    = bk31
	SKIP    = /8;8 !
	GFUNC	= (avor(wnd))           !(avor(wnd))           !hght
	CINT	= 2/10/99               !2/4/8                 !6
	LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
	HILO	= 2;6/X;N/10-99;10-99   !
	SCALE	= 5                     !5                     ! -1
	TITLE	= 5/-2/~ NAM 500 HEIGHTS AND VORTICITY
	PROJ	= lcc/25;-95;25/1,3,0,0
	FINT	= 16;20;24;28;32;36;40;44
	FLINE	= 0;23-15
	CTYPE	= c/f ! c
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 etaVORT${date}${1} etaVORT
endif

############################################
# NAM 6 hr Precip, EMSLP, 700 w

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	DEVICE	= $device 
	GDATTIM	= ${dattim}
	GLEVEL	= 0                !0                !0           !700
	GVCORD	= none             !none             !none        !pres
	GFUNC	= (quo(p06m,25.4)) !(quo(p06m,25.4)) !emsl@0%none !omeg@700%pres
	GVECT	=
	CINT	= /.1/.1!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!4
	LINE	= 20//1/0          !30//1/0          ! 5/1/1/3    !2/1/1/1
	TITLE	= 5/-2/~ NAM  6-HR TOTAL PCPN, MSLP, 700 VV
	SCALE	= 0                !0                !0            !3
	SKIP	= 0
	FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
	FLINE   = 0;21-27;24;28-30;14;15;2;5
	CTYPE	= f                !c                !c           !c
	HILO    =                  !                 !25;2////30;30/y !
	HLSYM   = 2;1.5//21//hw
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 etaPREC${date}${1} etaPREC
endif

##########################################
# NAM Prec Water, Lifted Index, Helicity

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
	GDFILE	= $grid2
	GDATTIM = ${dattim}
	DEVICE  = $device
	GLEVEL  = 0                !180:0           !3000:0
	GVCORD  = NONE             !pdly            !HGHT
	GFUNC   = (quo(pwtr,25.4)) !lft4            !hlcy
	GVECT   =
	CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.!150.;250.;300.;400.;600.
	LINE    = 0              !15/1/2          ! 30/5/2
	TITLE   = 5/-2/ ~ NAM  PWTR,LI AND HELICITY    |^ PREC.WATER, LI, HELICITY  !0
	SCALE   = 0
	SKIP    = 0
	FINT    = .5;.75;1.0;1.25;1.5;1.75;2.0
	FLINE   = 0;21-25;28-30;14;15;2;5
	CTYPE   = c/f              !c                !c
	HILO    =                  !                 !
	HLSYM   =
	STNPLT =0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 etaHEL${date}${1} etaHEL
endif

#########################################################
# NAM CAPE, CIN, 850 Wind

$GEMEXE/gdplot_gf << EOF >> $LOGFILE
	GDFILE	= $grid
	GDATTIM	= ${dattim}
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


	GLEVEL  = 0                !0      !  850
	GVCORD  = none             !none   !  pres
	GFUNC   = cape             !cins
	GVECT   =                  !       !  wind@850%pres
	WIND    =                  !       !  bk31//1
	SKIP    = 0                !       ! /4
	CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
	LINE    = 3/1/1/2           !15/1/2
	TITLE   = 5/-2/ ~ NAM  CAPE,CIN AND 850 WIND   |^ CAPE,CIN,850 WIND ! 0
	SKIP    = /4;4
	FINT    = 500;1000;1500;2000;2500;3000;3500;4000;5000;6000
	FLINE   = 0;26-16--2;14-8--2
	CTYPE   = c/f                !c
	HILO    =                  !
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF



if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 etaCCW${date}${1} etaCCW
endif

##############################################################
# NAM temps

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= ${dattim}
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
	GFUNC   = (quo(p06m,25.4)) !(tmpc) ! (tmpc)! (tmpc)
	GVECT   =
	CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
	LINE    = 20//2/0           !6/1/2          ! 7/1/2  ! 2/4/2
	TITLE   = 5/-2/ ~ NAM 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
	SCALE   = 0
	SKIP    = 0
	FINT    = 0.01;0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
	FLINE   = 0;21-27;24;28-30;14;15;2;5
	CTYPE   = f                !c                ! c  ! c
	HILO    =                  !  !  !
	HLSYM   =
	STNPLT=0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF


if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 etaTEMP${date}${1} etaTEMP
endif

########################################################
# NAM 850 hPa Heights, Dew Points, Winds

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= ${dattim}
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31

	GAREA	= grid
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL	= 850                      !850     
	GVCORD	= pres                     !pres    
	GFUNC	= dwpc                     !hght   
	SCALE	= 0                        ! 0    
	CINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20  ! 30     
	LINE	= 7/5/1/2                  ! 2/1/2/1
	GVECT	= WND
	WIND    = bk4
	TITLE	= 5/-2/ ~ NAM   850 HGHTS, DEW POINTS (C) AND WIND|^ 850 Z, TD, WIND!0
	SKIP	= /4;4 !
	FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
	FLINE	= 0;26-16--1;14-8--2 !
	CTYPE	= c/f ! c
	HLSYM   = 
	HILO    = 
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF

if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 eta85P${date}${1} eta85P
endif 

###################################################
# NAM 250 hPa plot

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GAREA	= grid
	PROJ	= lcc/25;-95;25
	CLRBAR  = 31

	GLEVEL	= 250  
	GVCORD	= pres !pres  !pres
	GFUNC	= sped !hght  !div(wnd)
	GVECT	= ! !
	CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
	LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
	TITLE	= 5/-2/ ~ NAM  250 MB HGHTS, WIND SPEED (M/S) AND DIV
	SCALE	= 0 ! 0 ! 5
	SKIP	= 0 ! 0 ! 0
	FINT    = 10;20;30;40;50;60;70;80;90!!
	FLINE	= 0;26-16--2;14-8--2 
	CTYPE	= f              !c
	HLSYM   = 
	HILO    = 
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF

if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 eta25P${date}${1} eta25P
endif 

################################################
# NAM 700 hPa Plots

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	DEVICE	= $device 
	GAREA	= grid
	PROJ	= lcc/25;-95;25
	CLRBAR  = 31

	GLEVEL	= 700 
	GVCORD  = pres !pres !pres
	GFUNC	= relh(tmpc,dwpc)    !tmpc           !hght
	GVECT   = wnd  ! !
	WIND    = bk2
	skip    = /4;4 !
	CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
	LINE	= 7/5/1/2               !4/2/2/1             !4/1/2/2
	HLSYM   = 
	HILO    = 
	SCALE	= 0  !0 !0 
	TITLE	= 5/-2/ ~ NAM  700 HEIGHTS, RH and TEMP|^ 700 HGHT, RH AND TEMP!0!0
	FINT	= 10;30;50;70;90
	FLINE	= 0;11;17-23-2
	CTYPE	= f ! c
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF

if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 eta70P${date}${1} eta70P
endif

########################################################
# NAM EHI, Surface Temp and Dew Point


##set param1="mul(quo(cape@0%none,1000.),quo(hlcy@0:3000%hagl,150.))"
##set param1="MUL(WSHR(OBS),SQRT(CAPE%NONE@0))"
#
# Run GDPLOT and generate NAM model gfs
##GFUNC=quo(mul(cape,hlcy@3000:0%hagl),160000.)!dwpf!tmpf
##GFUNC=quo(mul(cape,hlcy@3000:0%hagl),160000.)!dwpf!MUL(WSHR(OBS),SQRT(CAPE%NONE@0))
##CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
##CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!.1;.2;.3;.4;.5;.6
#
$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= ${dattim}
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

	GLEVEL  = 0                !2      !2
	GVCORD  = none             !hght   !hght
	GFUNC=quo(mul(cape,hlcy@3000:0%pdly),160000.)!dwpf!tmpf
	GVECT   =                  !       !  
	WIND    =                  !       ! 
	SKIP    = 0                !       ! 
	SCALE   = 0 ! 0 ! 0
	CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
	LINE    = 3/1/1/2           !15/1/2 ! 31/1/1/1
	TITLE   = 5/-2/ ~ NAM EHI, SFC T & DEW POINT   |^ EHI, SFC T & DEW POINT ! 0
	FINT    = 1;1.5;2;3;4;5;6;7;8!
	FLINE   = 0;26-16--2;14-8--2
	CTYPE   = f                !c ! c
	HILO    =                  !  ! 
	STNPLT  =0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF



if (-e eta1.gif) then
  ../scripts/saveEta.csh eta1 etaEHI${date}${1} etaEHI
endif
