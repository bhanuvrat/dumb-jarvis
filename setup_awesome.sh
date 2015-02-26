#! /bin/bash
echo "installing awesomeWM"
cd /tmp/; git clone --depth=1 https://github.com/awesomeWM/awesome.git
cd awesome; make; sudo make install;

echo "[Desktop Entry]
Encoding=UTF-8
Name=awesome
Comment=awesomeness redefined
TryExec=awesome
Exec=awesome
Type=Application
"  | sudo tee /usr/share/xsessions/awesome.desktop > /dev/null

sudo ln -s /usr/local/etc/xdg/awesome/ /etc/xdg/awesome