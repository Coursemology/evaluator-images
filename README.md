# Coursemology Evaluator Images

These images are used to run code packages in controlled containers. The names of the images follow
the namespacing as used in the [polyglot](https://github.com/Coursemology/polyglot)
`Coursemology::Polyglot::Language` subclasses.

The images are built on top of a `base` image, which installs `make` and configures the container
command. Base images are tagged with the OS images they are built on: Debian 8 or 10. All other images install the required packages for a particular language.

# Creating an Image for Deployment

Each image should have its own folder/subfolder.

For Python, it can be found in `python/pythonX.X` where `X.X` is the version number.  
You can build the `Dockerfile` locally by entering into the directory and executing the `docker build` command.

```sh
docker build -t coursemology/evaluator-image-<language>:<version> .
```

Once built and tested, you can push to [dockerhub](https://hub.docker.com/u/coursemology).  
You will need to `docker login` using the dockerhub credentials.

```sh
docker push coursemology/evaluator-image-<language>:<version>
```

The image 

## Using the Images for Debugging

If your code cannot pass Coursemology's autograder, you can manually simulate the autograding process with these Docker images to help with debugging.

Install [Docker](https://docs.docker.com/install/) to run the images on your own machine.

### Pulling Images

#### Python

Python has separate tags for each version. The default tag `latest` does not exist.

You can see available versions in the [python folder](https://github.com/Coursemology/evaluator-images/tree/master/python) of this repository.

```
docker pull coursemology/evaluator-image-python:3.7
```

#### C++ and Java

There is only 1 image for each of these languages.

```
docker pull coursemology/evaluator-image-c_cpp
```

```
docker pull coursemology/evaluator-image-java
```

### Preparing the Package Files

When editing a programming question on Coursemology, there is a link to a package zip file.
Download and extract it.

Copy the code you want to debug into the files in the `submission` folder.
More information about the package structure can be found at the [evaluator-samples repository](https://github.com/coursemology/evaluator-samples).

### Getting a Shell

Use `docker run` to start a container with the same environment as Coursemology's autograder.
Specify `-it` and `--entrypoint=/bin/bash` or the container will attempt to run the evaluation script
and exit immediately.

For convenience when debugging, mount the host folder where the package files have been unzipped and prepared to `/home/coursemology/package` in the container.

```
docker run -it --entrypoint=/bin/bash --mount type=bind,source="$(pwd)",target=/home/coursemology/package coursemology/evaluator-image-java
```

Change to the `/home/coursemology/package` directory.

```
root@someid:/# cd /home/coursemology/package
root@someid:~/package#
```

### Running the Tests

The `coursemology-evaluate.sh` [script](https://github.com/Coursemology/evaluator-images/blob/master/base/usr/local/bin/coursemology-evaluate.sh) runs the sequence of steps for autograding.

In the `package` folder, run the following commands to run the public tests.

```
make prepare
make compile
make public
```

You can edit the files used by the test runner and run the tests again to debug.
See the output from the `prepare` step to figure out the file is.
Remember to run the `compile` step again for compiled languages.

### Viewing the Test Report

Open the `report.xml` file generated in the `package` folder.

### Other Makefile Commands

Running the private tests:

```
make private
```

Running the evaluation tests:

```
make evaluation
```

Cleaning up if the prepared file has been messed up:

```
make clean
```
