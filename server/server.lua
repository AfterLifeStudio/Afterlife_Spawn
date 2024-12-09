
lib.callback.register('SpawnMenu:GetOwnedProperty', function(source,userid)
    local next = next
    local properties = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', { userid })

    if next(properties) == nil then
        properties = false
    end
    return properties
end)

lib.callback.register('SpawnMenu:GetSavedLocations', function(source,userid)
    local next = next
    local savedlocations = MySQL.query.await('SELECT * FROM saved_locations WHERE userid = ?', { userid })

    if next(savedlocations) == nil then
        savedlocations = false
    end
    return savedlocations
end)

lib.callback.register('SpawnMenu:AddSavedLocation', function(source,userid,locationid,locationdata)
    local response = MySQL.insert.await('INSERT INTO `saved_locations` (userid, locationid, locationdata) VALUES (?, ?)', {userid, locationid, locationdata})
    return response
end)

lib.callback.register('SpawnMenu:RemoveSavedLocation', function(source,userid,locationid)
    local response = MySQL.query.await('DELETE FROM saved_locations WHERE (userid, locationid) = (?, ?)', {userid,locationid})
    return response
end)
