-- define the network strings
util.AddNetworkString("rbs_notify_bounty")
util.AddNetworkString("rbs_notify_bounty_dead")
util.AddNetworkString("rbs_notify_bounty_kill")
util.AddNetworkString("rbs_notify_milestone")

hook.Add("PlayerDeath", "CountKillstreak", function(dead, damager, killer)
    if not rbs.config.enabled then return end -- make sure the bounty is enabled

    -- reset the dead person's killstreak
    dead:RBSSetKillstreak(0)

    -- check if our dead person had a bounty!    
    if dead:RBSHasBounty() then
        dead:RBSSetBounty(false)
        if rbs.config.notifications.death then
            rbs:SendNotification("rbs_notify_bounty_dead", dead)
        end
    end

    -- check that it wasn't a suicide and that killer is a player
    if killer == dead then return end
    if not killer:IsPlayer() then return end

    -- +1 to the killer's current streak
    killer:RBSIncrementKillstreak()

    -- if the players current killstreak equates to killsforbounty - give them the bounty!
    local killsNeeded = rbs.config.milestones.settings.kills // set killsNeeded default value

    if rbs.config.milestones.settings.enabled then killsNeeded = rbs.config.milestones[1].kills end // if milestones enabled, set kills needed to the first milestone

    if killer:RBSGetKillstreak() == killsNeeded then
        killer:RBSSetBounty(true)
        if rbs.config.notifications.bounty then
            rbs:SendNotification("rbs_notify_bounty", killer)
        end
    end

    -- if killer already has a bounty - do some stuff
    if killer:RBSHasBounty() then
        -- if notifications for a kill are enabled
        if rbs.config.notifications.kill then
            rbs:SendNotification("rbs_notify_bounty_kill", killer)
        end

        if not rbs.config.milestones.settings.enabled then
            if rbs.config.milestones.settings.reward > 0 then
                killer:RBSReward(rbs.config.milestones.settings.money, rbs.config.milestones.settings.xp)
            end
        else
            for i, v in pairs(rbs.config.milestones) do
                if killer:RBSGetKillstreak() == v.kills then
                    killer:RBSReward(v.money, v.xp)
                    rbs:SendNotification("rbs_notify_milestone", killer)
                end
            end
        end
    end
end)