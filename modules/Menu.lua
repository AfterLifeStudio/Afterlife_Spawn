

local Cam = nil
local Currentspawn = 0
Currentanim = nil

RegisterCommand('copyaxis', function()
    ClearFocus()
    local camRot = GetGameplayCamRot(0)
    local string = string.format("vector3(%f,%f,%f)", camRot.x, camRot.y, camRot.z)
    AnimpostfxStop('CamPushInNeutral')
    Nuimessage('copy', string)
end)

---@param data table
PreviewCam = function(data)
    local coords = data.previewcoords
    local rotations = data.previewrotations
    local weeather = data.weather
    local time = data.time
    local spawncoords = data.spawnlocation
    local anim = data.anim

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

    if spawncoords then
    SetEntityCoords(ped, spawncoords.x, spawncoords.y, spawncoords.z - 1, 0.0, 0.0, 0.0, true)
    SetEntityHeading(ped, spawncoords.w)
    end

    FreezeEntityPosition(ped, true)
    if anim then
        Currentanim = anim
    end
    TaskStartScenarioInPlace(ped, anim, -1, false)
    SetEntityVisible(ped, true)

    return Cam
end

local LastLocation = function()

    local lastlocation = GetLastLocation()

        local data = {
            time = {
                seconds = 0,
                minutes = 0,
                hours = 21,
            },
            weather = 'EXTRASUNNY',
            previewcoords = vector3(lastlocation.x, lastlocation.y, lastlocation.z + 3),
            previewrotations = vector3(10.540741, -0.000000, 86.52),
            spawnlocation = vector4(lastlocation.x, lastlocation.y, lastlocation.z, 0),
        }
        PreviewCam(data)
   
end


RegisterNUICallback('preview', function(data, cb)
    if Currentspawn == data.id then return end

    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)

    Currentspawn = data.id
    local locations = {}

    if data.catagory == 'map' then
        locations = Config.Spawn
    elseif data.catagory == 'saved' then
        locations = GetSavedLocations()
    elseif data.catagory == 'apartment' then
        locations = Config.Apartment
    elseif data.catagory == 'lastlocation' then
        LastLocation()
        goto skip
    end


    for i = 1, #locations do
        if locations[i].id == data.id then
            PreviewCam(locations[i])
            break
        end
    end

    ::skip::

    cb { {} }
end)


RegisterNUICallback('play', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    SetNuiFocus(false, false)
    if (data == 'map' or data == 'lastlocation' or data == 'saved') then
        SpawnPlayer(Cam)
    elseif data == 'apartment' then
        EnterApartment(cam, Currentspawn)
    elseif data == 'property' then
        EnterProperty(cam, Currentspawn)
    else
        SpawnPlayer(Cam)
    end

    cb { {} }
end)

RegisterNUICallback('hover', function(data, cb)
    PlaySoundFromEntity(-1, "Cycle_Item", cache.ped, 'DLC_Dmod_Prop_Editor_Sounds', 0, 0)
    cb { {} }
end)

RegisterNUICallback('click', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    cb { {} }
end)



ShowMenu = function(userid, new)
    DisplayRadar(false)
    DisableWeatherSync()

    if IsPlayerDead() then
        SpawnDead()
        return
    end

    if IsPlayerJailed() then
        JailMenu()
        return
    end



    local data
    if new and Config.Apartmentstart then
        data = {
            visible = true,
            catagory = 'apartment',
            apartment = GetAppartmentLocations()
        }
        PreviewCam(Config.Apartment[1])
    else
        data = {
            visible = true,
            catagory = 'map',
            map = GetMapLocations(),
            property = GetPropertyLocations(userid),
            saved = GetSavedLocationsUi()
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
    ShowMenu(playerdata.citizenid, false)
end)
