~!/bin/bash

# --
# backing up the TARDUS to OneDrive
# --
# I decided not to backup the TARDIS backups and the Jinchuriki.

## The TARDIS backups do not have much value, and the Jinchuriki
## are too large, and also not much value since the scripts and
## the raw data are backed up and safe.


# --------
# get date
TODAY=$(date '+%Y-%m-%d')


# -------------
# init dir vars
ONEDIR=~/OneDrive\ -\ University\ of\ Nebraska-Lincoln/_backups

ATLASDIR=/Volumes/Atlas
ITACHIDIR=/Volumes/Itachi
JINCHUDIR=/Volumes/Jinchuriki/_backups


# ------------
# init backups
ATLAS="$JINCHUDIR"/Atlas_$TODAY.zip
ITACHI="$JINCHUDIR"/Itachi_$TODAY.zip

OLDATLAS=$(ls "$ONEDIR"/Atlas*)
OLDITACHI=$(ls "$ONEDIR"/Itachi*)


# ------------------------------------------------------------------------------
# test for connection to onedrive and compress the most reecent TIME LORD backup
test -d "$ONEDIR" && zip -r -p -y $ATLAS "$ATLASDIR" 
test -d "$ONEDIR" && zip -r -p -y $ITACHI "$ITACHIDIR"


# ------------
# run the test
DIFFATLAS=$(diff -q --from-file $OLDATLAS "$JINCHUDIR"/Atlas_$TODAY.zip)
DIFFITACHI=$(diff -q --from-file $OLDITACHI "$JINCHUDIR"/Itachi_$TODAY.zip)

if [[ $DIFFATLAS ]]; then if test -f "$OLDATLAS"; then rm -rf "$OLDATLAS" && rsync -a "$ATLAS" "$ONEDIR" && rm -rf "$ATLAS"; else rsync -a "$ATLAS" "$ONEDIR" && rm -rf "$ATLAS"; fi; else rm -rf "$ATLAS"; fi

if [[ $DIFFITACHI ]]; then if test -f "$OLDATLAS"; then rm -rf "$OLDITACHI" && rsync -a "$ITACHI" "$ONEDIR" && rm -rf "$ITACHI"; else rsync -a "$ITACHI" "$ONEDIR" && rm -rf "$ITACHI"; fi; else rm -rf "$ITACHI"; fi
