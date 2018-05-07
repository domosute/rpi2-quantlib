# rpi2-quantlib
Jupyter Notebook Docker image with QuantLib package for Raspberry Pi 2 (armv7l)

Used [resin/rpi-raspbian](https://hub.docker.com/r/resin/rpi-raspbian/) as base image, and [Berryconda](https://github.com/jjhelmus/berryconda) for jupyter notebook.

How to Run the image
------------
Under docker-enabled environment, execute the following;
```
docker run -d -it -p 8888:8888 -v $PWD:/home/jupyter --name rpi2-quantlib domosute/rpi2-quantlib
```
where "$PWD" is outside working directory in case if persistent storage is preferred.

By storing `jupyter_notebook_config.py` under working directory would enable password access instead of token. (default is set as 'jupyter')
