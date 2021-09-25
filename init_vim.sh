#!/usr/bin/env bash

function install_rustup() {
    rustup -V &>/dev/null && echo "rustup already installed";exit
    echo "install rustup"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs|sh
    source ~/.cargo/env
    rustup default stable
    version=$(rustup -V|cut -d ' ' -f 2)
    echo "rustup ${version} installed"
}
function install_toolchain() {
    echo "add component rust-src"
    rustup component add rust-src
    echo "install racer"
    rustup install nightly
    cargo install racer +nightly
    echo "add component rustfmt"
    rustup component add rustfmt
}
function install_plugin() {
    echo "install vim plugins"
    vim +PlugInstall +qall
}

install_rustup
install_toolchain
install_plugin
