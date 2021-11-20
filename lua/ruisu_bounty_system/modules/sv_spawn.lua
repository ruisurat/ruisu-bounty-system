-- when the player first spawns, assign their base values
hook.Add("PlayerInitialSpawn", "RBS_AssignValues", function(ply)
    if not rbs.config.enabled then return end -- make sure the bounty is enabled

    ply:RBSSetKillstreak(0)
    
    -- check if bounty on spawn exists!
    if rbs.config.bountyonspawn then
        ply:RBSSetBounty(true)
    else
        ply:RBSSetBounty(false)
    end
end)

-- playerspawn hook to prevent any bugs slipping through if the player somehow spawns without dying!
hook.Add("PlayerSpawn", "BugCatcher", function(ply)
    if not rbs.config.enabled then return end

    ply:RBSSetKillstreak(0)
    
    -- check if bounty on spawn exists!
    if rbs.config.bountyonspawn then
        ply:RBSSetBounty(true)
    else
        ply:RBSSetBounty(false)
    end
end)
