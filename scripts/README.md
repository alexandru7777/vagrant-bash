In order for the scripts to run, there must be an already existing user
on the system named "devops", that has sudo permissions, and that there is
direct ssh connection between the host and the remote machines.

The webdeploy script is first executed so that it will connect the host
and deploy the script, which will set up website with a template in HTML
By accessing the IP, at the end of the process, a webite should be visible.


