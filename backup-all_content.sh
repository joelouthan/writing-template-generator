#! /bin/bash
# Daily Backup Domains
# Joseph Louthan
# Oct 2013
# Version 2.00

#set -xv; exec 1>>/tmp/out 2>&1
#set -x

TIMESTAMP=$(date +%Y%m%d.%H%M)
HOMEDIR="/home/30373/users/.home"
BACKUPDIR="$HOMEDIR/data/backups"
DOMAINDIR="$HOMEDIR/domains"
DATADIR="$HOMEDIR/data"
MYSQL_USER="DB_USERNAME"
MYSQL=/usr/bin/mysql
MYSQL_PASSWORD="DB_PASSWORD"
MYSQL_HOST="DB_HOSTNAME"
MYSQLDUMP=/usr/bin/mysqldump
EMAILADDY=joe@theologic.us
export GZIP=-9

mkdir -p "$BACKUPDIR/mysql"

databases=`$MYSQL --host=$MYSQL_HOST --user=$MYSQL_USER -p$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema)"`

for db in $databases; do
  $MYSQLDUMP --force --opt --host=$MYSQL_HOST --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | gzip > "$BACKUPDIR/mysql/$db.gz"
done

### Backup all content
tar -czpf $BACKUPDIR/backup-all-content_dbs-"$TIMESTAMP".tar.gz $DOMAINDIR/* $BACKUPDIR/mysql

### Cleanup
/usr/bin/find $BACKUPDIR -type f -mtime +4 -exec rm -f "{}" \;
/usr/bin/find $DOMAINDIR/theologic.us/html/discs -type f -mtime +10 -exec rm -f "{}" \;

### Email the results ###
PATH=/bin:/usr/bin:/sbin:/usr/sbin export PATH
LOGS="$DATADIR/logs.txt"
echo "To: joelouthan@gmail.com" > $LOGS
echo "From: C101 Server at MediaTemple <joe@theologic.us>" >> $LOGS
echo "Subject: theologicus Backup Report" - "$(date +%Y%m%d.%H%M)" >> $LOGS
echo "All web content at $(hostname) has been successfully backed up." >> $LOGS
echo "and will be available for seven days. After seven days, the archive" >> $LOGS
echo "will be deleted." >> $LOGS
echo "" >> $LOGS
echo "The backup files available are:" >> $LOGS
echo "$(ls -1sh $BACKUPDIR)" >> $LOGS
cat $LOGS | sendmail -f $EMAILADDY  -t
rm -rf $LOGS