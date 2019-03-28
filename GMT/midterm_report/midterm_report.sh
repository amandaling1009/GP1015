out_ps=midterm_report.ps
input_list=

gmt set PS_MEDIA A3 
  
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K > $out_ps 
  
gmt psbasemap -R-130/-60/20/50 -Jm0.5 -B5 -G0/250/250 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -O -K >> $out_ps
  
# end gmt session
gmt psxy -R -J -O -T >> $out_ps 
  
# convert to pdf
gmt psconvert $out_ps -P -Tf
# convert to png
gmt psconvert $out_ps -P -Tg