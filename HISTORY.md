# HISTORY for simplebackup

## 1.1.0 / 2023-02-12

* add option --default-to-etc-config-if-root
  * allows systemd unit to use /etc/simplebackup.conf for system-wide
    backup and ~/.simplebackup.conf for user-specific backups
* remove templated systemd units
  * user-specific instances can already be created from the plain units

## 1.0.4 / 2023-01-27

* tune timings in systemd units
  * don't run on every reboot, only when a scheduled time was missed
  * don't clash with DST time changes

## 1.0.3 / 2023-01-26

* include missing files in distribution tarball

## 1.0.2 / 2023-01-26

* update systemd service and timer units
  * add templates for user-specific instances

## 1.0.1 / 2023-01-17

* include example systemd service and timer units
* example configuration:
  * expire old backups using expirebackups

## 1.0.0 / 2022-01-23

* Don't move $WORKDIR to $TARGETDIR but create the archive from a
  subdirectory of $WORKDIR instead.  This skips an unneccessary
  full copy if $WORKDIR and $TARGETDIR are on different filesystems.
  Also the free space needed on $TARGETDIR is reduced.

  !! Because of the additional subdirectory involved, $WORKDIR will  
  !! not be the original value that you have set in your  
  !! configuration.  This might be incompatible if your configuration  
  !! does not use the $WORKDIR variable but hardcoded paths.  Please  
  !! check your scripts!

* expirebackups(1) can scan different file extensions which is useful
  if you use alternative archive formats as introduced in v0.3.0.
  The default is .tar.bz2 like before.

## 0.3.0 / 2021-11-01

* allow selection of different archive and compression utilities
* example configuration:
  * document archive and compression utility selection
  * generate sha256 checksums
  * add /var/lib/mailman3 to BACKUPDIRS
  * automatically determine MySQL/MariaDB databases to dump
  * fix table locking with MySQL/MariaDB

## 0.2.0 / 2019-06-24

* add DIRSTATS option to show statistics about processed directories
* example configuration:
  * fix e2fs superblock dumping
  * better code to backup mbr and bootsectors
  * add dumping of table descriptions to mysqldump call
  * backup RAID information
  * backup harddisk serial numbers
  * backup LVM configuration
  * add /var/lib/apt to BACKUPDIRS
  * remove apt package lists from backup

## 0.1.6 / 2011-04-10

* example configuration:
  * fix mutt invocation

## 0.1.5 / 2011-04-02

* show general errors on script abort
* example configuration:
  * fix e2fs superblock backup
  * add /var/lib/cyrus and /var/spool/cyrus to BACKUPDIRS

## 0.1.4 / 2009-08-13

* bugfix: check both BACKUPDIRS and BACKUPDIRS_ONEFS on startup
* example configuration: add /var/spool/uptimed to BACKUPDIRS

## 0.1.3 / 2009-05-17

* bugfix: sanitize configuration variables
* bugfix: describe SILENT option in manpage
* optionally don't cross filesystem borders (BACKUPDIRS_ONEFS)
* example configuration: don't use sent-Folder with mutt

## 0.1.2 / 2009-01-30

* add SILENT option
* add Debian firmware locations to configuration file
* add more examples to configuration file
* trap errors and remove LOCKFILE on error

## 0.1.1 / 2007-05-13

* don't make archive world-readable during creation

## 0.1.0 / 2006-12-10

* add keep_this_many parameter to expirebackups

## 0.0.9 / 2006-07-30

* provide postcopy() hook to execute commands after copying, but
  before archiving
* fix error checking on $LOCKFILE and $NAME
* work without $LOCKFILE, but warn about it
* fix error in example configuration (empty functions)

## 0.0.8 / 2005-12-02

* provide postbackup() hook to execute commands after backup
* check configuration
* don't let extracommands() mess with our environment

## 0.0.7 / 2005-05-30

* fix problems with tar-1.15.1

## 0.0.6 / 2004-11-09

* fix expirebackup sorting for more than one backup per month

## 0.0.5 / 2004-07-05

* allow $CHROOT operation

## 0.0.4 / 2004-07-04

* print a message when $BACKUPDIRS contains non-existing paths

## 0.0.3 / 2004-06-28

* rename $PATHS to $BACKUPDIRS
* supress renice(1) output
* print paths and filenames in expirebackups
* remove bogus BUGS section from simplebackup.conf(5)

## 0.0.2 / 2004-06-27

* change PATHS separator to :

## 0.0.1 / 2004-06-27

* first release
