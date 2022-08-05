#!/usr/bin/env -S bash ../.port_include.sh
port=jakt
version=d1e188a98502d3510c27ce82a9128f045d10073a
files="https://github.com/SerenityOS/jakt/archive/d1e188a98502d3510c27ce82a9128f045d10073a.tar.gz jakt.tar.gz"
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
}
