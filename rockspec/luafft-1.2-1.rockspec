package = "LuaFFT"
version = "1.2-1"
source = {
  url = "git://github.com/h4rm/luafft",
  tag = "v1.2",
}
description = {
   summary = "Lua package that includes functions for Fast Fourier Transformations.",
   detailed = [[
      This is a port of the KissFFT Library which is a C implementation of the Fast Fourier Transformation (FFT).
	  It contains an easy-to-use function to carry out FFTs. For complex numbers, a module from the Numeric Lua Library has been used.
   ]],
   homepage = "https://github.com/h4rm/luafft",
   license = "MIT/X11"
}

dependencies = {
   "lua >= 5.2"
}
build = {
type = "builtin",
   modules = {
     luafft = "src/luafft.lua",
	 complex = "src/complex.lua"
   },
   copy_directories = { "docs", "examples"}
}
