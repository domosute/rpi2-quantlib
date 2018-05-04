Build condition with Raspberry Pi 3 B+
--------------------------------------

- Multithreading: set to 2 (Reduced "MULTI_THREAD=2" in build.sh.  "MULTI_THREAD=4" caused memory error)
- Swapfile: set to 8GB (Can be less, Swapfile size was not exceeding more than 1.7GB...)

Adjusting Swapfile
------------------

Edit 2 parameters of /etc/dphys-swapfile. (Example: set swap file size to 8GB)

```
CONF_SWAPSIZE=8192
CONF_MAXSWAP=8192
```

Then, update

```
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
```
