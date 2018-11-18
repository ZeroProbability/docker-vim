#!/bin/bash

useradd anbu --password anbu --shell /bin/zsh
mkdir /home/anbu
chown anbu /home/anbu
chgrp anbu /home/anbu
echo "root:Docker!" | chpasswd
