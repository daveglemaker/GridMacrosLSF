/*******************************************************************************
            Macro name: gjobs
              Location: <SASCONFIGDIR>/LevN/SASApp/SASEnvironment/SASMacro
            Written by: Dave Glemaker, David.Glemaker@sas.com.
         Creation date: Jan 01 2017.
            As of date: April 08 2020.
           SAS version: SAS 9.4M4 SAS Grid Manager 
               Purpose: List Grid Job information for active user
                 Usage: %gjobs
            Parameters: none
   Optional Parameters: none
     Data sets created: work.jobs94
File Reference created: jobs94 
           Limitations:
                 Notes: requires xcmd turned on and LSF configured
               History: 04/08/2020 Dave Glemaker added Documentation
                        04/08/2020 Dave Glemaker added Disclaimer
     Sample Macro call: %gjobs
This macro is made available “as is” and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.
*******************************************************************************/
%macro gjobs;
options spool;

filename jobs94 pipe "bjobs -a -w";

data jobs94;

   infile jobs94 firstobs=2 dlm=" " truncover;

   length job_id $20. user $20. status $20. queue $20. sub_server $50. ex_server $50. jobname $80. month $30. day $30. time $30. 
          temp1 $30. temp2 $30. temp3 $30. temp4 $30. temp5 $30. temp6 $30. temp7 $30. temp8 $30. temp9 $30. temp10 $30. temp11 $30. temp12 $30.;

   input job_id $ user $ status $ queue $ sub_server $ ex_server $ jobname $ month $ day $ time $ 
         temp1 $ temp2 $ temp3 $ temp4 $ temp5 $ temp6 $ temp7 $ temp8 $ temp9 $ temp10 $ temp11 $ temp12 $;

   *if substr(sasgsub_job_status,1,1)="S" then delete;

   if temp12 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2)||trim(temp3)||trim(temp4)||trim(temp5)||trim(temp6)||trim(temp7)||trim(temp8)||trim(temp9);
      month=trim(temp10);
      day=trim(temp11);
      time=trim(temp12); 
   end; 
   else if temp11 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2)||trim(temp3)||trim(temp4)||trim(temp5)||trim(temp6)||trim(temp7)||trim(temp8);
      month=trim(temp9);
      day=trim(temp10);
      time=trim(temp11); 
   end;
   else if temp10 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2)||trim(temp3)||trim(temp4)||trim(temp5)||trim(temp6)||trim(temp7);
      month=trim(temp8);
      day=trim(temp9);
      time=trim(temp10); 
   end; 
   else if temp9 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2)||trim(temp3)||trim(temp4)||trim(temp5)||trim(temp6);
      month=trim(temp7);
      day=trim(temp8);
      time=trim(temp9); 
   end; 
   else if temp8 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2)||trim(temp3)||trim(temp4)||trim(temp5);
      month=trim(temp6);
      day=trim(temp7);
      time=trim(temp8); 
   end;
   else if temp7 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2)||trim(temp3)||trim(temp4);
      month=trim(temp5);
      day=trim(temp6);
      time=trim(temp7); 
   end;  
   else if temp6 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2)||trim(temp3);
      month=trim(temp4);
      day=trim(temp5);
      time=trim(temp6); 
   end;  
   else if temp5 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1)||trim(temp2);
      month=trim(temp3);
      day=trim(temp4);
      time=trim(temp5); 
   end;  
   else if temp4 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time)||trim(temp1);
      month=trim(temp2);
      day=trim(temp3);
      time=trim(temp4); 
   end;   
   else if temp3 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day)||trim(time);
      month=trim(temp1);
      day=trim(temp2);
      time=trim(temp3); 
   end;   
   else if temp2 ne " " then do; 
      jobname=trim(jobname)||trim(month)||trim(day);
      month=trim(time);
      day=trim(temp1);
      time=trim(temp2); 
   end; 
   else if temp1 ne " " then do; 
      jobname=trim(jobname)||trim(month);
      month=trim(day);
      day=trim(time);
      time=trim(temp1); 
   end; 
run;

title "My Grid Jobs Today";
&fn footnote '<img title="PoweredBySAS-ColorHorizontal" class="cq-dd-image" alt="PoweredBySAS-ColorHorizontal" src="https://brand.sas.com/en/home/our-identity/visual-elements/logo/_jcr_content/par/styledcontainer_1011938127/par/image_2006980209.img.png/1549480759537.png">';
proc print data=jobs94;

var job_id user status queue sub_server ex_server jobname month day time;
run;

title;footnote;

options nospool;

%mend gjobs;

