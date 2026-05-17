---
title: Accessing Containerized Databases with SSH Tunnels
description: Database administration using a secure tunnel without exposing any ports.
date:
---

Recently, I was wanting to adopt some more production-ready practices surrounding the database of my [musician web site](https://www.abhiche.com) (Yes, the one that I said should just use some CSV parsing rather than a database in a [previoius post](https://mocalabs.dev/posts/2026/vps-migration-abhiche) ...). Self-contradictions aside, I'm really just preparing myself for managing Postgres instances for both the staging and production deployment of a [webapp I am building as a portfolio project](https://git.mocalabs.dev/abby/artisanal-boulangerie-de-char). Long story short, I wanted a way to access the database(s) without opening or exposing any ports to the public. Getting some hands-on experience with database backups and migrations is also something I wanted to get out of this.

A quick web search suggests to use SSH Tunnels with something like `ssh -L <local-port>:<database-address>:<postgres-port> <user>@<host>`. Since I am using docker compose to run and orchestrate the containers on my VPS, the application itself connects to the database via it's container name, so if the container is named "db", the connection string would be something like `postgresql://db:5432/<database>`. This presents a bit of a problem when trying to access the database remotely: The container can't be connected to with just the name alone. You must retrieve the container's internal IP addres with:

```shell
$ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container-name>
```

> NOTE: I also needed to update my `/etc/ssh/sshd_config` on the server to allow TCP forwarding as well as tunnelling

```shell
# /etc/ssh/sshd_config
AllowTcpForwarding yes
PermitTunnel yes
```

Now with the DB container's IP address, I could create the tunnel:

```shell
ssh -L 5432:<container-ip-address>:5432 abby@mocalabs.dev -p <ssh-port-number> -i ~/.ssh/path_to_private_key
```

I then tested the connection in both DataGrip and DBeaver - Make sure to set the config for the SSH connection to your VPS IP or hostname with the correct port and select your identity file for authentication. Once the SSH tunnel is tested and working, you can add the Postgres connection with the container's IP as host along with your database credentials. The URL should be:

```shell
jdbc:postgresql://<db-container-ip>:5432/<db-nanme>
```

I'm aware that this won't be anything new to any developer worth their salt, but I learned something new today and I wanted to document it mostly so I can refer back to this later rather than digging through my notes. Cheers! :-)
