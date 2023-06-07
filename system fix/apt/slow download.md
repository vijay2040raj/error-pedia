#switch to HTTPS

1) sudo apt install apt-transport-https
2) edit /etc/apt/sources.list (sudo nano /etc/apt/sources.list) 
  i) change http to HTTPS on distro repo or on you want if giving error on update then they don't have HTTPS functionality.
3) sudo apt update
4) you can toggle them. (http <--> https)
