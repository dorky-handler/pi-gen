#!/bin/bash -e


cd /home/user
#rm -r zcash
git clone https://github.com/zcash/zcash.git
cd zcash
git checkout v5.3.0
./zcutil/fetch-params.sh
./zcutil/clean.sh
./zcutil/build.sh V=1 -j$(nproc)
