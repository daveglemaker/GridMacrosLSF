/*******************************************************************************
            Macro name: gsresults
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager 
               Purpose: List Grid Job information for active user
                 Usage: %gsresults
            Parameters: none
   Optional Parameters: none
     Data sets created: work.results
File Reference created: results
           Limitations:
                 Notes: requires xcmd on and sasgsub configured on gridnodes 
                        requires authinfo file to reside in users home directory
                        requires &gsconfigdir to be set in autoexec or pre-code
                        .../Lev1/Applications/SASGridManagerClientUtility/9.4
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %gsresults or %gsresults(jobid)
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro gsresults(jobid=all, mydir=c:\sas\grpb\bstuff);
options spool;
 filename results pipe "&gsconfigdir./sasgsub -gridgetresults &jobid -gridresultsdir &mydir";
data results;
   infile results dlm="," missover truncover;
   length Result_Status $100. Start $100. End $100. RC $10.;
   input Result_Status Start End RC;
   if substr(Result_Status,1,1) in ("S","C"," ") then delete;
run;
title "Move Results JobID &jobid to &mydir";
proc print data=results;
  var Result_Status ;
run;
options nospool;
%mend gsresults;

