sudo sh -c 'for i in /sys/devices/system/node/node*/hugepages/hugepages-2048    kB/nr_hugepages; do echo 512 > $i; done'
sudo rmmod ixgbe
sudo rmmod dune.ko
sudo rmmod pcidma.ko
make -sj6 -C deps/dune/
sudo insmod deps/dune/kern/dune.ko
make -sj6 -C deps/pcidma/
sudo insmod deps/pcidma/pcidma.ko
make -j8
#sudo ./dp/ix -- ./apps/echoserver 4
#sudo ./dp/ix -- ./apps/hello
#sudo ./dp/ix -- ./apps/memcached/memcached
sudo ./dp/ix -- ./apps/nginx_ix/objs/nginx
