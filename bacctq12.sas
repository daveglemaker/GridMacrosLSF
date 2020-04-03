%macro bacctq12(guser=all, que=normal);
options spool;
filename bacctq pipe "bacct -u &guser -q &que -C .-12/,.";
data bacctq;
   infile bacctq truncover;
   input bacct_Status $400.;
run;
title "Bacct Status for user &guser on queue &que";
proc print data=bacctq;
run;
options nospool;
%mend bacctq12;

