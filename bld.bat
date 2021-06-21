mkdir build
cd build
%CXX% --version
clang-cl --version
cmake -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
      -DCMAKE_CXX_COMPILER=clang-cl ^
      -DCMAKE_C_COMPILER=clang-cl ^
      -DCMAKE_CXX_STANDARD_LIBRARIES=-lxml2 ^
      -DWITH_SWIG=OFF ^
      -DLIBXML_LIBRARY=%LIBRARY_LIB% ^
      -DLIBXML_INCLUDE_DIR=%LIBRARY_INC%/libxml2 ^
      -DENABLE_COMP=ON ^
      -DENABLE_FBC=ON ^
      -DENABLE_GROUPS=ON ^
      -DENABLE_LAYOUT=ON ^
      -DENABLE_MULTI=ON ^
      -DENABLE_QUAL=ON ^
      -DENABLE_RENDER=ON ^
      -DENABLE_DISTRIB=ON ^
      %SRC_DIR%
make
make install