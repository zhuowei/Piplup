Piplup: decompile Playdate Pulp .pdx files back to .json project files

Usage (command line):

- Build Lua 5.4-beta with LUA_32BITS defined
- Download [rxi/json.lua](https://github.com/rxi/json.lua)
  (This is automatically downloaded if you run `git submodule update --init`)
- `lua main.lua path/to/your.pdx/data.pdz out.json`

Usage (online):

- Go to [https://zhuoweizhang.net/piplup](https://zhuoweizhang.net/piplup)
- Upload the `data.pdz` file from the .pdx
- Download the `out.json` file
