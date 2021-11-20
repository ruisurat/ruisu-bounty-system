local Player = FindMetaTable("Player")

function Player:RBSHasBounty()
    return self:GetNWBool("rbs_HasBounty")
end

function Player:RBSSetBounty(bool)
    return self:SetNWBool("rbs_HasBounty", bool)
end

function Player:RBSGetKillstreak()
    return self:GetNWInt("rbs_Killstreak")
end

function Player:RBSSetKillstreak(amount)
    return self:SetNWInt("rbs_Killstreak", amount)
end

function Player:RBSIncrementKillstreak()
    return self:SetNWInt("rbs_Killstreak", self:GetNWInt("rbs_Killstreak") + 1)
end

function Player:RBSReward(money, xp)
    if rbs.config.isdarkrp then
        if LevelSystemConfiguration then
            self:addXP(xp)
        end

        self:addMoney(money)
    end
end

function Player:RBSGetCurrentMilestone()
    for i, v in pairs(rbs.config.milestones) do
        if self:RBSGetKillstreak() == v.kills then
            return i
        end
    end
end

function rbs:GetMilestoneKills(i)
    return rbs.config.milestones[i].kills
end

function rbs:GetMilestoneMoney(i)
    return rbs.config.milestones[i].money
end

function rbs:GetMilestoneXP(i)
    return rbs.config.milestones[i].xp
end

-- simple function to prevent copying and pasting, just sends a notification to all players' client :D
function rbs:SendNotification(type, ply)
    local receivers = RecipientFilter()

    if type != "rbs_notify_milestone" then
        -- check all players, and add all but the killer to a recipient filter
        for k, v in pairs(player.GetAll()) do
            if type == "rbs_notify_bounty_kill" or type == "rbs_notify_bounty" then
                if not v == ply then
                    receivers:AddPlayer(v)
                end
            else
                receivers:AddPlayer(v)
            end
        end

        -- start the net message for a kill notification
        net.Start(type)
            net.WriteEntity(ply)
        net.Send(receivers)
    else
        local curMilestone = ply:RBSGetCurrentMilestone()
        local money = rbs:GetMilestoneMoney(curMilestone)
        local xp = rbs:GetMilestoneXP(curMilestone)

        net.Start(type)
            net.WriteInt(curMilestone, 32)
            net.WriteInt(money, 32)
            net.WriteInt(xp, 32)
        net.Send(ply)
    end
end