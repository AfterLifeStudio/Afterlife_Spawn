if not Config.SavedLocations then return end

local mode = 'new'
local editingid = ''

previewrot, previewcoords, coords = nil, nil, nil


---@return boolean
GetSavedLocations = function()
    local cachedata = GetResourceKvpString('Spawn:Saved:Data')
    local data = json.decode(cachedata)

    return data
end






local createlocation = function(new)
    local data = GetSavedLocations()

    if mode == 'new' then
        local id = new.name .. math.random(10000, 500000)

        if not data then
            data = {}
        end

        data[#data + 1] = {
            id = id,
            name = new.name,
            img = new.img,
            time = Config.defualtsaved.time,
            weather = Config.defualtsaved.weather,
            previewcoords = previewcoords,
            previewrotations = previewrot,
            spawnlocation = coords,
        }
    else
        for i = 1, #data do
            if data[i].id == editingid then
                data[i] = {
                    id = editingid,
                    name = new.name,
                    img = new.img,
                    time = Config.defualtsaved.time,
                    weather = Config.defualtsaved.weather,
                    previewcoords = previewcoords,
                    previewrotations = previewrot,
                    spawnlocation = coords,
                }

                break
            end
        end
    end

    SetResourceKvp('Spawn:Saved:Data', json.encode(data))
end


local opensavedlocations = function()
    local locations = GetSavedLocations()

    local options = {}

    if locations then
        for i = 1, #locations do
            options[#options + 1] = {
                id = locations[i].id,
                label = locations[i].name,
                img = locations[i].img
            }
        end
    end

    SetNuiFocus(true, true)

    Nuimessage('Spawnlist', { visible = true, locations = options })
end

RegisterCommand('createspawn', opensavedlocations)







local deletelocation = function(id)
    local data = GetSavedLocations()

    for i = 1, #data do
        if data[i].id == id then
            table.remove(data, i)
            break
        end
    end

    SetResourceKvp('Spawn:Saved:Data', json.encode(data))
    opensavedlocations()
end







local previewcreator = false

RegisterNUICallback('previewcreator', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)

    local state = false
    local ped = PlayerPedId()
    local pedcoords = GetEntityCoords(ped)
    coords = vec3(pedcoords.x, pedcoords.y, pedcoords.z)
    local camview = GetFollowPedCamViewMode()

    previewcreator = true

    SetNuiFocus(false, false)


    local playerDummy = ClonePed(PlayerPedId(), false, false, true)
    SetEntityCoords(playerDummy, coords.x, coords.y, coords.z - 1)
    FreezeEntityPosition(playerDummy, true)
    SetBlockingOfNonTemporaryEvents(playerDummy, true)
    SetEntityInvincible(playerDummy, true)

    while previewcreator do
        SetFollowPedCamViewMode(4)
        DisableControlAction(0, 194, true)
        DisableControlAction(0, 0, true)
        HideHudAndRadarThisFrame()
        SetPauseMenuActive(false)

        if IsControlJustPressed(1, 215) then
            local camRot = GetGameplayCamRot(0)
            previewrot = vector3(camRot.x, camRot.y, camRot.z)
            previewcoords = GetEntityCoords(ped)
            state = true
            previewcreator = false
        end

        if IsDisabledControlJustPressed(0, 194) then
            state = false
            previewcreator = false
        end

        Wait(0)
    end

    DeleteEntity(playerDummy)
    SetFollowPedCamViewMode(camview)
    SetNuiFocus(true, true)
    cb(state)
end)


RegisterNUICallback('save', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    SetNuiFocus(false, false)
    createlocation(data)
    cb { {} }
end)



RegisterNUICallback('ExitCreateSpawn', function(data, cb)
    opensavedlocations()
    cb { {} }
end)



RegisterNUICallback('createlocation', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    mode = 'new'
    SetNuiFocus(true, true)
    local location = {
        name = '',
        img = '',
        previewcoords = false
    }
    Nuimessage('UpdateSpawn', location)
    Nuimessage('CreateSpawn', true)
    cb { {} }
end)

RegisterNUICallback('editlocation', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    mode = 'editing'
    editingid = data
    local locations = GetSavedLocations()

    for i = 1, #locations do
        if locations[i].id == editingid then
            Nuimessage('UpdateSpawn', locations[i])
            break
        end
    end

    SetNuiFocus(true, true)
    Nuimessage('CreateSpawn', true)
    cb { {} }
end)


RegisterNUICallback('ExitSpawnlist', function(data, cb)
    SetNuiFocus(false, false)
    cb { {} }
end)


RegisterNUICallback('deletelocation', function(data, cb)
    PlaySoundFromEntity(-1, "BACK", cache.ped, "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0)
    deletelocation(data)
    cb { {} }
end)


