# Introduction

**luafft** is an easy to use Fast Fourier Transformation package in pure Lua. It is based on the FFT implementation of KissFFT by Mark Borgerding which is both easy to use and extremly fast. It also uses the complex number module from the Numeric Lua package.

_Note: This is a very early version of the code. Although the algorithm has been thoroughly tested by Mark Borgerding, there may very well be bugs that have not been found yet. Please feel free to comment on any source code related problems._

# Installation

LuaFFT is part of the LuaRocks repository where it can be easily installed by using:

```
luarocks install luafft
```

or simply use Git:

```
git clone git://github.com/vection/LuaFFT.git
```

# Usage

LuaFFT is very easy to use. The following lines of code show, how to carry out a simple Fast Fourier Transformation. Keep in mind, that values have to be given as complex values, otherwise luafft returns an error.

```lua
luafft = require "luafft"

local list1 = {}
local size = 2048

--Populates a list with random real numbers in complex format
function populate(list)
  for i=1,size do
      list[i] = complex.new(math.random(), 0)
  end
end

--displays a comparison of two lists with complex numbers
function compare(one, two)
  for i=1,#one do print(string.format("1: %s\t2: %s\n",
 tostring(one[i]),tostring(two[i]))) end
end

--devide a list with a certain constant factor
function devide(list, factor)
  for i,v in ipairs(list) do list[i] = list[i] / factor end
end

--create a list with random real values
populate(list1)

--carry out fast fourier transformation and store result in "ret"
ret = fft(list1, false)

--now carry out inverse fast fourier transformation and store result in "ret2"
ret2 = fft(ret, true)

--After retransformation, we need to devide by the data size
devide(ret2, size)

--displays a comparison of the input and the output, the real part should be equal
--the imaginary part is non zero (but fairly close) due to several calculations
--that have been carried out in the FFT
compare(list2,ret)
```

# Licence and Version
**luafft** is licensed under the same license as Lua -- the MIT license -- and so can be freely used for academic and commercial purposes.
