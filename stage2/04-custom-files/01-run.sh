on_chroot << EOF
echo "Changing to pi home dir"
cd /home/pi
echo "Cloning zcash-nodejs"
git clone https://github.com/dorky-handler/zcash-nodejs
chmod ugo+rwx zcash-nodejs
cd zcash-nodejs
sudo chown -R pi /home/pi/zcash-nodejs
echo "installing npm packages"
npm install
echo "downloading zcashd"
curl -o zcashd https://update.zcash.nodecipher.com/zcashd-5.9.1
chmod +x zcashd
chown pi db
echo "Setting up zcashnode.service"
install -m 644 zcashnode.service /etc/systemd/system
systemctl enable zcashnode
EOF
