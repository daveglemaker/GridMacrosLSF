%macro smygsub(mypgm=, que=normal);

options linesize=max ;

filename cmdout pipe "&gsconfigdir./sasgsub -gridsubmitpgm &mypgm -gridjobopts queue=&que" LRECL=2000;

data _null_ ;
  infile cmdout;
  input;
  file print notitles;
  if _n_ = 1 then put "My SASGSUB Job";
  put _infile_;
run;

%mend smygsub;

/*
%mygsub(mypgm=/home/sasdemo/sleep30.sas, que=normal);
%mygsub(mypgm=/home/sasdemo/sleep30.sas, que=priority);
%mygsub(mypgm=/home/sasdemo/sleep30.sas, que=night);
*/