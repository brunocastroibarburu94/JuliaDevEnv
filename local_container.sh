PROJECT_NAME=new-project

docker build  -t ${PROJECT_NAME}-image   .

# For Windows with SSH
winpty docker run --rm -it \
--env-file ./.env \
--mount type=bind,source="$(PWD)",target=/root/project \
--mount type=bind,source="$HOME/.ssh",target=/root/.ssh \
--mount  type=bind,source="$HOME/.gitconfig",target=/etc/gitconfig \
--name ${PROJECT_NAME}-container \
-p 8080:8080 \
--entrypoint bash \
${PROJECT_NAME}-image 