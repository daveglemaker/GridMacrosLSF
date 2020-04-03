%macro bresume(jobid=0000);
options spool;
filename resume pipe "bresume &jobid";
data resume;
   infile resume truncover;
   input Resume_Status $50.;
run;
title "Resume JobID &jobid Status";
proc print data=resume;
run;
options nospool;
%mend bresume;


