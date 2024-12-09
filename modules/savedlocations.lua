local mode = 'new'
local editingid = ''




---@return boolean
GetSavedLocations = function ()
    local cachedata = GetResourceKvpString('Spawn:Saved:Data')
    local data = json.decode(cachedata)

    return data
end





local deletelocation = function ()
    
end


local createlocation = function(new)
    local data = GetSavedLocations()
    
    if mode == 'new' then
        local id = new.name..math.random(10000,500000)

        if not data then
            data = {}
        end

        data[#data+1] = {
            id = id, 
            name = new.name,
            img = new.img,
            time = Config.defualtsaved.time,
            weather = Config.defualtsaved.weather,
            previewcoords = 'a',
            previewrotations = 'a',
            spawnlocation = 'a',
        }
    end

    SetResourceKvp('Spawn:Saved:Data', json.encode(data))
end


local opensavedlocations = function()

    local locations = GetSavedLocations()

    local options = {
        {
            title = '+ create location',
            onSelect = function ()
                SetNuiFocus(true, true)
                Nuimessage('CreateSpawn', true)
            end
        },
    }

    if locations then

    for i = 1, #locations do
        options[#options+1] = {
            title = locations[i].name,
            onSelect = function ()
                editingid = locations[i].id
                SetNuiFocus(true, true)
                Nuimessage('UpdateSpawn', locations[i])
                Nuimessage('CreateSpawn', true)
            end
        }
    end

end

    lib.registerContext({
        id = 'createlocation',
        title = 'createlocation',
        options = options
    })

      lib.showContext('createlocation')
end


RegisterCommand('createspawn', opensavedlocations)







local previewcreator = false

RegisterNUICallback('previewcreator', function (data ,cb)

    local state = false
    local camview = GetFollowPedCamViewMode()

    previewcreator = true

    SetNuiFocus(false,false)

    while previewcreator do

        SetFollowPedCamViewMode(4)
        DisableControlAction(0,194,true)
        DisableControlAction(0,0,true)
        HideHudAndRadarThisFrame()
        SetPauseMenuActive(false)
        
        if IsControlJustPressed(1,215) then
            state = true
            previewcreator = false
        end

        if IsDisabledControlJustPressed(0,194) then
            state = false
            previewcreator = false
        end
        
        Wait(0)
    end


    SetFollowPedCamViewMode(camview)
    SetNuiFocus(true,true)
    cb(state)
end)


RegisterNUICallback('save', function (data ,cb)
    SetNuiFocus(false, false)
    createlocation(data)
    cb{{}}
end)
