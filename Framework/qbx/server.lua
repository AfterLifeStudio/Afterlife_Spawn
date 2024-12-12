if Config.framework == 'qbx' then

    lib.callback.register('SpawnMenu:Server:GetLastLocation', function(source)
        local player = exports.qbx_core:GetPlayer(source)
        local queryResult = MySQL.single.await('SELECT position FROM players WHERE citizenid = ?', { player.PlayerData.citizenid })
        local position = json.decode(queryResult.position)
   
    
        return position
      end)
    
end
