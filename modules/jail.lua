function JailMenu()
    local location = Config.Jail
    local cam = PreviewCam(location)

    DoScreenFadeIn(1000)
    Nuimessage('Jail', true)

    while true do
        if IsControlJustPressed(1, 215) then
            Nuimessage('Jail', false)
            SpawnPlayer(cam)
            break;
        end
        Wait(0)
    end

end


