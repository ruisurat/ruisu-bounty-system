rbs = rbs or {}
rbs.Author = "ruisu"
rbs.Version = "1.0.0"

if SERVER then
    include("ruisu_bounty_system/sv_base.lua")
    AddCSLuaFile("ruisu_bounty_system/cl_base.lua")
else
    include("ruisu_bounty_system/cl_base.lua")
end

print(("[Ruisu's Bounty System] Loaded Successfully - Made by %s. Version: %s"):format(rbs.Author, rbs.Version))