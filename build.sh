FFMUC_REPO=https://github.com/T0biii/site-ffm.git
FFMUC_VERSION=T0biii-test-for-docker

git clone $FFMUC_REPO site-ffm
cd site-ffm 
git checkout -b patched && git checkout $FFMUC_VERSION
make
