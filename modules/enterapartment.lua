
EnterApartment = function(cam,id)
    local ped = PlayerPedId()
    local data = Config.Apartment
    local label

    DoScreenFadeOut(500)
    Wait(500)
    ClearFocus()

    RenderScriptCams(false, true, 0, true, true)
    SetCamActive(cam, false)
    ClearPedTasks(ped)
    SetEntityVisible(ped, true,false)


    for i = 1,#data do
        if id == data[i].id then
            label = data[i].label
            break
        end
    end

    TriggerServerEvent("apartments:server:CreateApartment", id, label, true)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
end

