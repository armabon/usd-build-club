SET current=%cd%
cd prereq

if not exist "build\glfw" ^
mkdir build\glfw

if not exist "glfw\CMakeLists.txt" ^
git clone https://github.com/glfw/glfw.git

cd glfw
git pull
cd ..

cd build\glfw

cmake -G "Visual Studio 14 2015 Win64"^
      -DCMAKE_PREFIX_PATH="%current%\local"^
      -DCMAKE_INSTALL_PREFIX="%current%\local" ..\..\glfw

cmake --build . --target install --config Release

cd %current%
