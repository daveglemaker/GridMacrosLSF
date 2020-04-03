%macro startsessnormal(count, server=SASApp, signonwait=no, connectwait=no);
  %do i = 1 %to &count;
    %let rc=%sysfunc(grdsvc_enable(_all_, server=&server));
    signon sess&i signonwait=&signonwait connectwait=&connectwait cmacvar=mysignonvar&i;
  %end;
%mend startsessnormal;
