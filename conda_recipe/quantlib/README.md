Verified build with Raspberry Pi 3 B+.
`[Note]: Swapfile needs to be increased to pass the process. Observed successful build with 2GB setting.`

Edit 2 parameters of /etc/dphys-swapfile. (Example: set swap file to 8GB)

```
CONF_SWAPSIZE=8192
CONF_MAXSWAP=8192
```

Then, update

```
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
```
