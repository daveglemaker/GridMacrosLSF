%macro rgetlog(count);
   %do i=1 %to &count;
     rget remote=sess&i;
   %end;
%mend rgetlog;
