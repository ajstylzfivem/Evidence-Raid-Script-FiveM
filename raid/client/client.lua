print('RAID CLIENT LOADED')

local QBCore = exports['qb-core']:GetCoreObject()
local showingNotify = false


RegisterNetEvent('evidence:startHack', function()

    QBCore.Functions.TriggerCallback(
        'evidence:hasLaptop',
        function(hasItem)

            if not hasItem then

                QBCore.Functions.Notify(
                    'You need a Police Breach Laptop',
                    'error'
                )

                return
            end

            local success = exports['qb-minigames']:Skillbar()

            if success then

                TriggerServerEvent('evidence:startRaid')

                QBCore.Functions.Notify(
                    'Police systems breached',
                    'success'
                )

            else

                QBCore.Functions.Notify(
                    'Hack failed',
                    'error'
                )

            end
        end
    )
end)

CreateThread(function()

    local hackCoords = vector3(440.93, -978.55, 30.68)

    while true do

        local sleep = 1000

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local dist = #(coords - hackCoords)

        local PlayerData = QBCore.Functions.GetPlayerData()

if dist <= 2.0 and PlayerData.job.name ~= 'police' then

    sleep = 0

    if not showingNotify then

        showingNotify = true

        QBCore.Functions.Notify(
            '[E] infiltrate the Police System',
            'primary',
            5000
        )

    end

    if IsControlJustReleased(0, 38) then
        TriggerEvent('evidence:startHack')
    end

else

    showingNotify = false

end


Wait(sleep)

    end
end)

function DrawText3D(x, y, z, text)

    SetTextScale(18, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)

    SetTextEntry("STRING")
    SetTextCentre(true)

    AddTextComponentString(text)

    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)

    local factor = (string.len(text)) / 370

    DrawRect(
        0.0,
        0.0125,
        0.017 + factor,
        0.03,
        0,
        0,
        0,
        75
    )

    ClearDrawOrigin()

end