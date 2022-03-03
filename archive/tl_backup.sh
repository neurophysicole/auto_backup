~!/bin/bash

# --
# backing up the TIME LORD (TIME MACHINE) to OneDrive
# --


# test for connection to onedrive and compress the most reecent TIME LORD backup
test -d ~/OneDrive\ -\ University\ of\ Nebraska-Lincoln && BDIR=$(ls -td /Volumes/TIME\ LORD/Backups/backupdb/donbot/*/ | head -1)


# compress into TIME LORD in OneDrive
zip ~/OneDrive\ -\ University\ of\ Nebraska-Lincoln/timelord_backup.zip $BDIR
