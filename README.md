# rpi2-quantlib
Jupyter Notebook Docker image with QuantLib package for Raspberry Pi 2/3 (armv7l)

Used [schachr/docker-raspbian-stretch](https://github.com/schachr/docker-raspbian-stretch) as base image, and [Berryconda](https://github.com/jjhelmus/berryconda) for jupyter notebook.

How to Run the Image
------------
1. Clone this repository.
```
git clone https://github.com/domosute/rpi2-quantlib.git
```
2. Change directory to notebook folder
```
cd ./rpi2-quantlib/notebook
```
3. Under docker-enabled environment, execute the following;
```
docker run -d -it -p 9999:9999 -v $PWD:/home/jupyter --name rpi2-quantlib domosute/rpi2-quantlib
```
4. Access via browser. Type 'jupyter' to access to notebook.
```
https://<IP address of docker host>:9999
```
* Default password is 'jupyter'.  Modify `jupyter_notebook_config.py` accordingly.

How to Build the Image
------------

Execute below in the directory where Dockerfile exists.

```
docker build -t <tag name> .
```

Verified build with Raspberry Pi 3 B+.
`[Note]: Swapfile needs to be increased to pass the process. Observed successful build with 2GB setting.`

Edit 2 parameters of /etc/dphys-swapfile. (Example: set swap file to 2GB)

```
CONF_SWAPSIZE=2048
CONF_MAXSWAP=2048
```

Then, update

```
sudo /etc/init.d/dphys-swapfile stop
sudo /etc/init.d/dphys-swapfile start
```
