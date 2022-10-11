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
ONEDIR="OneDrive\ -\ University\ of\ Nebraska-Lincoln/_backups"

ATLASDIR=/Volumes/Atlas
ITACHIDIR=/Volumes/Itachi
JINCHUDIR=/Volumes/Jinchuriki/_backups


# ------------
# init backups
ATLAS="$JINCHUDIR"/Atlas_$TODAY.zip
ITACHI="$JINCHUDIR"/Itachi_$TODAY.zip

OLDATLAS="$HOME/$ONEDIR"/Atlas*
OLDITACHI="$HOME/$ONEDIR"/Itachi*


# ------------------------------------------------------------------------------
# test for connection to onedrive and compress the most reecent TIME LORD backup
eval test -d "$HOME/$ONEDIR" && zip -r -p -y $ATLAS $ATLASDIR
eval test -d "$HOME/$ONEDIR" && zip -r -p -y $ITACHI $ITACHIDIR


# ------------
# run the test
DIFFATLAS=$(eval diff -q --from-file $OLDATLAS $ATLAS)
DIFFITACHI=$(eval diff -q --from-file $OLDITACHI $ITACHI)

if [[ $DIFFATLAS ]]; then if eval test -f $OLDATLAS; then eval rm -rf $OLDATLAS && eval rsync -a $ATLAS "$HOME/$ONEDIR" && eval rm -rf $ATLAS; else eval rsync -a $ATLAS "$HOME/$ONEDIR" && eval rm -rf $ATLAS; fi; else eval rm -rf $ATLAS; fi

if [[ $DIFFITACHI ]]; then if eval test -f $OLDITACHI; then eval rm -rf $OLDITACHI && eval rsync -a $ITACHI "$HOME/$ONEDIR" && eval rm -rf $ITACHI; else eval rsync -a $ITACHI "$HOME/$ONEDIR" && eval rm -rf $ITACHI; fi; else eval rm -rf $ITACHI; fi
