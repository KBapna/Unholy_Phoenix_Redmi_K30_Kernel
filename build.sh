export Directory="/home/Unholy_Phoenix_Redmi_K30_Kernel/"
export PATH="${Directory}/toolchains/Clang/bin:${Directory}/toolchains/arm-gnu-toolchain-13.2.Rel1-x86_64-aarch64-none-linux-gnu/bin:${Directory}/toolchains/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-linux-gnueabihf/bin:$PATH"

export ARCH=arm64
export KBUILD_BUILD_USER=root
export KBUILD_BUILD_HOST=Kali

# Clean the build directory
make clean

# Remove any configuration or generated files 
make mrproper

# Load the configuration file
make O=out ARCH=arm64 phoenix_defconfig

# Build the kernel
make -j$(nproc --all) \
    O=out \
    ARCH=arm64 \
    LLVM_IAS=1 \
    CC="ccache clang" \
    LD=ld.lld \
    CROSS_COMPILE=aarch64-none-linux-gnu- \
    CROSS_COMPILE_ARM32=arm-none-linux-gnueabihf- \
    CLANG_TRIPLE=aarch64-linux-gnu-

