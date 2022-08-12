#!/usr/bin/env -S bash ../.port_include.sh
port=jakt
version=6a9f52afcca1642a17cdb0037a08c0f3985ff43c
files="https://github.com/SerenityOS/jakt/archive/${version}.tar.gz jakt.tar.gz"
depends=("llvm")
#configopts=("-DCMAKE_TOOLCHAIN_FILE=${SERENITY_BUILD_DIR}/CMakeToolchain.txt" "-DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=1" "-DCMAKE_USE_OPENSSL=ON" "-GNinja")

configure() {
    run cmake "${configopts[@]}" .
}

build() {
   run ninja build/stage0 -j${MAKEJOBS}
}

install() {
    run cp build/stage0 "${SERENITY_INSTALL_ROOT}/usr/local/bin/jakt"
    run mkdir "${SERENITY_INSTALL_ROOT}/usr/local/include/jakt"
    run cp -r runtime "${SERENITY_INSTALL_ROOT}/usr/local/include/jakt"
}
