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
    rustup component add rust-src
    rustup install nightly
    rustup component add racer +nightly
    rustup component add rustfmt
}
function install_plugin() {
    vim +PlugInstall +qall
}

install_rustup
install_toolchain
install_plugin
