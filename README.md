# Ansible for HTPC
This playbook and all its roles provision a fully functional HTPC with the following components:
* Plex Media Server
* Sonarr
* Sabnzbd
* Kodi
* Spotify
* Greyhole
* Datadog
* Prometheus
* VNC

## Setup Instructions
Once you have your own (currently tested on) Ubuntu 14.04 server run the following command to set up your HTPC:

    ansible-playbook -i production/inventory playbook.yml --limit htpc-1

If you want to specifically run any of the roles you can specify them using `--tags`

    ansible-playbook -i production/inventory playbook.yml --limit htpc-1 --tags sabnzbd,sonarr

### Local Setup
I'd suggest you test things first before deploying to your production environment by setting up your vagrant environment

    vagrant start vagrant-htpc
    vagrant provision ansible
