%macro segoshv(service=ProcessManager);
run;

options linesize=max ;
filename cmdout pipe "egosh service view &service" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "EGO View of Service &service";
  put _infile_;
run;

%mend segoshv;

/*
%egoshv(Service=sbatchd);
*/

