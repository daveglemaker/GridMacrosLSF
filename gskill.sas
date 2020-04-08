/*******************************************************************************
            Macro name: gskill
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: Kills Grid job of jobid provided and List the status
                        of the kill command for that jobid
                 Usage: %gskill(jobid)
            Parameters: jobid=numeric Grid Job ID or IDs
   Optional Parameters: none
     Data sets created: work.kill
File Reference created: kill
           Limitations:
                 Notes: requires xcmd turned on and grid client CLI configured
                        requires authinfo file to reside in users home directory
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %gskill(1789)
                        %gskill(1789 1790) 
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*******************************************************************************/
%macro gskill(jobid=0000);
options spool;
filename kill pipe "&gsconfigdir./sasgsub -gridkilljob &jobid";
data kill;
   infile kill;
   input Kill_Status $200.;
   if substr(Kill_Status,1,1)="S" then delete;
run;
title "Kill JobID &jobid Status";
proc print data=kill;
run;
options nospool;
%mend gskill;

