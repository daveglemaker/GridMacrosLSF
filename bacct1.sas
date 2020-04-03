%macro bacct1(guser=all);
options spool;
filename bacct pipe "bacct -u &guser -C .-1/,.";
data bacct;
   infile bacct truncover;
   input bacct_Status $400.;
   run;
title "Bacct Status for user &guser";
proc print data=bacct;
run;
options nospool;
%mend bacct1;

