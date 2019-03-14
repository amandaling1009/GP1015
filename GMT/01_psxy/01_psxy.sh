echo 0 0 | gmt psxy -R-100/100/-100/100 -JX10 -Sc4 -Ba20g10/a20g10 -P -K > 01_psxy.ps
echo 40 40 | gmt psxy -R-100/100/-100/100 -JX10 -Sc2 -Ba20g10/a20g10 -P -O -K >> 01_psxy.ps
echo -40 40 | gmt psxy -R-100/100/-100/100 -JX10 -Sc2 -Ba20g10/a20g10 -P -O >> 01_psxy.ps
