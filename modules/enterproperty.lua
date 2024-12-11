EnterProperty = function(cam,id)
    local ped = PlayerPedId()
    SetNuiFocus(false, false)
    DoScreenFadeOut(500)
    ClearFocus()
    Wait(5000)

    RenderScriptCams(false, true, 0, true, true)
    SetCamActive(cam, false)
    ClearPedTasks(ped)
    FreezeEntityPosition(ped,false)
    SetEntityVisible(ped, true,false)


    TriggerEvent('qb-houses:client:enterOwnedHouse', id)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
    TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
end