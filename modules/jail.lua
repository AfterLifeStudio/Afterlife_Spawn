function JailMenu()
    local location = Config.Jail
    local cam = PreviewCam(location)

    DoScreenFadeIn(1000)
    Nuimessage('Jail', true)

    while true do
        if IsControlJustPressed(1, 215) then
            Nuimessage('Jail', false)
            SpawnPlayer(cam)
            break;
        end
        Wait(0)
    end

end





-- set island hopper config
SetIslandEnabled('HeistIsland', true) -- or use false to disable it
-- instead of using island hopper you can *also* just load the IPLs mentioned in islandhopper.meta yourself somewhat
  
-- switch radar interior
SetUseIslandMap(true)

-- misc natives
SetAiGlobalPathNodesType(1)
-- LoadGlobalWaterType(1)
SetScenarioGroupEnabled('Heist_Island_Peds', true)

-- audio stuff
SetAudioFlag('PlayerOnDLCHeist4Island', true)
SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Zones', true, true)
SetAmbientZoneListStatePersistent('AZL_DLC_Hei4_Island_Disabled_Zones', false, true)