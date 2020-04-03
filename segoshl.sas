%macro segoshl;
run;

options linesize=max ;
filename cmdout pipe "egosh service list -l" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "My EGO Controlled Services";
  put _infile_;
run;

%mend segoshl;

/*
%egoshl;
*/