---@return table
GetMapLocations = function()
    local locationcfg = Config.Spawn
    local options = {}
 
    for i = 1, #locationcfg do
        local data = locationcfg[i]

        if data.job == GetPlayerJob() or data.job == false then
            options[#options + 1] = {
                id = data.id,
                label = data.label,
                img = '../images/' .. data.id .. '.png'
            }
        end
    end

    return options
end


---@return table
GetAppartmentLocations = function()
    local locationcfg = Config.Apartment
    local options = {}

    for i = 1, #locationcfg do
        local data = locationcfg[i]
        options[#options + 1] = {
            id = data.id,
            label = data.label,
            img = '../images/' .. data.id .. '.png'
        }
    end

    return options
end



---@return table
GetSavedLocationsUi = function()
    local locationcfg = GetSavedLocations()
    local options = {}

    if locationcfg == nil or next(locationcfg) == nil then
        return false
    end

    for i = 1, #locationcfg do
        local data = locationcfg[i]

        options[#options + 1] = {
            id = data.id,
            label = data.name,
            img = data.img
        }
    end


    return options
end
