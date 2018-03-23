#BUILD_TARGETS=(ar71xx-generic ar71xx-nand brcm2708-bcm2708 brcm2708-bcm2709 mpc85xx-generic x86-generic x86-kvm_guest x86-64 x86-xen_domu)
BUILD_TARGETS=(ar71xx-generic)

currentVersion=0.38-beta.1

for target in ${BUILD_TARGETS[@]}; do
	echo -e "\e[31;1mBUILDING ${target}\e[0m"
	make GLUON_TARGET=${target} GLUON_RELEASE=${currentVersion} -j 10
done

exit 0

