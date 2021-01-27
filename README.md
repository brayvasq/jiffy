# README
This is a simple and customizable time traker.

## Requirements

- Git (https://git-scm.com/).
- Docker (https://www.docker.com/get-started).

## Step 1: Clone Repo

```bash
# Clone git repo
git clone git@github.com:brayvasq/jiffy.git

# Move to the repo directory
cd jiffy/
```


## Step 2: Build the docker image

```bash
docker build .
```

## Step 3: Run project

Now we have created a custom image. We can run the project using it.

```bash
docker run -p 3000:3000 <IMAGE_ID> bin/rails s -b 0.0.0.0
```

**Note:** We can see docker images info using the following command:

```bash
# Show docker images
docker images

# It will show something like this:
REPOSITORY                                      TAG              IMAGE ID       CREATED         SIZE
<none>                                          <none>           <image_id_1>   2 minutes ago   1.34GB
ruby                                            2.6              <image_id_2>   2 weeks ago     840MB
```
