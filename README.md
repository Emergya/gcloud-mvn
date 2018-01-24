# Set your directories env vars

export PROJECT_DIR=/root/Projects/emergya/project
export GCLOUD_CONF_DIR=$PROJECT_DIR/.gcloud-config

# Run an interactive shell with mvn and gcloud available

docker run -it --rm \
  -v $GCLOUD_CONF_DIR:/root/.config \
  -v $PROJECT_DIR:/src \
  -v $PROJECT_DIR/.m2:/root/.m2 \
  emergya/gcloud-mvn

# Run gcloud deploy directly

docker run -it --rm \
  -v $GCLOUD_CONF_DIR:/root/.config \
  -v $PROJECT_DIR:/src \
  -v $PROJECT_DIR/.m2:/root/.m2 \
  --entrypoint=gcloud \
  emergya/gcloud-mvn
  help


