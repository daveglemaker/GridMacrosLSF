# SAS Grid Manager for Platform LSF-CLI and SASGSUB Macros
           SAS version: SAS 9.4M4 SAS Grid Manager 

Usage and Setup in "SAS Grid and Gsub Macros 2018" powerpoint file

# Macros for the SAS User Role
- %mygsub %mygsubnight %mygsubpri 
- %gjobs and %gsstatus – reports on job status
- %gsresults – move job results to a different directory
- %gskill – terminate a gsub job

# Macros for the SAS Admin role
- %gjobsall, %gjobs – reports on job status of all users
- %bhosts – reports on Grid node status and number of jobs by machine
- %bqueues - reports on queue priority, status, and number of jobs by queue
- %lsload, %lsloadl, %lshosts – reports on Grid node resources
- %bacct and %bacctq – reports Grid history by user and/or queue
- %egoshl and %egoshv – reports EGO service list and individual services information


These macros are made available "as is" and disclaims any and all representations
and warranties, including without limitation, implied warranties of
merchantability, accuracy, and fitness for a particular purpose.