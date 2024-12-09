if Config.framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()

    RegisterNetEvent('qb-spawn:client:setupSpawns', function(cData, new)
        print(json.encode(cData))
        ShowMenu(cData.citizenid,new)
    end)

end
