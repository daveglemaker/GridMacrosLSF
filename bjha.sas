%macro bjha(user=%sysget(USER));
filename bjobsla pipe "bjobs -l -u &user -a";
data bjobsla(keep=jobid cputime status);
   retain jobid;
   format  jobid $10. var1 $50. var2 $50. var3 $50. var4 $50. var5 $50. var6 $30. var7 $50. 
           var8 $50. var9 $50. var10 $50. var11 $50. var12 $50. var13 $50. var14 $50. var15 $50. temp 10. status $6.;
   infile bjobsla delimiter=" " truncover;
   input var1 var2 var3 var4 var5 var6 var7 var8 var9 var10 var11 var12 var13 var14 var15;
   if substr(var2,1,1)="<" and substr(var1,1,3)="Job" then do; 
      jobid=compress(substr(var2,2),",>");
   end;
   else if substr(var2,1,3)="CPU" then do; 
      temp=compress(substr(var6,1));
      cputime=sum(0,temp);
      status="RUN";
      output;
   end;
   else if substr(var5,1,4)="Done" then do; 
      temp=compress(substr(var12,1));
      cputime=sum(0,temp);
      status="DONE";
      output;
   end;
   else if substr(var5,1,6)="Exited" then do; 
      temp=compress(substr(var15,1));
      cputime=sum(0,temp);
      status="EXITED";
      output;
   end;
run;
proc sort data=bjobsla;
   by jobid;
run;

filename bhista pipe "bhist -u &user -a";
data bhista(keep=jobid runtime);
   format  jobid $10. var1 $50. var2 $50. var3 $50. var4 $50. var5 $50. var6 $30.;
   infile bhista delimiter=" " truncover;
   input var1 var2 var3 var4 var5 var6;
   if _n_>2 and var1 ne " ";
   jobid=compress(var1);
   runtime=sum(0,var6);
run; 
proc sort data=bhista;
   by jobid;
run; 
data bjha;
   merge bjobsla(in=a) bhista(in=b); 
   by jobid;
   if a and b;  
run;
proc sort data=bjha;
   by status jobid;
run;
data bjha;
   set bjha; format hog percent12.2;
   hog=cputime/runtime;
run;
title "&user Runtime by JOBID";
proc print data=bjha;
run;
%mend bjha;
