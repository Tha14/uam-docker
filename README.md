# Run UAM in a Docker container
[![run-docker-compose-workflow](https://github.com/Tha14/uam-docker/actions/workflows/push.yml/badge.svg)](https://github.com/Tha14/uam-docker/actions/workflows/push.yml)

## How to use:
### Single UAM instance
1. Make sure you have docker and docker-compose installed on your host.
2. Clone this repository.
3. If you're on windows or macos, in the docker-compose.yml file, make sure you change the volume path `/opt/uam_data` to something that works on your OS.
4. Execute the following command in terminal while being in the `uam` directory of this repository:

```PBKEY={YOURKEYHERE} docker-compose up -d```

### UAM Swarm
1. Make sure you have docker and docker-compose installed on your host.
2. Clone this repository.
3. If you're on windows or macos, in the docker-compose.yml file, make sure you change the volume path `/opt/uam_data/uam_` to something that works on your OS.
4. Optionally, add or remove services according to your needs. You can copy and paste the existing services and incement the names, paths, and ports for each of them.
5. Execute the following command in terminal while being in the `uam-swarm` directory of this repository:

```PBKEY={YOURKEYHERE} docker-compose up -d```

## Important information:
1. This container will download the latest version of uam every time it is started and will install apt packages so keep that in mind.
2. The http service for uam is enabled and listening on http://127.0.0.1:17099 for the single instance. For the UAM swarm you need to define the listening port for each instance.
3. Make sure you port forward manually as upnp will most likely not work.
4. You can adjust the maximum upload and download bandwidth of uam by changing the `NETLIMUP` and `NETLIMDOWN` env variables.
5. I suggest using [lazydocker](https://github.com/jesseduffield/lazydocker) to control and see the status of your containers.

## ToDo:
- [x] Add CI tests to make sure the scripts work.
- [x] Make PBKEY a required variable to avoid running uam without it.
- [x] Include wondershaper or sch_cake in `apt install` and environment configuration parameters for it.
- [ ] See if it's possible to automatically increment port numbers for the swarm script.
