%macro jobinfo;
   data jobinf;
      jobid="%sysget(LSB_JOBID)";
      jobname="%sysget(LSB_JOBNAME)";
      queue="%sysget(LSB_QUEUE)";
      server="%sysget(HOSTNAME)";
   run;
   title "My Current Grid Session Info"; 
   proc print;run;title;
%mend jobinfo;
