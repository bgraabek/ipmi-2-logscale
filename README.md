# ipmi-2-logscale
Pull IPMI sensor data, send to and visualise it in CrowdStrike Falcon LogScale

* Import the parser and dashboard in a Falcon LogScale repository
* Install 'ipmi-sensors' package on a Linux host
* Download and configure the 'ipmi2logscale.sh' script
* Run the script every 5 minutes (or whatever interval you want) via a cron job
