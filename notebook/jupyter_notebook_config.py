# SSL self-certificate setting for secure web access (https://)
c.NotebookApp.certfile = u'.jupyter/jupyter.crt'
c.NotebookApp.keyfile = u'.jupyter/jupyter.key'
# Access to notebook with password instead of token.
c.NotebookApp.token = 'jupyter'
c.NotebookApp.open_browser = False
c.NotebookApp.ip = '*'
c.NotebookApp.port = 9999
