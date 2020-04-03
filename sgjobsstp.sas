%macro sgjobsstp;
run;

options linesize=max ;
filename cmdout pipe "bjobs -u &_metauser -a -w" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "My Grid Jobs Today - &_metauser";
  put _infile_;
run;

%mend sgjobsstp;

/*
%gjobsstp;
*/