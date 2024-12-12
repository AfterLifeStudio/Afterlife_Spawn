---@return any
---@param userid string
GetPropertyLocations = function(userid)

    if Config.framework == 'esx' then
        return  false
    end

    local Properties = lib.callback.await('SpawnMenu:GetOwnedProperty', false, userid)
    local options = {}

    if Properties then
        for i = 1, #Properties do
            local data = Properties[i]
            options[#options + 1] = {
                id = data.house,
                label = data.house
            }
        end
    else
        options = false
    end

    return options
end
