# Running SoftGym inside a docker


## Pull the Docker image
```
docker pull improbableailab/softgym
```
`Tmux`, `vscode`, `sublime` have been installed.

## Launch the docker and Run softgym examples

In terminal 1
```
docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=/tmp/.docker.xauth" \
    --privileged \
    --runtime=nvidia \
    --net=host \
    softgym:latest
```
To mount a directory (`data`), then launch the docker with the following command instead:
```
docker run -it \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=/tmp/.docker.xauth" \
    --volume="$PWD/data:/workspace/softgym/data" \
    --privileged \
    --runtime=nvidia \
    --net=host \
    softgym:latest

```
In another terminal (terminal 2) (this is for GUI visualization inside the docker):
```
xhost +local:
```

In the docker (terminal 1):

```
python examples/random_env.py --env_name PassWater
```


## Build with Dockerfile locally (Optional)

Build the [Dockerfile](softgym.Dockerfile):
```
docker build -t softgym -f softgym.Dockerfile .
```

