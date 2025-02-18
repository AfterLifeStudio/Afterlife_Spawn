lib.callback.register('SpawnMenu:GetOwnedProperty', function(source, userid)
    local properties = false

    pcall(function()
        properties = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', { userid })


        if next(properties) == nil then
            properties = false
        end
    end)

    return properties
end)
