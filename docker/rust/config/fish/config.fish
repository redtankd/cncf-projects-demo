# for Rust

set -x RUSTUP_DIST_SERVER https://mirrors.ustc.edu.cn/rust-static

set PATH $PATH ~/.cargo/bin

if status --is-interactive
    alias c='cargo'
    alias r='rustup'
end
