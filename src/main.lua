local json = require("json")
-- open data.pdz
local f = assert(io.open(arg[1], "rb"))
-- pdz files can be compressed or uncompressed
-- we only handle uncompressed for now. for compressed, see
-- https://gist.github.com/zhuowei/666c7e6d21d842dbb8b723e96164d9c3
f:seek("set", 0x1c)
local inputbc = f:read("*all")
f:close()
local inputfunc = load(inputbc)
local inputdata = inputfunc()
local outputdata = json.encode(inputdata)
local outputfile = assert(io.open(arg[2], "w"))
outputfile:write(outputdata)
outputfile:close()
