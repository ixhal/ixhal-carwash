local server = IsDuplicityVersion()

if Config.Framework == 'qbcore' then
    Framework = exports['qb-core']:GetCoreObject()

    if not server then
        PlayerData = Framework.Functions.GetPlayerData()

        Notify = function(txt, notif_type, time)
            Framework.Functions.Notify(txt, notif_type, time)
        end

        TriggerCallback = function(cb_name, f, ...)
            Framework.Functions.TriggerCallback(cb_name, f,...)
        end
    else
        RegisterCallback = function(cb_name, f)
            Framework.Functions.CreateCallback(cb_name, f)
        end

        Notify = function(src, txt, notif_type, time)
            TriggerClientEvent('QBCore:Notify', src, txt, notif_type, time)
        end

        GetPlayer = function(id)
            if type(id) == 'number' then
                return Framework.Functions.GetPlayer(id)
            else
                return Framework.Functions.GetPlayerByCitizenId(id)
            end
        end

        GetPlayerAccountBalance = function(player, account)
            return player.Functions.GetMoney(account)
        end

        RemovePlayerMoney = function(player, account, amount)
            return player.Functions.RemoveMoney(account, amount, 'Money removed from ixhal-drugsales.. This should not happen.')
        end
    end
end

if Config.Framework == 'esxlegacy' then
    Framework = exports['es_extended']:getSharedObject()

    if not server then
        PlayerData = Framework.GetPlayerData()

        Notify = function(txt, notif_type, time)
            TriggerEvent('esx:showNotification', txt, notif_type)
        end

        TriggerCallback = function(cb_name, f, ...)
            Framework.TriggerServerCallback(cb_name, f,...)
        end
    else
        RegisterCallback = function(cb_name, f)
            Framework.RegisterServerCallback(cb_name, f)
        end
        Notify = function(src, txt, notif_type, time)
            TriggerClientEvent('esx:showNotification', src, txt, notif_type)
        end

        GetPlayer = function(id)
            if type(id) == 'number' then
                return Framework.GetPlayerFromId(id)
            else
                return Framework.GetPlayerFromIdentifier(identifier)
            end
        end

        GetPlayerAccountBalance = function(player, account)
            return player.getAccount(account).money
        end

        RemovePlayerMoney = function(player, account, amount)
            player.removeAccountMoney(account, amount)
            return true
        end
    end
end