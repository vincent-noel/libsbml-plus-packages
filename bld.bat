mkdir build
cd build


dir 

%CXX%
clang-cl --version
cmake --version
dir %LIBRARY_LIB%
dir %LIBRARY_INC%
cmake -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
      -DCMAKE_CXX_COMPILER=%CXX% ^
      -DCMAKE_C_COMPILER=%CXX% ^
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
