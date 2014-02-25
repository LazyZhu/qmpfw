#!/bin/bash

# This is a dummy script to be used with crontab for nighly compilations and so.
# Not recommended to use in a read/write development environment.
#
# Example of usage:
# FORCE="1" TARGETS="alix rspro" COMMUNITY="myNet" BRANCH="testing" ./nightlycompile.sh
# 

# Mail to send alerts in case something goes wrong
MAIL="admin@qmp.cat"

# In the output directory, files older than this will be removed
DAYS_TO_PRESERVE="10"

COMMUNITY=${COMMUNITY:-qMp}
BRANCH=${BRANCH:-testing}

# If target is not specified, compiling for all targets
TARGETS=${TARGETS:-$(make list_targets)}

# Targets which are not gonna be compiled
NOTARGETS=${NOTARGETS:-}

# Extra packages (separated by spaces)
EXTRA_PACKS=${EXTRA_PACKS:-}

# If $FORCE is not set, then not forced by default
[ -z "$FORCE" ] && FORCE=0

# If no "IMAGES" file is supossed there are no binary images compiled, then force to compile
[ ! -f "images/IMAGES" ] && FORCE=1

# Check if it is up to date
make is_up_to_date QMP_GIT_BRANCH=$BRANCH >& /dev/null
[ $? -ne 0 ] && make update_all

# Date of the last commit
LAST_COMMIT_DATE=$(cd build/qmp && git log -1 origin/${BRANCH} --format="%ct")


(cd build/qmp && git checkout $BRANCH)

for t in $TARGETS; do
	[[ "$NOTARGETS" =~ "$t" ]] && echo "Ignoring target $t. Not compiling." && continue
	# If not forced, check if there is already compiled an image for the target with the last commit
	[ $FORCE -ne 1 ] && [ -f "images/IMAGES" ] && {
		TARGET_NAME=$(make target_name T=$t)
		[ -z "$TARGET_NAME" ] && echo "Target $t unavailable. Not compiling." && continue
		IMAGE_DATE=$(cat images/IMAGES | egrep "${TARGET_NAME}.*${COMMUNITY}_" | awk '{print $2}' | awk -F\- '{print $NF}' | sort -n -r | awk NR==1 | cut -d "." -f1 | sed s/_/\ /)
		[ ! -z "$IMAGE_DATE" ] && {
			IMAGE_DATE=$(date -d "${IMAGE_DATE}" +%s)
			[ $IMAGE_DATE -ge $LAST_COMMIT_DATE ] && echo "qMp for target $t in last version." && continue
		}
	}

	echo "Compiling target $t"
	nice -n 25 make T=$t build J=2 QMP_GIT_BRANCH=$BRANCH COMMUNITY=$COMMUNITY EXTRA_PACKS=$EXTRA_PACKS
	[ $? -ne 0 ] && [ ! -z "$MAIL" ] && echo "Error detected during QMP compilation process (for target $t)" | mail -s "[qMp] build system" $MAIL && ./scripts/extra-packages.script POST_BUILD "ar71xx" $t $EXTRA_PACKS
done

exit 0
[ $DAYS_TO_PRESERVE -gt 0 ] && find images/ -iname "*.bin" -type f -mtime +$DAYS_TO_PRESERVE -exec rm -f '{}' \;

(cd images && md5sum *.bin > IMAGES)

