/*******************************************************************************
            Macro name: lsloadl
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 18 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager
               Purpose: List Grid Host with thier loads
                 Usage: %lsloadl
            Parameters: none
   Optional Parameters: none
     Data sets created: work.lsload 
File Reference created: lsloadl
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %lsloadl
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*********************************************************************************/
%macro lsloadl;
options spool;
filename lsload pipe "lsload -l";
data lsload;
   infile lsload firstobs=2 dlm=" ";
   length HostName $20. Status $20. r15s $20. r1m $20. r15m $20. CPU_utilization $20. pg $20. io $20. ls $20. it $20. tmp $20. swp $20. mem $20.  psw $20. ;
   format pswn comma20.;
   input HostName $ Status $ r15s $ r1m $ r15m $ CPU_utilization $ pg $  io $ ls $ it $ tmp $ swp $ mem $  psw $;
   pswn=compress(psw);
   label CPU_utilization="CPU Utilization"
      io = "Disk IO kbps"
      mem="Memory Available"
      pswn="SASWork Available";
run;
title "lsload Listing";
proc print data=lsload label;
   var HostName Status r15s r1m r15m CPU_utilization pg io ls it  tmp  swp  mem pswn;
run;
title;
options nospool;
%mend lsloadl;

