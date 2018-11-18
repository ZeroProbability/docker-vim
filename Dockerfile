FROM ubuntu:bionic

RUN bash -c "apt-get update && apt-get install -y libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev git checkinstall"
ADD setup_vim.sh /
RUN bash -c "/setup_vim.sh"
COPY setup_user.sh setup_zsh.sh /
RUN bash -c "apt-get -y install zsh git curl tmux"
RUN bash -c "/setup_user.sh"
RUN bash -c "/setup_zsh.sh"
RUN bash -c "rm -f /setup*.sh"

