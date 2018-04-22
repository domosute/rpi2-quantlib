# rpi2-jupyter
Jupyter Notebook Docker image for Raspberry Pi 2 (armv7l)

Used [resin/rpi-raspbian](https://hub.docker.com/r/resin/rpi-raspbian/) as base image.

[Berryconda](https://github.com/jjhelmus/berryconda) was used to enable jupyter notebook.

How to Run the image
------------
Under docker-enabled environment, execute the following;
```
docker run -d -it -p 8888:8888 -v $PWD/jupyter:/home/jupyter --name rpi2-jupyter domosute/rpi2-jupyter
```
where "$PWD/jupyter" is outside storage in case if persistent storage is preferred.

By storing `jupyter_notebook_config.py` under working directory would enable password access instead of token.
