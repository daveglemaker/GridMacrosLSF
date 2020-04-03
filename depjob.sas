%macro depjob(depjob);
 %if &sysrc=0 %then
    %mygsub(&depjob);
 %else %put WARNING:  &depjob not run due to previous rc=&sysrc;
%mend depjob;
