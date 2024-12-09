

Nuimessage = function (type,data)
    SendNUIMessage({
        action = type,
        data = data
    })
end

Nuicontrol = function (state)
    SetNuiFocus(state, state)
end
