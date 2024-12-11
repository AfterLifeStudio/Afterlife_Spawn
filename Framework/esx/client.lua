if Config.framework == 'esx' then
    local ESX = exports["es_extended"]:getSharedObject()

    IsPlayerJailed = function ()
        return false
    end



end
