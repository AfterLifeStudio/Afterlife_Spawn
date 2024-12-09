SpawnPlayer = function(cam)
    SetNuiFocus(false, false)
    RenderScriptCams(false, true, 3000, true, true)
    SetCamActive(cam, false)
    ClearFocus()
    
    Wait(3000)
    ClearPedTasks(PlayerPedId())
    Wait(2000)
    FrameworkSpawn()
end



FrameworkSpawn = function()
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
end
