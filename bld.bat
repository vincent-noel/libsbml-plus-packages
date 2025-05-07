echo on

cmake -G"Ninja" -S . -B build ^
    -DCMAKE_INSTALL_PREFIX="%PREFIX%"/Library ^
    -DCMAKE_INSTALL_LIBDIR="%PREFIX%"/Library/lib ^
    -DCMAKE_INSTALL_INCLUDEDIR="%PREFIX%"/Library/include ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DBUILD_SHARED_LIBS=ON ^
    -DCMAKE_CXX_COMPILER="%CXX%" ^
    -DCMAKE_C_COMPILER="%CC%" ^
    -DCMAKE_CXX_STANDARD_LIBRARIES=-lxml2 ^
    -DWITH_SWIG=OFF ^
    -DLIBXML_LIBRARY="%PREFIX%"/Library/lib/libxml2.lib ^
    -DLIBXML_INCLUDE_DIR="%PREFIX%"/Library/include/libxml2 ^
    -DWITH_STABLE_PACKAGES=ON ^
    -DWITH_CPP_NAMESPACE=ON ^
    -DMISC_PREFIX="%PREFIX%"/Library/share/libsbml/

cmake --build build --parallel %CPU_COUNT% --config Release
cmake --build build --target install