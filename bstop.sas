%macro bstop(jobid=0000);
options spool;
filename stop pipe "bstop &jobid";
data stop;
   infile stop truncover;
   input Stop_Status $50.;
   resume='<a href="http://eeclxvm74.unx.sas.com:7980/SASStoredProcess/do?_program=%2FShared+Data%2Fbresumestp&jobid='||compress(&jobid)||'" target="_blank">Resume</a>';
run;
title "Stop JobID &jobid Status";
proc print data=stop;
run;
options nospool;
%mend bstop;


