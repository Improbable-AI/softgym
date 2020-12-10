# Running SoftGym inside a docker


## Pull the Docker image
```
docker pull improbableailab/softgym
```
`Tmux`, `vscode`, `sublime` have been installed.

## Run softgym examples
```
python examples/random_env.py --env_name PassWater
```


## Build with Dockerfile locally (Optional)

Build the [Dockerfile](softgym.Dockerfile):
```
docker build -t softgym -f softgym.Dockerfile .
```

