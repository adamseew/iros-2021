
reset

set term qt size 200,240 font 'Times,8'
set datafile separator comma

set style line 1 lc rgb '#000000' pt 5 ps 0.2 lt 1 lw .6
set style line 2 lc rgb '#A9A9A9' pt 5 ps 0.2 lt 1 lw .6
set border lw .6

unset key

set macros

set xrange [200:400]
set yrange [29.3:42.3]
set ytics 30,4,38 right scale .5
set grid xtics ytics

NOXTICS = "set xtics ('' 200, '' 240, '' 300, '' 360, '' 400) scale .5; \
           unset xlabel"
XTICS = "set xtics ('3:20' 200, '4:00' 240, '5:00' 300, '6:00' 360, '6:40' 400) scale .5 offset 0,.3;\
         set xlabel 'Time (min)'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'Power (W)'"

TMARGIN = "set tmargin at screen 0.96; set bmargin at screen 0.58"
BMARGIN = "set tmargin at screen 0.56; set bmargin at screen 0.18"
LMARGIN = "set lmargin at screen 0.16; set rmargin at screen 0.94"


set multiplot layout 1,2 rowsfirst

@TMARGIN; @LMARGIN
@NOXTICS; @YTICS
LABEL='I'
set ylabel offset 0,-3.4;
set obj 1 rect at graph 0.893,0.86 size char strlen(LABEL)+1.2, char 1
set label 1 LABEL at graph 0.878,0.86
plot '../../../data/simulation3/raw5/evolved/evolution_simulation3D.csv' using 1:2 w l ls 2 lw .6,\
     '' using 1:3 w l ls 2 lw .6,\
     '' using 1:4 w l ls 2 lw .6,\
     '' using 1:5 w l ls 2 lw .6,\
     '' using 1:6 w l ls 2 lw .6,\
     '' using 1:7 w l ls 2 lw .6,\
     '' using 1:8 w l ls 2 lw .6,\
     '' using 1:9 w l ls 2 lw .6,\
     '' using 1:10 w l ls 2 lw .6,\
     '' using 1:11 w l ls 1 lw .6


@BMARGIN; @LMARGIN
@XTICS; @YTICS
LABEL='V'
unset key
unset ylabel
set key top left
set xtics ('3:20' 200, '4:00' 240, '5:00' 300, '6:00' 360, '6:40' 400) scale .5 offset 0,.3
set xlabel offset -.1,.9
set yrange [28.8:32]
set ytics 29,1,31 right scale .5
set obj 1 rect at graph 0.893,0.86 size char strlen(LABEL)+1.2, char 1
set label 1 LABEL at graph 0.863,0.86
plot '../../../data/simulation3/raw2/evolved/evolution_simulation3A.csv' using 1:2 w l title 'previous' ls 2 lw .6,\
     '' using 1:3 w l notitle ls 2 lw .6,\
     '' using 1:4 w l notitle ls 2 lw .6,\
     '' using 1:5 w l notitle ls 2 lw .6,\
     '' using 1:6 w l notitle ls 2 lw .6,\
     '' using 1:7 w l notitle ls 2 lw .6,\
     '' using 1:8 w l notitle ls 2 lw .6,\
     '' using 1:9 w l notitle ls 2 lw .6,\
     '' using 1:10 w l notitle ls 2 lw .6,\
     '' using 1:11 w l title 'last' ls 1 lw .6 

unset multiplot

pause -1
