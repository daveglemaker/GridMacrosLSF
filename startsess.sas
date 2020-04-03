%macro startsess(count, signonwait=no, connectwait=no);
  %do i = 1 %to &count;
    signon sess&i signonwait=&signonwait connectwait=&connectwait cmacvar=mysignonvar&i;
  %end;
%mend startsess;
