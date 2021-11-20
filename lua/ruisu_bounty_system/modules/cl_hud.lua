-- third person indicator
hook.Add("HUDPaint", "ThirdPersonBountyIndicator", function()
    if not rbs.config.hud.tpindicator then return end

    for k, v in pairs(player.GetAll()) do
        if not v:RBSHasBounty() then
            local playerLoc = v:GetPos()
            local playerLocScr
            local distance = LocalPlayer():GetPos():Distance(v:GetPos())
            local offScreen = {
                above = false,
                below = false,
                right = false,
                left = false
            }

            playerLocScr = playerLoc

            cam.Start3D()
                playerLocScr = playerLocScr:ToScreen()
            cam.End3D()


            offScreen = {
                above = playerLocScr.y < 0,
                below = playerLocScr.y > ScrH(),
                right = playerLocScr.x > ScrW(),
                left = playerLocScr.x < 0
            }
    
            playerLocScr.x = math.Clamp( playerLocScr.x, 0, ScrW() )
            playerLocScr.y = math.Clamp( playerLocScr.y, 0, ScrH() )
    
            if !offScreen.above and !offScreen.below and !offScreen.right and !offScreen.left and distance > rbs.config.hud.tpindicatordistancemin and distance < rbs.config.hud.tpindicatordistancemax then
                if v:Alive() then
                    surface.SetTextColor( Color(255, 0, 0) )
                    surface.SetTextPos( playerLocScr.x -5, playerLocScr.y - 30)
                    surface.SetFont( "OverheadFont3" )
                    surface.DrawText( "☠" )
                end
            end
        else
            
        end
    end
end)

hook.Add("HUDPaint", "FirstPersonBountyIndicator", function()
    if not rbs.config.hud.fpindicator then return end

    if LocalPlayer():RBSHasBounty() then
        local cin = (math.sin(CurTime()) + 1) / 2

        local col = Color(255, 0, 0)
        puls = math.abs(math.sin(CurTime() * 1))
        local colpuls = Color(  col.r - (puls*130), col.g - (puls*130), col.b  - (puls*130))
        outcol = Color(0, 0, 0, 255)

        draw.SimpleText("You have a bounty on your head!", "CloseCaption_Bold", ScrW() / 2, 20, colpuls, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Current Killstreak: " .. LocalPlayer():RBSGetKillstreak(), "Trebuchet24", ScrW() / 2, 40, colpuls, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    else
        draw.SimpleText("Current Killstreak: " .. LocalPlayer():RBSGetKillstreak(), "Trebuchet24", ScrW() / 2, 20, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
end)