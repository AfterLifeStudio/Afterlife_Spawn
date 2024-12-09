
---@return table
GetMapLocations = function ()
    local locationcfg = Config.Spawn
    local options = {}

    for i = 1,#locationcfg do
        local data = locationcfg[i]
        options[#options+1] = {
            id = data.id,
            label = data.label,
            img = data.img
        }
    end

    return options
end