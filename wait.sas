%macro wait(count);
  %do i = 1 %to &count;
    waitfor sess&i;
  %end;
%mend wait;
