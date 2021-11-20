-- receive our notifications!
net.Receive("rbs_notify_bounty", function()
    local ply = net.ReadEntity()

    notification.AddLegacy("[BOUNTY] " .. ply:Nick() .. " now has a bounty on their head!", NOTIFY_GENERIC, 5)
end)

net.Receive("rbs_notify_bounty_dead", function()
    local ply = net.ReadEntity()

    notification.AddLegacy("[BOUNTY] " .. ply:Nick() .. " has been killed and no longer has a bounty!", NOTIFY_GENERIC, 5)
end)

net.Receive("rbs_notify_bounty_kill", function()
    local ply = net.ReadEntity()

    notification.AddLegacy("[BOUNTY] " .. ply:Nick() .. " has killed another player. Take them down!", NOTIFY_GENERIC, 2)
end)

net.Receive("rbs_notify_milestone", function()
    local milestone = net.ReadInt(32)
    local money = net.ReadInt(32)
    local xp = net.ReadInt(32)

    notification.AddLegacy("[BOUNTY] Milestone " .. milestone .. "! You've been given $" .. money .. " and " .. xp .. "XP!", NOTIFY_GENERIC, 5)
end)