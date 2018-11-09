#!/bin/sh

root_dir=$(PWD)
echo $root_dir

cd rcrs-server/boot
bash start-comprun.sh&

cd $root_dir

sh rcrs-adf-sample.sh