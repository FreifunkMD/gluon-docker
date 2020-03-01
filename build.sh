FFMUC_REPO=https://github.com/freifunkMUC/site-ffm.git
FFMUC_VERSION=experimental

git clone $FFMUC_REPO site-ffm
cd site-ffm
git checkout -b patched && git checkout $FFMUC_VERSION
make
