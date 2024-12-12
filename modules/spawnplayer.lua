

SpawnPlayer = function(cam)
    local ped = PlayerPedId()

    SetGameplayCamRelativeHeading(9)
    SetNuiFocus(false, false)
    RenderScriptCams(false, true, 3000, true, true)
    SetCamActive(cam, false)
    ClearFocus()

    Wait(3000)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    while IsPedUsingScenario(ped, Currentanim) do
        Wait(100)
    end
    FrameworkSpawn()
end


SpawnDead = function()

    local lastlocation = GetLastLocation()
    local ped = PlayerPedId()

    SetEntityCoords(ped, lastlocation.x, lastlocation.y, lastlocation.z, 0.0, 0.0, 0.0, true)
    SetEntityHeading(ped, lastlocation.w)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped, false)
    ClearFocus()

    DoScreenFadeIn(1000)
    Wait(1000)
    FrameworkSpawn()
end


FrameworkSpawn = function()
    AnimpostfxPlay('SwitchSceneMichael',2000,false)
    PlaySoundFromEntity(-1, "1st_Person_Transition", cache.ped, 'PLAYER_SWITCH_CUSTOM_SOUNDSET', 0, 0)
    EnableWeatherSync()
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
end
