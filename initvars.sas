%macro initvars(numSessions);
 %do sess=1 %to &numSessions;
  %global mySignonVar&sess;
  %global myRsubmitVar&sess;
  %let mySignonVar&sess=3;
  %let myRsubmitVar&sess=0;
 %end;
%mend;
