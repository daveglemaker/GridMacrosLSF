/*******************************************************************************
            Macro name: mygsubnight
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager 
               Purpose: Submit a sas program with sasgsub to the night queue and 
                        List Grid Job information for that job
                 Usage: %mygsubnight(mypgm)
            Parameters: mypgm=fully qualified path and filename of sas program
   Optional Parameters: none
     Data sets created: work.mygsubjob
File Reference created: results
           Limitations:
                 Notes: requires xcmd on and sasgsub configured on gridnodes 
                        requires authinfo file to reside in users home directory
                        requires &gsconfigdir to be set in autoexec or pre-code
                        .../Lev1/Applications/SASGridManagerClientUtility/9.4
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %mygsubnight(/myshared_dir/pgms/sleep1.sas)
This macro is made available â€œas isâ€ and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*******************************************************************************/
%macro mygsubnight(mypgm);
options spool;
filename results pipe "&gsconfigdir./sasgsub -gridsubmitpgm &mypgm -gridjobopts queue=night";
data mygsubjob;
   infile results dlm=":" missover truncover;
   length Job $200. Info $200. ;
   input Job Info;
   if substr(job,1,1) not in ("J") then delete;
run;
title "My SASGSUB Jobs";
proc print data=mygsubjob; where info ne " ";
run;
options nospool;
%mend mygsubnight;
