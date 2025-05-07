#!/bin/bash
declare -a CMAKE_LIBXML_LIBRARY
if [[ ${target_platform} == osx-64 ]]; then
  CMAKE_LIBXML_LIBRARY+=(-DLIBXML_LIBRARY="${PREFIX}"/lib/libxml2.dylib)
elif [[ ${target_platform} == linux-64 ]]; then
  CMAKE_LIBXML_LIBRARY+=(-DLIBXML_LIBRARY="${PREFIX}"/lib/libxml2.so)
fi

cmake -B build -S . \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_CXX_COMPILER=${CXX} \
      -DCMAKE_C_COMPILER=${CC} \
      -DCMAKE_CXX_STANDARD_LIBRARIES=-lxml2 \
      -DWITH_SWIG=OFF \
      "${CMAKE_LIBXML_LIBRARY[@]}" \
      -DLIBXML_INCLUDE_DIR=${PREFIX}/include/libxml2 \
      -DWITH_STABLE_PACKAGES=ON \
      -DWITH_CPP_NAMESPACE=ON \
      ..
cmake --build build --parallel "${CPU_COUNT}" --config Release
cmake --install build
