source ../COMMON.csh

setenv LOGFILE  logs/www_lap.log

set grid=${MODEL}/nam/${DATE}${1}_nam212.gem
set grid1=${MODEL}/nam/${DATE}${1}_nam211.gem

$GEMEXE/gdplot_gf << EOF > $LOGFILE
\$RESPOND = YES
        GDFILE  = $grid
        GDATTIM = f00
        DEVICE  = GF|lap.gif|720;540
        PANEL   = 0
        TEXT    = 1/21//hw
        CONTUR  = 1
        MAP      = 25/1/1
        CLEAR   = yes
        GAREA    = 20;-123;51;-62
        PROJ     = lcc/35;-95;20
        LATLON   = 0
        CLRBAR = 25

        GVCORD   = pres !pres
        SCALE    = 0 !
        SKIP    = !/2;2
        GFUNC = STAB(tmpc) 
        GLEVEL   = 850:500 !700
        GVECT   =  !WND
        CTYPE    = f
        FINT     = 0.5  
        FLINE     = 14-19;21-24;26-30
        LINE = !32
        WIND = BK32/0.8
        
        REFVEC   = 
        TITLE    = 31/-2/~ 850-500mb Lapse Rates (K/km), 700mb winds
        TEXT     = 1.0/2//hw
        SATFIL   = 
        RADFIL   = 
        STNPLT   =
        
        list
        run

        exit
EOF

cp lap.gif ${ddir}${DATE2}/pix/lapse/${1}z/${DATE}${1}_850mb_500mb_lapse_rates_700mb_winds_f00.gif
if (-e lap.gif) then
  mv lap.gif $WEBPIX/lap01.gif
  keep $WEBPIX/lap01.gif
endif

# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid
GDATTIM = f00
DEVICE  = GF|lap2.gif|720;540
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA    = 20;-123;51;-62
PROJ     = lcc/35;-95;20
LATLON  = 0
GLEVEL  = 0!0!850
GVCORD  = none!none!pres
GFUNC   = cape!cins
GVECT   =                  !       !  wind@850%pres
WIND    =                  !       !  bk31/0.8/1
SKIP    = 0                !       ! /4
CINT    = 500!-300.;-200.;-160.;-120.;-80.;-40.;0.
LINE    = 3/1/1/2           !15/1/2
TITLE   = 5// ~ ETA  CAPE,CIN AND 850 WIND   |^ CAPE,CIN,850 WIND ! 0
SKIP    = /2;2
FINT    = 500;1000;1500;2000;2500;3000;3500;4000;5000;6000
FLINE   = 0;26-16--2;14-8--2
CTYPE   = c/f                !c
HILO    =                  !
\$mapfil=hipowo.gsf
list
run

exit
EOF

cp lap2.gif ${ddir}${DATE2}/pix/lapse/${1}z/${DATE}${1}_CAPE_CIN_850mb_wind_f00.gif
if (-e lap2.gif) then
mv lap2.gif $WEBPIX/lap02.gif
keep $WEBPIX/lap02.gif
endif

# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid1
GDATTIM = F00
DEVICE  = GF|lap3.gif|720;540
GLEVEL  = 0!180:0!3000:0
GVCORD  = none!pdly!hght
GFUNC   = (quo(pwtr,25.4))!lft4!hlcy
GVECT   =
CINT    = .5;.75;1.0;1.25;1.5;1.75;2.0!-14.;-12.;-10.;-8.;-6.;-4.;-2.;0.;2.!150.;250.;300.;400.;600.
LINE    = 0              !15/1/2          ! 30/5/2
TITLE   = 5// ~ ETA  PWTR,LI AND HELICITY    |^ PREC.WATER, LI, HELICITY  !0
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

cp lap3.gif ${ddir}${DATE2}/pix/lapse/${1}z/${DATE}${1}_PWTR_LI_Helicity_f00.gif
if (-e lap3.gif) then
mv lap3.gif $WEBPIX/lap03.gif
keep $WEBPIX/lap03.gif
endif

# changed 2001.04.13 geff@iastate.edu
#$GEMEXE/gdplot << EOF >> $LOGFILE
$GEMEXE/gdplot_gf << EOF >> $LOGFILE
\$RESPOND = YES
GDFILE  = $grid1
GDATTIM = f00
DEVICE  = GF|lap4.gif|720;540
PANEL   = 0
TEXT    = 1.2/21//hw
CONTUR  = 1
MAP     = 31/1/1
CLEAR   = yes
CLRBAR  = 31
GAREA   = 17;-122;53;-60
PROJ    = lcc/25;-95;25
LATLON  = 0

GLEVEL  = 0                !2!2
GVCORD  = none             !hght!hght
GFUNC=quo(mul(cape,hlcy@3000:0%hght),160000.)!dwpf!tmpf
GVECT   =                  !       !
WIND    =                  !       !
SKIP    = 0                !       !
SCALE   = 0 ! 0 ! 0
CINT    = 0;0.5;1;1.5;2;3;4;5;6;7;8!45;50;55;60;65;70;75;80!60;70;75;80;85;90;95;100
LINE    = 3/1/1/2           !15/1/2 ! 31/1/1/1
TITLE   = 5// ~ ETA EHI, SFC T & DEW POINT   |^ EHI, SFC T & DEW POINT ! 0
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

cp lap4.gif ${ddir}${DATE2}/pix/lapse/${1}z/${DATE}${1}_EHI_sfcT_Td_f00.gif
if (-e lap4.gif) then
mv lap4.gif $WEBPIX/lap04.gif
keep $WEBPIX/lap04.gif
endif
