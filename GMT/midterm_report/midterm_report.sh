out_ps=midterm_report.ps
input_list=earthquake.list

cpt=report.cpt

gmt set PS_MEDIA A3 

gmt makecpt -T0/170/10 -Crainbow -Z > $cpt

# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K > $out_ps

#Main map  
gmt psbasemap -R-179/-60/15/72 -Jm0.2 -B5 -G0/250/250 -O -K >> $out_ps
echo -120 80 30,black 0 CM U.S. Earthquakes Magnitude Over 7 | gmt pstext -R -J -F+f+a+j -N -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Dl -O -K -N1 >> $out_ps
awk '{if ($4>=7 && $4<8) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K >> $out_ps
awk '{if ($4>=8 && $4<9) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.4 -C$cpt -O -K >> $out_ps
awk '{if ($4>=9 && $4<10) print $2, $1, $3}' $input_list | gmt psxy -R -J -Sc0.6 -C$cpt -O -K >> $out_ps


# Top map
gmt psbasemap -R-179/-60/0/170 -Jx0.2/0.02 -Bxa5f5 -Bya50f10 -X0 -Y20 -O -K >> $out_ps
awk '{if ($4>=7 && $4<8) print $2, $3, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K >> $out_ps
awk '{if ($4>=8 && $4<9) print $2, $3, $3}' $input_list | gmt psxy -R -J -Sc0.4 -C$cpt -O -K >> $out_ps
awk '{if ($4>=9 && $4<10) print $2, $3, $3}' $input_list | gmt psxy -R -J -Sc0.6 -C$cpt -O -K >> $out_ps
  
# Right map
gmt psbasemap -R0/170/15/72 -Jx0.03/0.32 -Bxa50f10 -Bya5f5 -X26 -Y-20 -O -K >> $out_ps
awk '{if ($4>=9 && $4<10) print $3, $1, $3}' $input_list | gmt psxy -R -J -Sc0.2 -C$cpt -O -K >> $out_ps
awk '{if ($4>=8 && $4<9) print $3, $1, $3}' $input_list | gmt psxy -R -J -Sc0.4 -C$cpt -O -K >> $out_ps
awk '{if ($4>=9 && $4<10) print $3, $1, $3}' $input_list | gmt psxy -R -J -Sc0.6 -C$cpt -O -K >> $out_ps



# end gmt session
gmt psxy -R -J -O -T >> $out_ps 
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg