# Commands for building the image

    docker build . -t vim
    docker run -it vim:latest "/bin/bash" -c "su -c /bin/zsh anbu"
