
source ../COMMON.csh

setenv LOGFILE 	logs/www_gfs.log

set gdattim="f00-f72-6"
set garea="17;-122;53;-60"
set device="GF|gfs1.gif"
set grid=${MODEL}/gfs/${DATE}${1}_gfs215.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31

	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL	= 500:1000                  !0
	GVCORD	= pres                      !none
	GFUNC	= (sub(hght@500,hght@1000)) !EMSL@0%none
	SCALE	= -1                        ! 0
	CINT	= 6                         ! 4
	LINE	= 3/3/1                     ! 20//2
	GVECT	=
	TITLE	= 5/-2/ ~ GFS MSL PRESSURE, 1000-500 MB THICKNESS
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

# $GEMEXE/gpend

csh ../scripts/savegfs.csh gfs1 gfsTHK${date}${1} gfsTHK

######################


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GVCORD  = pres
	DEVICE	= $device 
	GLEVEL	= 500
	GVECT	= WND ! 
	WIND    = bk31
	SKIP    = /4;4 !
	GFUNC	= (avor(wnd))           !(avor(wnd))           !hght
	CINT	= 2/10/99               !2/4/8                 !6
	LINE	= 7/5/1/2               !4/5/1/2               !19/1/2/1
	HILO	= 2;6/X;N/10-99;10-99   !
	SCALE	= 5                     !5                     ! -1
	TITLE	= 5/-2/ ~ GFS 500 HEIGHTS AND VORTICITY
	PROJ	= lcc/25;-95;25
	FINT	= 16;20;24;28;32;36;40;44
	FLINE	= 0;23-15
	CTYPE	= c/f ! c
	STNPLT  = 0

	list
	run

	exit
EOF

# $GEMEXE/gpend

csh ../scripts/savegfs.csh gfs1 gfsVORT${date}${1} gfsVORT

#########################

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	DEVICE	= $device 
	GLEVEL	= 0	!0	!0	!700
	GVCORD	= NONE	!NONE	!none	!pres
	GVECT	=
	CINT	= /.1/.1!0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0!4!4
	LINE	= 20//1/0           !30//1/0          ! 5/1/1/3 !2/1/1/1
	TITLE	= 5/-2/ ~ GFS 6-HR TOTAL PCPN, MSLP, 700 VV|^ 6-HR TOTAL PCPN, MSLP, 700 VV!0
	SCALE	= 0 ! ! ! 3
	SKIP	= 0
	FINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
	FLINE   = 0;21-27;24;28-30;14;15;2;5
	CTYPE	= f                !c                ! c  ! c
	HILO    =                  !                 !25;2////30;30/y !
	HLSYM   = 2;1.5//21//hw
	STNPLT  = 0
	GDATTIM	= F000
	GFUNC	= (quo(APCP00,25.4)) !(quo(APCP00,25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F006
	DEVICE	= ${device}.001
	GFUNC	= (quo(APCP06,25.4)) !(quo(APCP06,25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F012
	DEVICE	= ${device}.002
	GFUNC	= (quo(sub(APCP12,APCP06^f06),25.4)) !(quo(sub(APCP12,APCP06^f06),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F018
	DEVICE	= ${device}.003
	GFUNC	= (quo(sub(APCP18,APCP12^f12),25.4)) !(quo(sub(APCP18,APCP12^f12),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F024
	DEVICE	= ${device}.004
	GFUNC	= (quo(sub(APCP24,APCP18^f18),25.4)) !(quo(sub(APCP24,APCP18^f18),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F030
	DEVICE	= ${device}.005
	GFUNC	= (quo(sub(APCP30,APCP24^f24),25.4)) !(quo(sub(APCP30,APCP24^f24),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F036
	DEVICE	= ${device}.006
	GFUNC	= (quo(sub(APCP36,APCP30^f30),25.4)) !(quo(sub(APCP36,APCP30^f30),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F042
	DEVICE	= ${device}.007
	GFUNC	= (quo(sub(APCP42,APCP36^f36),25.4)) !(quo(sub(APCP42,APCP36^f36),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F048
	DEVICE	= ${device}.008
	GFUNC	= (quo(sub(APCP48,APCP42^f42),25.4)) !(quo(sub(APCP48,APCP42^f42),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F054
	DEVICE	= ${device}.009
	GFUNC	= (quo(sub(APCP54,APCP48^f48),25.4)) !(quo(sub(APCP54,APCP48^f48),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F060
	DEVICE	= ${device}.010
	GFUNC	= (quo(sub(APCP60,APCP54^f54),25.4)) !(quo(sub(APCP60,APCP54^f54),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F066
	DEVICE	= ${device}.011
	GFUNC	= (quo(sub(APCP66,APCP60^f60),25.4)) !(quo(sub(APCP66,APCP60^f60),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	GDATTIM	= F072
	DEVICE	= ${device}.012
	GFUNC	= (quo(sub(APCP72,APCP66^f66),25.4)) !(quo(sub(APCP72,APCP66^f66),25.4)) ! EMSL@0%none !VVEL@700%pres
	run

	exit
EOF

 # $GEMEXE/gpend

csh ../scripts/savegfs.csh gfs1 gfsPREC${date}${1} gfsPREC

#########################

rm -f gfs2.gif
set device="GF|gfs2.gif"


#$GEMEXE/gdplot << EOF >> $LOGFILE
#	GDFILE	= $grid
#	GDATTIM = $gdattim
#	DEVICE  = $device
#	GLEVEL  = 0          !180:0                ! 3000:0
#	GVCORD  = eatm            !pagl             !hght
#	GFUNC   = (quo(pwtr,25.4)) !lft4              !hlcy
#	GVECT   =
#	CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.!150.;250.;300.;400.;600.
#	LINE    = 0              !15/1/2          ! 30/5/2
#	TITLE   = 5/-2/ ~ GFS PWTR,LI AND HELICITY    |^ PREC.WATER, LI, HELICITY  !0
#	SCALE   = 0
#	SKIP    = 0
#	FINT    = .5;.75;1.0;1.25;1.5;1.75;2.0
#	FLINE   = 0;21-25;28-30;14;15;2;5
#	CTYPE   = c/f                !c                ! c
#	HILO    =                  !                 !
#	HLSYM   =
#	STNPLT =0

#	list
#	run


#	exit
#EOF

#$GEMEXE/gpend


#######################

rm -f gfs3.gif

set device="GF|gfs3.gif"


#$GEMEXE/gdplot << EOF >> $LOGFILE
#
#	GDFILE	= $grid
#	GDATTIM	= $gdattim
#	DEVICE	= $device 
#	PANEL	= 0
#	TEXT	= 1.2/21//hw
#	CONTUR	= 1
#	MAP     = 31/1/1
#	CLEAR	= yes
#	CLRBAR  = 31
#	GAREA	= $garea
#	PROJ	= lcc/25;-95;25
#	LATLON	= 0
	
	
#	GLEVEL  = 0                !0      !  850
#	GVCORD  = none             !none   !  pres
#	GFUNC   = cape             !cins
#	GVECT   =                  !       !  wind@850%pres
#	WIND    =                  !       !  bk31//1
#	SKIP    = 0                !       ! /4
#	CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
#	LINE    = 3/1/1/2           !15/1/2
#	TITLE   = 5/-2/ ~ GFS CAPE,CIN AND 850 WIND   |^ CAPE,CIN,850 WIND ! 0
#	SKIP    = /2;2
#	FINT    = 500;1000;1500;2000;2500;3000;3500;4000;5000;6000
#	FLINE   = 0;26-16--2;14-8--2
#	CTYPE   = c/f                !c
#	HILO    =                  !
	
#	list
#	run

#	exit
#EOF

#$GEMEXE/gpend


#################


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31
	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	LATLON	= 0
	
	GLEVEL  = 0                !850		!700	!2
	GVCORD  = NONE             !pres	!pres	!hght
	GFUNC   = (quo(apcp06,25.4)) !(tmpc) 	!(tmpc)	!(tmpc)
	GVECT   =
	CINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;2.0!-5.0;0.0;2.0!-2.0;0.0;2.0 !-5.;0.;2.
	LINE    = 20//2/0	!6/1/2		!7/1/2	!2/4/2
	TITLE   = 5/-2/ ~ GFS 2M(RED),850MB(BLUE),700 MB T(C)|^ 2M,850,700 MB TMPC, PREC !0!0
	SCALE   = 0
	SKIP    = 0
	FINT    = 0.10;0.25;0.50;0.75;1.0;1.25;1.5;1.75;2.0;2.25;2.50;2.75;3.0
	FLINE   = 0;21-27;24;28-30;14;15;2;5
	CTYPE   = f                !c                ! c  ! c
	HILO    =                  !  !  !
	HLSYM   =
	STNPLT  = 0
	
	list
	run

	exit
EOF

# $GEMEXE/gpend

csh ../scripts/savegfs.csh gfs3 gfsTEMP${date}${1} gfsTEMP

############


rm -f gfs5.gif
set device="GF|gfs5.gif"


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31

	GAREA	= $garea
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
	TITLE	= 5/-2/ ~ GFS  850 HGHTS, DEW POINTS (C) AND WIND|^ 850 Z, TD, WIND!0
	SKIP	= /8;8 !
	FINT	= -20;-16;-12;-8;-4;0;4;8;10;12;14;16;18;20
	FLINE	= 0;26-16--1;14-8--2 !
	CTYPE	= c/f ! c
	HLSYM   = 
	HILO    = 
	STNPLT  = 0

	list
	run


	exit
EOF

# $GEMEXE/gpend
csh ../scripts/savegfs.csh gfs5 gfs85P${date}${1} gfs85P

######################

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	CLRBAR  = 31

	GLEVEL	= 250  
	GVCORD	= pres !pres  !pres
	GFUNC	= sped !hght  !div(wnd)
	GVECT	= ! !
	CINT	= 10;20;30;40;50;60;70;80;90! 120 !2
	LINE	= 7/5/1/2           !31/1/2/2  !29/1/1/1
	TITLE	= 5/-2/ ~ GFS 250 MB HGHTS, WIND SPEED (M/S) AND DIV
	SCALE	= 0 ! 0 ! 5
	SKIP	= 0 ! 0 ! 8;8
	FINT    = 10;20;30;40;50;60;70;80;90!!
	FLINE	= 0;26-16--2;14-8--2 
	CTYPE	= f              !c
	HLSYM   = 
	HILO    = 
	STNPLT  = 0
	
	list
	run

	exit	
EOF

# $GEMEXE/gpend

csh ../scripts/savegfs.csh gfs5 gfs25P${date}${1} gfs25P

############


$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	DEVICE	= $device 
	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	CLRBAR  = 31

	GLEVEL	= 700 
	GVCORD  = pres !pres !pres
	GFUNC	= relh    !tmpc           !hght
	GVECT   = wnd  ! !
	WIND    = bk2
	skip    = /8;8 !
	CINT	= 10;30;50;70;90 !-20;-10;-5;0;4;6;8;10;12;14;16;18   !30
	LINE	= 7/5/1/2               !4/2/2/1             !4/1/2/2
	HLSYM   = 
	HILO    = 
	SCALE	= 0  !0 !0 
	TITLE	= 5/-2/ ~ GFS 700 HEIGHTS, RH and TEMP
	FINT	= 10;30;50;70;90
	FLINE	= 0;11;17-23-2
	CTYPE	= f ! c
	STNPLT  = 0
	\$mapfil=HIPOWO.GSF
	list
	run

	exit
EOF

# $GEMEXE/gpend

csh ../scripts/savegfs.csh gfs5 gfs70P${date}${1} gfs70P

#############

rm -f gfs6.gif
set device="GF|gfs6.gif"

$GEMEXE/gdplot_gf << EOF >> $LOGFILE

	GDFILE	= $grid
	GDATTIM	= $gdattim
	DEVICE	= $device 
	PANEL	= 0
	TEXT	= 1.2/21//hw
	CONTUR	= 1
	MAP     = 31/1/1
	CLEAR	= yes
	CLRBAR  = 31
	GAREA	= $garea
	PROJ	= lcc/25;-95;25
	LATLON	= 0

	GLEVEL  = 0                !2      !2
	GVCORD  = none             !hght   !hght
	GFUNC=quo(mul(cape,hlcy@3000:0%hght),160000.)!dwpf!tmpf
	GVECT   =                  !       !  
	WIND    =                  !       ! 
	SKIP    = 0                !       ! 
	SCALE   = 0 ! 0 ! 0
	CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
	LINE    = 3/1/1/2           !15/1/2 ! 31/1/1/1
	TITLE   = 5/-2/ ~ gfs EHI, SFC T & DEW POINT   
	FINT    = 1;1.5;2;3;4;5;6;7;8!
	FLINE   = 0;26-16--2;14-8--2
	CTYPE   = f                !c ! c
	HILO    =                  !  ! 
	STNPLT  =0

	list
	run

	exit
EOF

# $GEMEXE/gpend

csh ../scripts/savegfs.csh gfs6 gfsEHI${date}${1} gfsEHI

