mkdir build
cd build

cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} ^
      -DCMAKE_INSTALL_LIBDIR=${PREFIX}/lib ^
      -DCMAKE_CXX_COMPILER=${CXX} ^
      -DCMAKE_C_COMPILER=${CC} ^
      -DCMAKE_CXX_STANDARD_LIBRARIES=-lxml2 ^
      -DWITH_SWIG=OFF ^
      -DLIBXML_LIBRARY=${PREFIX}/lib ^
      -DLIBXML_INCLUDE_DIR=${PREFIX}/include/libxml2 ^
      -DENABLE_COMP=ON ^
      -DENABLE_FBC=ON ^
      -DENABLE_GROUPS=ON ^
      -DENABLE_LAYOUT=ON ^
      -DENABLE_MULTI=ON ^
      -DENABLE_QUAL=ON ^
      -DENABLE_RENDER=ON ^
      -DENABLE_DISTRIB=ON ^
      ..
make
make install
