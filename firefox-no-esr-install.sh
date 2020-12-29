#!/bin/bash

      ######### Dr.Redfish Shell Firefox non ESR ######
      #                                               #  
      #   this installer is provide for debian 10     #
      #       buster version stable in french         #
      #	 Thanks to the author for the great tutorial  #	
      #		      find the link at the bottom  		  #
      #												  #	
      #################################################


# intro
echo "This an Shell script for install firefox non esr version in debian 10 buster-stable"

sleep 5

# requirement
echo "Before execute the script we assume you have a sudo privilege, your distribution are in french language, and all to be up to date "

sleep 5
    
sudo apt install wget -y #download wget

wget -O Firefox.tar.bz2 "https://ftp.mozilla.org/pub/firefox/releases/84.0.1/linux-x86_64/fr/firefox-84.0.1.tar.bz2" #get the tar of firefox

sleep 5

ls 

# define the variables

DIR="/opt/"
BIN="/opt/bin/"
FILE="Firefox.tar.bz2"

# desktop icon creation
echo "[Desktop Entry]
 Version=1.0
 Name=Firefox Web Browser
 Comment=Browse the World Wide Web
 GenericName=Web Browser
 Keywords=Internet;WWW;Browser;Web;Explorer
 Exec=/opt/bin/firefox/firefox %u
 Terminal=false
 X-MultipleArgs=false
 Type=Application
 Icon=firefox
 Categories=GNOME;GTK;Network;WebBrowser;
 MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler  /chrome;video/webm;application/x-xpinstall;
 StartupNotify=true
 Actions=new-window;new-private-window;
 
 [Desktop Action new-window]
 Name=Open a New Window
 Exec=/opt/bin/firefox/firefox -new-window
 
 [Desktop Action new-private-window]
 Name=Open a New Private Window
 Exec=/opt/bin/firefox/firefox -private-window " >> firefox-custom.desktop

 # move at the right place the desktop file
 sudo cp firefox-custom.desktop /usr/share/applications/ && echo "we create an desktop icon for firefox and move it"
 cp firefox-custom.desktop /home/zegzer/Bureau
 
 sleep 5
 
# conditional checking of precedent download 
if [ -e *.tar.bz2 ]; then 
echo true;
ls *.tar.bz2 && echo "this is firt DL of FF"
fi  

# move it into right folder OPT
sudo mv $FILE $DIR && echo "we move the tar file"

sleep 2
# go in opt and listing it
cd $DIR && echo "cd in OPT" 
ls $DIR && echo " we listing the dir OPT"

sleep 2

#checking if BIN folder exist if not we create one for move archive into
if [ "$(ls -d $BIN)" ]; then
     echo "Take action $BIN exist"
     ls $DIR
     sudo mv $FILE $BIN
else
    echo "$DIR is Empty so we create bin folder"
    cd $DIR && sudo mkdir $BIN && sudo mv $FILE $BIN
    
fi    

sleep 5

#exctract archive
cd $BIN && sudo tar -xvf Firefox.tar.bz2 && echo "we extract tar file"

#checking if bin folder have the exctracted firefox
if [ "$(ls -A $BIN)" ]; then
     echo "ITs OK $BIN is not Empty so we chown the folder"
     sudo chown -R root:root $BIN/firefox #chown in root for security reason
else
    echo "$BIN is Empty"
fi

sleep 5

#outro with recommandations
echo "if everything is good without error you can now run the browser from the desktop icon You can now chose any icone for it, but you can find at this location /opt/bin/firefox/icons/ the original icon of firefox." 
sleep 2
echo "Feel free to change the release of 'firefox' in the wget code at this link https://ftp.mozilla.org/pub/firefox/releases/"
sleep 2
echo "if you need to reinstall firefox the tar.bz2 file must be located : /OPT/BIN/" && ls $BIN 
sleep 2
echo "if you dont see the desktop icon,  you maybe see at the next session connexion"
sleep 2
echo " ENJOY and GOOD Surf"

# from this tutorial : https://wiki.learnlinux.tv/index.php/Installing_non-ESR_Firefox_in_Debian_10

# thanks a lot to the authors 



 
