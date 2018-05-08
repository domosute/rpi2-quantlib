SSL Self-certificate was created to establish secure web access (https://)
```
openssl req -x509 -node -days 3650 -newkey rsa:4096 -keyout jupyter.key -out jupyter.crt
```
