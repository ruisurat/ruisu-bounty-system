rbs = rbs or {}

local path = "ruisu_bounty_system/"
local function loadFolder( folder )
    print( ("\vLoading %s:"):format( folder ) )

    local _path = path .. folder

    local i = 0
    for _, v in pairs( file.Find( ("%s/*.lua"):format( _path ), "LUA" ) ) do
        if string.StartWith( v, "sv_" ) then
            continue
        else
            include( ("%s/%s"):format( _path, v ) )
        end

        i = i + 1
        print( ("\tLoaded : %s"):format( v ) )
    end

    print( ("\tLoaded %d %s."):format( i, folder ) )
end

function rbs.load()
    print("\n--> [Ruisu's Bounty System] <--")

    include("sh_config.lua")

    loadFolder("modules")

    print("Addon fully loaded.")
end
rbs.load()