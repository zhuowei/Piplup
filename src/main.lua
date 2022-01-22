local json = require("json")

local editorSeg = {
    activeCharId = -1,
    activeExitId = 0,
    activeFrameId = 0,
    activeLayerId = 0,
    activeModeId = 0,
    activeNoteId = 0,
    activePipeId = 0,
    activeRoomId = 0,
    activeScriptId = 0,
    activeSongId = 0,
    activeSoundId = 0,
    activeTextId = 0,
    activeTileId = 0,
    activeVoiceId = 0,
    highlightTiles = false,
    loopNotes = false,
    loopSong = true,
    recentScripts = {},
    sampleText = "",
    showCard = true,
    showGrid = false,
    showLayer = {},
    showWalls = false,
    sortedTiles = {},
    version = 2,
}

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
inputdata["editor"] = editorSeg
local outputdata = json.encode(inputdata)
local outputfile = assert(io.open(arg[2], "w"))
outputfile:write(outputdata)
outputfile:close()
