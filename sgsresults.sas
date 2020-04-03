%macro sgsresults(jobid=all, mydir=/home/sasdemo);

options linesize=max ;

filename cmdout pipe "&gsconfigdir./sasgsub -gridgetresults &jobid -gridresultsdir &mydir" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Move Results JobID &jobid to &mydir";
  put _infile_;
run;

%mend sgsresults;

/* 
%gsresults(jobid=764, mydir=/home/sasdemo);
*/