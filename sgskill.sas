%macro sgskill(jobid=0000);

options linesize=max ;

filename cmdout pipe "&gsconfigdir./sasgsub -gridkilljob &jobid" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "Kill JobID &jobid Status";
  put _infile_;
run;

%mend sgskill;

/*
%gskill(jobid=758);
*/