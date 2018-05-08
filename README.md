<<<<<<< HEAD
# centos-quantlib
Jupyter Notebook with Quantlib Docker image for x86_64 platform

Used [centos](https://hub.docker.com/_/centos/) as base image, and [Anaconda3 5.1.0](https://repo.continuum.io/archive/) for jupyter notebook.
=======
# rpi2-quantlib
Jupyter Notebook Docker image with QuantLib package for Raspberry Pi 2 (armv7l)

Used [schachr/docker-raspbian-stretch](https://github.com/schachr/docker-raspbian-stretch) as base image, and [Berryconda](https://github.com/jjhelmus/berryconda) for jupyter notebook.
>>>>>>> a36c8e3c15aa44383e22c30b635e1e9dc7546f32

How to Run the Image
------------
1. Clone this repository.
```
git clone https://github.com/domosute/centos-quantlib.git
```
<<<<<<< HEAD
2. Change directory to notebook folder
```
cd ./centos-quantlib/notebook
```
3. Under docker-enabled environment, execute the following;
```
docker run -d -it -p 9999:9999 -v ${PWD}:/home/jupyter --name centos-quantlib domosute/centos-quantlib
```
4. Access via browser. Type 'jupyter' to access to notebook.
```
https://<IP address of docker mahcine>:9999
```
* Default password is 'jupyter'.  Modify `jupyter_notebook_config.py` accordingly.
=======
where "$PWD" is outside working directory in case if persistent storage is preferred.

Storing `jupyter_notebook_config.py` under working directory would enable password access instead of token. (default is set as 'jupyter')
>>>>>>> a36c8e3c15aa44383e22c30b635e1e9dc7546f32
