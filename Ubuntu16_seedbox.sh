
sudo -i;

screen -S installsbox;

bash -c "$(wget --no-check-certificate -qO - https://raw.githubusercontent.com/arakasi72/rtinst/master/rtsetup)";sed -i "s/rtorrentrel=''/rtorrentrel='0.9.4'/g" /usr/local/bin/rtinst;sed -i 's/ask_user && return 0/return 0/g' /usr/local/bin/rtinst;sed -i 's/webpass=$(set_pass)/webpass="wilywx.com"/g' /usr/local/bin/rtinst;echo "1. Now install rTorrent.......................";rtinst;sed -i '/Port/c Port 22122' /etc/ssh/sshd_config;service ssh restart;/etc/init.d/vsftpd stop;sed -i 's/ssl_enable=YES/ssl_enable=NO/g' /etc/vsftpd.conf;sed -i '/listen_port/c listen_port=21' /etc/vsftpd.conf;sed -i '/listen_port=21/a\local_root=\/var\/www\/downloads' /etc/vsftpd.conf;echo "pasv_min_port=20000" >> /etc/vsftpd.conf;echo "pasv_max_port=20010" >> /etc/vsftpd.conf;sleep 1;/etc/init.d/vsftpd start;sed -i '/location \/ {/a\               include \/etc\/nginx\/conf.d\/cache\;' /etc/nginx/sites-enabled/default;sed -i '/location \/ {/a\               include \/etc\/nginx\/conf.d\/php\;' /etc/nginx/sites-enabled/default;sed -i 's/index index.html index.php index.htm/index index.html index.php index.htm \/_h5ai\/public\/index.php/g' /etc/nginx/sites-enabled/default;service nginx restart;apt-get install -y unrar vim;mkdir -p /var/www/downloads/rutorrent;chown -R seedbox:seedbox /var/www/downloads/rutorrent;chmod -R 777 /var/www/downloads/rutorrent;rm -rf /home/seedbox/.rtorrent.rc;wget -O /home/seedbox/.rtorrent.rc http://file.wilywx.com/rtorrent.ubuntu.config;sed -i "s/\/home\/seedbox/\/var\/www\/downloads\/rutorrent/g" /var/www/rutorrent/conf/users/seedbox/config.php;sed -i "s/\/root/\/var\/www\/downloads\/rutorrent/g" /var/www/rutorrent/conf/users/root/config.php;cd /var/www/;wget http://file.wilywx.com/seedbox_web_ubuntu.zip;unzip -o seedbox_web_ubuntu.zip;rm -rf seedbox_web_ubuntu.zip;rm -rf index.html;sed -i "s/ens18/eno1/g" /var/www/index.php;mkdir -p /var/www/downloads/;chown -R www-data:www-data /var/www;chmod 755 /var/www/;chmod -R 777 /var/www/downloads/;echo "* * * * * root chmod -R 777 /var/www/downloads/" >> /etc/crontab;cat /etc/crontab;echo "2. Now install transmission.......................";apt-get install transmission-daemon unzip -y;/etc/init.d/transmission-daemon stop;rm -rf settings.json;rm -rf /var/lib/transmission-daemon/info/settings.json;wget -O /var/lib/transmission-daemon/info/settings.json http://file.wilywx.com/settings.transmission.ubuntu.json;sed -i "/rpc-username/c \ \ \ \ \"rpc-username\": \"seedbox\"," /var/lib/transmission-daemon/info/settings.json;mkdir -p /var/www/downloads/transmission/;chmod g+w /var/www/downloads/transmission/;chmod -R 777 /var/www/downloads/transmission/;cd /usr/share/transmission/;rm -rf transmission_web_cn.zip;wget http://file.wilywx.com/transmission_web_cn.zip;unzip -o transmission_web_cn.zip;rm -rf transmission_web_cn.zip;rm -rf transmission_web_cn.html;wget -c http://file.wilywx.com/transmission_web_cn.html;rm -rf /usr/share/transmission/web/index.original.html;mv -f transmission_web_cn.html /usr/share/transmission/web/index.original.html;/etc/init.d/transmission-daemon start;"3. Now install flexget.......................";apt install -y python-pip;pip install flexget transmissionrpc;"4. Now install Deluge.......................";add-apt-repository -y ppa:deluge-team/ppa;apt-get update;apt-get install -y deluged deluge-web;mkdir -p /var/www/downloads/deluge/;deluged;deluge-web -f;sleep 5;eval $(ps x|grep deluge |awk '{print "kill -9 "$1";"}');wget -O /root/.config/deluge/core.conf http://file.wilywx.com/deluge_config_core_ubuntu.conf;wget -O /root/.config/deluge/core.conf~ http://file.wilywx.com/deluge_config_core_ubuntu.conf;cd /usr/lib/python2.7/dist-packages/deluge/ui/web/;wget http://file.wilywx.com/deluge_web_ha.zip;unzip -o deluge_web_ha.zip;sed -i "1 a\\/usr\/bin\/sudo deluge-web -f" /etc/rc.local;sed -i "1 a\\/usr\/bin\/sudo deluged" /etc/rc.local;deluged;deluge-web -f;"5. Now install qBittorrent.......................";add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable;apt-get update;apt-get -y install screen qbittorrent-nox;rm -rf /etc/init.d/qbittorrent;wget -O /etc/init.d/qbittorrent http://file.wilywx.com/qbittorrent-nox_init.txt;chmod 755 /etc/init.d/qbittorrent;chown root:root /etc/init.d/qbittorrent;update-rc.d qbittorrent defaults;mkdir -p /var/www/downloads/qbittorrent/;mkdir -p /var/www/downloads/qbittorrent/torrent_files/;chmod -R 777 /var/www/downloads/qbittorrent/;wget -O /home/seedbox/.config/qBittorrent/qBittorrent.conf http://file.wilywx.com/qBittorrent.conf;reboot;



eval $(ps x|grep qbittorrent |awk '{print "kill -9 "$1";"}');wget -O /home/seedbox/.config/qBittorrent/qBittorrent.conf http://file.wilywx.com/qBittorrent.conf;screen -A -m -d -S qb qbittorrent-nox;ps aux | grep qbittorrent;



sed -i "s/ens18/eth0/g" /var/www/index.php;sed -i "s/eno1/eth0/g" /var/www/index.php;




ls -lthF


find /var/www/downloads/rutorrent/ -mtime +6 -name '*' -exec rm -rf {} \;










apt-get install -y zlib1g:i386 unzip;mkdir -p /www/xunlei/;rm -rf /www/xunlei/*;cd /www/xunlei/;rm -rf Xware1.0.31_x86_32_glibc.zip;wget https://github.com/prozyy/Xware/raw/master/software/Xware1.0.31_x86_32_glibc.zip;unzip Xware1.0.31_x86_32_glibc.zip;rm -rf Xware1.0.31_x86_32_glibc.zip;



mkdir -p /mnt/xunlei;mkdir -p /var/www/downloads/xunlei;chmod 0777 /mnt/xunlei;chmod 0777 /var/www/downloads/xunlei;mount --bind /var/www/downloads/xunlei/ /mnt/xunlei;chmod -R 777 /www/xunlei/;


rm -rf /www/xunlei/xunlei_portal.tmp;/www/xunlei/portal



