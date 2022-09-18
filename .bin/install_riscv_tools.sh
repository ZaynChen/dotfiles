# rust envrioment setup
paru -Syyu rustup --confirm --needed

export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

rustup install nightly
rustup default nightly

rustup target add riscv64gc-unknown-none-elf
cargo install cargo-binutils
rustup component add llvm-tools-preview
rustup component add rust-src

# qemu setup
paru -S qemu --noconfirm --needed

# riscv-gnu-toolchain
paru -S riscv-gnu-toolchain --noconfirm --needed
