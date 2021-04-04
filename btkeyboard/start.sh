#!/bin/bash

cd /home/stories2/BlogCode/btkeyboard

sudo hciconfig hci0 down
sudo /etc/init.d/bluetooth stop
sudo nohup /usr/sbin/bluetoothd --nodetach --debug -p time > /home/stories2/BlogCode/btkeyboard/bluetoothd.out &
sleep 5
sudo hciconfig hci0 up
sudo hciconfig hci0 > /home/stories2/BlogCode/btkeyboard/hci0.out

sudo bluetoothctl agent on
sudo bluetoothctl default-agent
sudo bluetoothctl trust E4:E4:AB:F1:30:0F
sleep 5
sudo nohup python /home/stories2/BlogCode/btkeyboard/server/btk_server.py > /home/stories2/BlogCode/btkeyboard/btk_server.out &
