Docker images for libgit2 continuous integration builds
=======================================================
[libgit2](https://libgit2.org/)'s Linux-based pull request validation,
post-merge continuous integration and nightly builds run inside Docker
containers.  This ensures that we can target a predictable platform
running exactly the distribution with exactly the dependencies that
we want.

We target amd64-based containers natively, and other platforms like
x86 and arm by leveraging QEMU.

To build and test these locally, you can simply run `make`.  This will
produce a new set of docker images with the `test` tag.  You can then
run them locally.  From within a [libgit2 source
directory](https://github.com/libgit2/libgit2), you can test the CI
build step:

    docker run -v $(pwd):/src -v $(pwd)/build:/build -w /build libgit2/trusty-amd64:test /src/ci/build.sh

You can also run the unit tests:

    docker run -v $(pwd):/src -v $(pwd)/build:/build -w /build libgit2/trusty-amd64:test /src/ci/test.sh

(Replace `libgit2/trusty-amd64:test` with the name of the image that you
want to run.)

When you've validated the images, you can build release images and push
them to dockerhub.  To build release images, you can run `make TAG=latest`.
To push them, you can run `make TAG=latest push`.
