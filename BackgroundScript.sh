sudo mkdir /Volumes/efi && sudo mount -t msdos /dev/disk0s1 /Volumes/efi
cd /Volumes/efi/EFI/refind/rEFInd-minimal/
rm -R -f icons
cd /Volumes/efi/EFI/refind/rEFInd-minimal/bg/
declare -i lightCount=$(ls light |wc -l)
declare -i darkCount=$(ls dark |wc -l)
declare -i count=darkCount+lightCount
declare -i random=$[RANDOM%count]
declare -i iter=0
if((("$random" < "$lightCount")))

then
	cd /Volumes/EFI/EFI/refind/refind-minimal/bg/light
	for file in *.png
	do if((("$random" == "$iter"))); then cp $file /Volumes/EFI/EFI/refind/refind-minimal/background.png; fi
	iter=iter+1
	done

	cd /Volumes/efi/EFI/refind/rEFInd-minimal/
	cp -R icons-black icons
else
	random=random-lightCount
	iter=0
	cd /Volumes/EFI/EFI/refind/refind-minimal/bg/dark
	for file in *.png
	do if [ "$random" == "$iter" ]; then cp $file /Volumes/EFI/EFI/refind/refind-minimal/background.png; fi
	iter=iter+1
	done
	cd /Volumes/efi/EFI/refind/rEFInd-minimal/
	cp -R icons-white icons
fi
sudo diskutil unmount /dev/disk0s1