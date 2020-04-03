%macro bkill(jobid=0000);
options spool;
filename kill pipe "bkill &jobid";
data kill;
   infile kill truncover;
   input Kill_Status $50.;
run;
title "Kill JobID &jobid Status";
proc print data=kill;
run;
options nospool;
%mend bkill;


