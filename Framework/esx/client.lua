if Config.framework == 'esx' then
    local ESX = exports["es_extended"]:getSharedObject()

    local lastlocation

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(playerData)
     lastlocation = playerData.coords
    end)

    Updatelastlocation = function ()
        local player = ESX.PlayerData
        lastlocation = player.coords
    end

    GetPlayerJob = function()
        local player = ESX.PlayerData
        return player.job.name
    end

    GetLastLocation = function()
        return lastlocation
    end

    IsPlayerJailed = function()
        local state = false
        return state
    end

    IsDead = function()
        local state = IsPlayerDead(PlayerId())
        return state
    end

    DisableWeatherSync = function ()
   
    end

    EnableWeatherSync = function ()
   
    end


end
