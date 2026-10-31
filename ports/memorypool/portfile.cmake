vcpkg_minimum_required(VERSION 2022-10-12)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO edidada/MyMemoryPool
    REF "${VERSION}"
    SHA512 b337b9d1d1f0fcc2971353dfb258cff73ff675c35942a1da62e67a93c88b646c156450f70468e2ca3170180bb297e4872680e21e82f4d6bf8c4eac66fa1530b3
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/mempool)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")