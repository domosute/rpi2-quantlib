Used Raspberry Pi 3 B+ for Build.

Swapfile need to be increased to pass the process.

Edit 2 parameters of /etc/dphys-swapfile. (Example: swap file size to 8GB)

```
CONF_SWAPSIZE=8192
CONF_MAXSWAP=8192
```

Then, update

```
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
```
