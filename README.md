Make it executable by type in cmdline :

chmod +x checklan.sh

As root or using sudo, move the file to /usr/local/bin :

mv checklan.sh /usr/local/bin

Using sudo or root, open a new file in /etc/cron.d

sudo crontab -e

*/10 * * * * root /usr/local/bin/checklan.sh

Then the script should run every 10 mins. NOTE: Please read on the Internet about cron to understand syntax. You can increase rate up to every min.

Check /var/log/messages or /var/log/syslog to see if it is working:

tail -f /var/log/messages

If it works you will see something like this:

Apr  1 20:04:01 <hostname> logger: checklan OK
