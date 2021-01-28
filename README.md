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
docker build -t jiffy .
```

## Step 3: Run project

Now we have created a custom image. We can run the project using it.

```bash
docker run -p 3000:3000 jiffy
```
