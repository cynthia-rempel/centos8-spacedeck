# centos8-spacedeck
My notes for installing spacedeck-open on Centos 8

## Installing packages

The following packages are required:

```
yum install -y git \
    nodejs \
    epel-release

yum install -y GraphicsMagick
```

Spacedeck-Open depends on puppeteer which will not install for the root user, so a non-root user must be created:

```
useradd spacedeck
# not 100% sure spacedeck needs sudo
usermod -aG wheel spacedeck
su spacedeck
# as the spacedeck user run the following:
cd /home/spacedeck
git clone https://github.com/spacedeck/spacedeck-open.git
cd spacedeck
npm install
node spacedeck.js
```

## Verifying the Spacedeck Install
1. Browse to to http://localhost:9666
2. enter a username / password
3. the beta-invite code is in config/default.json, and is *top-sekrit* by default

## Making spacedeck start automatically on reboot

```
sudo bash
vi /etc/systemd/system/spacedeck.service
# copy the contents of https://github.com/cynthia-rempel/centos8-spacedeck/blob/main/spacedeck.service into /etc/systemd/system/spacedeck.service
systemctl enable --now spacedeck.service
```
