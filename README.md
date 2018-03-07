## WARNING THIS PACKAGE IS IN ALPHA STATE! DO NOT USE FOR PRODUCTION!

**Known Problems:**  sometimes error during update but Update works nevertheless.

## synology-gitlab
https://hub.docker.com/r/sameersbn/gitlab/
https://hub.docker.com/r/sameersbn/postgresql/

This is an upgraded and improved GitLab package which is based on the original Synology Package from [Synology Repo](https://www.synology.com/de-de/dsm/packages/Docker-GitLab). 

**Download latest SPK**: [here](https://github.com/jboxberger/synology-gitlab/releases)  
 
## New since 10.1.1
- All-In-One Installer
- Backup/Restore scripts
- restore custom ENVIRONMENT variables after update (any variable not in scripts/env_ignore)
- Use PostgreSQL instead of MariaDB
- SSL (SELF SIGNED) Out of the Box
 
## Supported Architectures
**x86 avoton bromolow cedarview braswell kvmx64 broadwell apollolake**  
Since i can't test all architectures i had to make a choice which i can cover or which i expect to work. If your architecture is not in this list so please feel free to contact me and we can give it a try.  

You can check the architecture of your device [here](https://github.com/SynoCommunity/spksrc/wiki/Architecture-per-Synology-model) 
or [here](https://www.synology.com/en-us/knowledgebase/DSM/tutorial/General/What_kind_of_CPU_does_my_NAS_have).

# Backup
```
# backup files will be saved in docker/backup directory
# the backup contains the config files including !PASSWORDS! be shure to keep them in an safe place!

sudo ./var/packages/synology-gitlab-jboxberger/scripts/backup	
```
# Restore
```
# restoring to a mismatched GitLab Version (e.g. 10.1.4 backup file to 9.4.4 GitLab) my cause problems
# i highly reccommend to restore only matching backup and GitLab versions.
  
sudo ./var/packages/synology-gitlab-jboxberger/scripts/restore --restore-file "2018-02-23-00-31-24-gitlab-10.4.2.tar.gz"
```

# Updates
**Always backup data before update! _Please be patient during the Update process_**.   
The first docker container boot up - after installation/update - takes some minutes because GitLab needs to migrate the Database first, you can see the status in the GitLab container log (DSM docker backend). The Update is complete when the CPU begins to idle.    

#### DSM 6.1.4-15217 
| Prev. Version | New Version | Status             |
|---------------|-------------|--------------------|
| 10.1.4        | 10.2.5      | ok                 |
| 10.2.5        | 10.3.6      | ok                 |
| 10.3.6        | 10.4.1      | ok                 |
| 10.4.1        | 10.4.2      | ok                 |
| 10.4.2        | 10.5.1      | ok                 |
