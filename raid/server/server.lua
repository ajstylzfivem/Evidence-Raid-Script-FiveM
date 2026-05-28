


local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback(
    'evidence:hasLaptop',
    function(source, cb)

        local Player = QBCore.Functions.GetPlayer(source)

        if not Player then
            cb(false)
            return
        end

        local item = Player.Functions.GetItemByName(
            'police_laptop'
        )

        cb(item ~= nil)

    end
)

RegisterNetEvent('evidence:startRaid', function()

    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        return
    end

    local oldJob = Player.PlayerData.job.name
    local oldGrade = Player.PlayerData.job.grade.level

    Player.Functions.SetJob('police', 0)

    TriggerClientEvent(
        'QBCore:Notify',
        src,
        'Temporary police access granted',
        'success'
    )

    SetTimeout(50000, function()

local Player = QBCore.Functions.GetPlayer(src)

if Player then

    Player.Functions.SetJob(oldJob, oldGrade)

    TriggerClientEvent(
        'QBCore:Notify',
        src,
        'Police system access revoked',
        'error'
    )

end

end)

end)