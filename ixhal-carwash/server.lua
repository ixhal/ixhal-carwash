RegisterNetEvent('carwash:DoVehicleWashParticles', function(vehNet, use_props)
    local src = source
    TriggerClientEvent('carwash:DoVehicleWashParticles', -1, vehNet, src, use_props)
end)

RegisterCallback('carwash:CanPurchaseCarWash', function(source, cb)
    local src = source
    local Player = GetPlayer(src)
    if (GetPlayerAccountBalance(Player, Config.cash_account_name) >= Config.cost or GetPlayerAccountBalance(Player, Config.bank_account_name) >= Config.cost) then
        if RemovePlayerMoney(Player, Config.cash_account_name, Config.cost, 'Washed Vehicle') then
            cb(true)
        elseif RemovePlayerMoney(Player, Config.bank_account_name, Config.cost, 'Washed Vehicle') then
            cb(true)
        end
    else
        cb(false)
    end
end)