FROM schachr/raspbian-stretch:latest

RUN apt-get update && \
# Installing necessary packages for compilation
apt-get install -y wget tar bzip2 binutils build-essential && \
apt-get autoremove && \
# Downloading source file
cd /opt && \
wget https://github.com/jjhelmus/berryconda/releases/download/v2.0.0/Berryconda3-2.0.0-Linux-armv7l.sh && \
# Begin Installation
chmod +x /opt/Berryconda3-2.0.0-Linux-armv7l.sh &&\
/opt/Berryconda3-2.0.0-Linux-armv7l.sh -b -p /opt/conda && \
/opt/conda/bin/conda update -y --prefix /opt/conda conda && \
/opt/conda/bin/conda install -y jupyter numpy pandas && \
# Install Quantlib related packages
/opt/conda/bin/conda install -y -c domosute m4 icu autoconf automake libtool boost swig quantlib quantlib-python ipyparallel && \
# Setup for Jupyter Notebook
echo "export PATH=/opt/conda/bin:$PATH" > /etc/profile.d/conda.sh && \
groupadd -g 1000 jupyter && \
useradd -g jupyter -G sudo -m -s /bin/bash jupyter && \
echo "jupyter:jupyter" | chpasswd && \
mkdir -p /etc/sudoers.d && \
echo "jupyter ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/jupyter && \
chmod 0440 /etc/sudoers.d/jupyter && \
# Below file enable password access instead of token
echo "c.NotebookApp.token = 'jupyter'" > /home/jupyter/jupyter_notebook_config.py && \
# Enable IPython cluster
/opt/conda/bin/ipcluster nbextension enable && \
# Remove files to reduce image size
rm -f Berryconda3-2.0.0-Linux-armv7l.sh && \
# Clean up conda packages
/opt/conda/bin/conda clean -y --all

EXPOSE 9999
USER jupyter
WORKDIR /home/jupyter

CMD ["/bin/bash", "-c", "/opt/conda/bin/jupyter-notebook --ip=*"]
