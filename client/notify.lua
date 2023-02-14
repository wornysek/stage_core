SendNotification = print

CreateThread(function()
    if SETTINGS.UseDefaultNotification then
        SendNotification = function(text, type, duration)
            AddTextEntry('stage_notify', text)
            BeginTextCommandDisplayHelp('stage_notify')
            EndTextCommandDisplayHelp(0, false, false, duration)
        end
    elseif GetResourceState("es_extended") == "started" then
        ESX = exports['es_extended']:getSharedObject()
        SendNotification = ESX.ShowNotification
    elseif GetResourceState("qb-core") == "started" then
        QBCore = exports['qb-core']:GetCoreObject()
        SendNotification = QBCore.Functions.Notify
    else
        for i=1,5 do
            Debug("Any of supported frameworks was found. Make sure that framework is started and defined in client/notify.lua", "error")
        end
    
        DependeciesLoaded = false
    end

    exports("SendNotification", SendNotification)
end)