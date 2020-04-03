%macro waitso(count);
  %do i = 1 %to &count;
    waitfor sess&i;
    signoff sess&i;
  %end;
%mend waitso;
