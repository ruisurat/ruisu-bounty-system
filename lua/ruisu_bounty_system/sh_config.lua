AddCSLuaFile()

rbs = rbs or {}
rbs.config = {}
rbs.config.notifications = {}
rbs.config.hud = {}
rbs.config.milestones = {}
rbs.config.milestones.settings = {}

rcs.config.language = "en"

--- main settings
rbs.config.enabled = true -- turn this off to disable the bounty system!
rbs.config.bountyonspawn = false -- do you want all players to start with a bounty when spawning?
rbs.config.isdarkrp = true -- are you playing on DarkRP?

--- milestones
rbs.config.milestones.settings.enabled = true -- do you want milestones 
rbs.config.milestones.settings.kills = 0 -- leave this at 0 if you have milestones enabled
rbs.config.milestones.settings.xp = 0 -- leave this at 0 if you have milestones enabled
rbs.config.milestones.settings.money = 0 -- leave this at 0 if you have milestones enabled

-- add as many milestones as you'd like
-- when a player reaches the first milestone they'll be given a bounty.
rbs.config.milestones[1] = {
    kills = 5,
    money = 250,
    xp = 150 -- only if you're using an XP system!
}

rbs.config.milestones[2] = {
    kills = 10,
    money = 500,
    xp = 250,
}

rbs.config.milestones[3] = {
    kills = 15,
    money = 1000,
    xp = 500,
}

--- notification settings (*THESE CAN BE ANNOYING*)
rbs.config.notifications.death = true -- notify players when someone with a bounty dies?
rbs.config.notifications.bounty = true -- notify players when someone gets a bounty?
rbs.config.notifications.kill = true -- notify players when someone with a bounty kills another player?

--- hud settings
rbs.config.hud.fpindicator = true -- do you want players having a first-person indicator that they've got a bounty?
rbs.config.hud.tpindicator = true -- do you want players seeing a third-person indicator that another player has a bounty?
rbs.config.hud.tpindicatordistancemin = 2000 -- min distance that the third-person indicator can be seen from
rbs.config.hud.tpindicatordistancemax = 8000 -- max distance that the third-person indicator can be seen from