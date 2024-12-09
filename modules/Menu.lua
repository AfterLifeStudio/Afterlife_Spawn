local Cam = nil
local currentspawn = 0

RegisterCommand('c', function()
    ClearFocus()
    local camRot = GetGameplayCamRot(0)
    local string = string.format("vector3(%f,%f,%f)", camRot.x, camRot.y, camRot.z)

    Nuimessage('copy', string)
end)

---@param data table
local PreviewCam = function(data)
    local coords = data.previewcoords
    local rotations = data.previewrotations
    local weeather = data.weather
    local time = data.time
    local spawncoords = data.spawnlocation
    local ped = PlayerPedId()

    SetOverrideWeather(weeather)
    NetworkOverrideClockTime(time.hours, time.minutes, time.seconds)
    SetFocusPosAndVel(coords.x, coords.y, coords.z, 0, 0, 0)
    SetEntityVisible(ped, false)

    Cam = CreateCamWithParams('DEFAULT_SCRIPTED_CAMERA', coords.x, coords.y, coords.z, rotations.x, rotations.y,
        rotations.z, 50.0, true, 0)
    SetTimecycleModifier('MIDDAY')
    SetCamUseShallowDofMode(Cam, true)
    SetCamNearDof(Cam, 0.4)
    SetCamFarDof(Cam, 1.8)
    SetCamDofStrength(Cam, 0.7)
    SetCamActive(Cam, true)
    RenderScriptCams(true, false, 0, true, true)

    SetEntityCoords(ped, spawncoords.x, spawncoords.y, spawncoords.z, 0.0, 0.0, 0.0, true)
    SetEntityHeading(ped, spawncoords.z)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_LEANING_CASINO_TERRACE', -1, false)
    SetEntityVisible(ped, true)
end


local LastLocation = function()
    QBCore.Functions.GetPlayerData(function(player)
        ped = PlayerPedId()

        local data = {
            time = {
                seconds = 0,
                minutes = 0,
                hours = 21,
            },
            weather = 'EXTRASUNNY',
            previewcoords = vector3(player.position.x, player.position.y, player.position.z + 3),
            previewrotations = vector3(10.540741, -0.000000, 86.52),
            spawnlocation = vector4(player.position.x, player.position.y, player.position.z, player.position.w),
        }
        PreviewCam(data)
    end)
end


RegisterNUICallback('preview', function(data, cb)
    if currentspawn == data.id then return end

    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)

    currentspawn = data.id
    local locations = {}

    if data.catagory == 'map' then
        locations = Config.Spawn
    elseif data.catagory == 'saved' then
        locations = GetSavedLocations()
    elseif data.catagory == 'apartment' then
        locations = Config.Apartment
    elseif data.catagory == 'lastlocation' then
        LastLocation()
    end


    for i = 1, #locations do
        if locations[i].id == data.id then
            PreviewCam(locations[i])
            break
        end
    end

    cb { {} }
end)


RegisterNUICallback('play', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    SetNuiFocus(false, false)
    if (data == 'map' or data == 'lastlocation' or data == 'saved') then
        SpawnPlayer(Cam)
    elseif data == 'apartment' then
        EnterApartment(cam, currentspawn)
    elseif data == 'property' then
        EnterProperty(cam, currentspawn)
    else
        SpawnPlayer(Cam)
    end

    cb { {} }
end)

RegisterNUICallback('hover', function(data, cb)
    PlaySoundFromEntity(-1, "Cycle_Item", cache.ped, 'DLC_Dmod_Prop_Editor_Sounds', 0, 0)
    cb { {} }
end)



ShowMenu = function(userid, new)
    DisplayRadar(false)
    TriggerEvent('qb-weathersync:client:DisableSync')

    local data

    if new and Config.Apartmentstart then
        data = {
            visible = true,
            catagory = 'apartment',
            apartment = Config.Apartment
        }
        PreviewCam(Config.Apartment[1])
    else
        data = {
            visible = true,
            catagory = 'map',
            map = GetMapLocations(),
            property = GetPropertyLocations(userid),
            saved = GetSavedLocations()
        }
        PreviewCam(Config.Spawn[1])
    end





    DoScreenFadeIn(1000)
    SetNuiFocus(true, true)
    Nuimessage('visible', data)
end


local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand('test', function()
    local playerdata = QBCore.Functions.GetPlayerData()
    print(playerdata.citizenid)
    ShowMenu(playerdata.citizenid, false)
end)
