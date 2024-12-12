if Config.framework == 'qbx' then


    RegisterNetEvent('qb-spawn:client:setupSpawns', function(cData, new)
        ShowMenu(new, cData.citizenid)
    end)

    GetPlayerJob = function()
        local player = QBX.PlayerData
        return player.job.name
    end

    GetLastLocation = function()
        local lastlocation = lib.callback.await('SpawnMenu:Server:GetLastLocation')
        return lastlocation
    end

    IsPlayerJailed = function()
        local state = true

        if QBX.PlayerData.metadata.injail == 0 then
            state = false
        end

        return state
    end

    IsDead = function()
        local state = false

        if QBX.PlayerData.metadata.inlaststand or PlayerData.metadata.isdead then
            state = true
        end

        return state
    end

    DisableWeatherSync = function()
        TriggerEvent('qb-weathersync:client:DisableSync')
    end

    EnableWeatherSync = function()
        TriggerEvent('qb-weathersync:client:EnableSync')
    end
end
