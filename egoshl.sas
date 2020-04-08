/*******************************************************************************
            Macro name: egoshl
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: Reports EGO services list  
                 Usage: %egoshl
            Parameters: none
   Optional Parameters: none
     Data sets created: work.egoshl
File Reference created: egoshl
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %egoshl
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro egoshl;
options spool;
filename egoshl pipe "egosh service list -l";
data egoshl;
   infile egoshl firstobs=2 missover;
   length SERVICE $20. STATE  $20. ALLOC $20. CONSUMER $20. RGROUP $20. RESOURCE $20. SLOTS $20. SEQ_NO $20. INST_STATE $20.  ACTI $20.;
   input @1 SERVICE $ @24 STATE $ @37 ALLOC $ @43 CONSUMER $ @66 RGROUP $ @89 RESOURCE $ @112 SLOTS $ @120 SEQ_NO $ @128 INST_STATE $ @141 ACTI $ ;
if service in ("res" "sbatchd") then delete;
if service = state then delete;
run;
title "My EGO Controlled Services";
proc print data=egoshl;
   var service resource state inst_state;
run;
title;
options nospool;
%mend egoshl;

