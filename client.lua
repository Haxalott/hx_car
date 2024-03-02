RegisterCommand('car', function(source,args)
    local vehicleName = args[1] or 'adder'

    if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
        lib.notify({
            title = vehicleName ..' Is not a valid vehicle name',
            type = 'error'
        })

        return
    end

    RequestModel(vehicleName)

    while not HasModelLoaded(vehicleName) do
        wait(10)
    end

    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)

    local vehicle = CreateVehicle(
        vehicleName,
        pos,
        heading,
        true
    )

    SetPedIntoVehicle(playerPed, vehicle, -1)

    SetModelAsNoLongerNeeded(vehicleName)
end)
