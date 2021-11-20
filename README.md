#Make your top fraggers targets with this addon!
ruisu's Bounty System is a fully customisable addon that adds a mechanic similar to the mental state from GTA V. Players who surpass a certain killstreak will be marked with a bounty, and can be seen by anyone within range making them a target. Killing someone with a bounty will reward you with both XP and money.

##HUD Indicators
!(fp indicator)[https://i.imgur.com/07rYDNU.png]
First person indicator. No bounty
!(fp indicator bounty)[https://i.imgur.com/z90JVkz.png]
First person indicator. Has bounty.
!(tp indicator bounty)[https://i.imgur.com/sibUtOr.png]
Third person indicator. Has bounty

##Milestones!
!(milestones)[https://i.imgur.com/Zk7FY97.png]
In the config, you can define an infinite amount of milestones - which when reached will grant rewards such as money and XP. Milestones can be disabled, and when done so players can define a simpler value for whenever a player kills someone when they're on a streak.

##Functions
Should you wish to tinker with the addon, or integrate it into another addon I have added functions to make it easier to do so.
```
ply:RBSHasBounty() -- returns true or false
ply:RBSSetBounty(bool) -- sets the bounty value
ply:RBSGetKillstreak() -- returns the player's current killstreak
ply:RBSSetKillstreak() -- sets the killstreak value
ply:RBSIncrementKillstreak() -- increments the killstreak by one
ply:RBSGetCurrentMilestone() -- returns the player's current milestone number
```

##Modularity
I've designed the addon with updates in mind, so if you wish to add features just download the source code and create a new Lua script under the "modules" folder. The addon will automatically detect this script.

##Current Addon Support
- DarkRP
- DarkRP Levelling System
- Feel free to contact me if you'd like me to integrate support with any other addons!

##Config
!(config)[https://i.imgur.com/sEQ5Q6O.png]

##Planned Updates
- Language Support
- Reworked HUD
- Advanced Milestones
