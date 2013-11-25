# transmission-cleanup-ds412

Automatically remove completed torrents from transmission using transmission-remote and cron.

Assumptions:

- You're on a `Synology DS412+` (NAS)
- You've installed findutils ([ipkg](http://forum.synology.com/wiki/index.php/Overview_on_modifying_the_Synology_Server,_bootstrap,_ipkg_etc) install findutils) for full versions of `find` & `xargs`

The script filters finished torrents from the list and removes any matching torrents.

## How to install

1. Place the script somewhere on your NAS. For example: `/usr/local/scripts/transmission-cleanup.sh`
2. Edit the `USER` and `PASS` variable within the script.
3. Check if the location to the `transmission-remote` is correct.
4. Setup a cron job to run the script periodically. For example:

```
vi /etc/crontab
7,22,37,52 * * * * root /usr/local/scripts/transmission-cleanup.sh 2>&1 > /dev/null # run every 15 minutes
```

Make sure to use tabs to delimited the columns, otherwise your cron job will be lost when you reboot your NAS.
