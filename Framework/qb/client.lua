if Config.framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()

    RegisterNetEvent('qb-spawn:client:setupSpawns', function(cData, new)
        ShowMenu(new, cData.citizenid)
    end)

    GetPlayerJob = function()
        local player = QBCore.Functions.GetPlayerData()
        return player.job.name
    end

    GetLastLocation = function()
        local player = QBCore.Functions.GetPlayerData()
        return player.position
    end

    IsPlayerJailed = function()
        local state = true
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.metadata.injail == 0 then
                state = false
            end
        end)

        return state
    end

    IsDead = function()
        local state = false
        QBCore.Functions.GetPlayerData(function(PlayerData)
            if PlayerData.metadata.inlaststand or PlayerData.metadata.isdead then
                state = true
            end
        end)
        return state
    end

    DisableWeatherSync = function ()
        TriggerEvent('qb-weathersync:client:DisableSync')
    end

    EnableWeatherSync = function ()
        TriggerEvent('qb-weathersync:client:EnableSync')
    end
end
