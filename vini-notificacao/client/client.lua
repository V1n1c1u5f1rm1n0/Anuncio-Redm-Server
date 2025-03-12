local RSGShared = exports['rsg-core']:GetCoreObject()
local RSGCore = exports['rsg-core']:GetCoreObject()


RegisterNetEvent('notificacao:mostrar')
AddEventHandler('notificacao:mostrar', function(message, tipo, duracao)
    SendNUIMessage({
        action = "mostrarNotificacao",
        message = message,
        tipo = tipo,
        duracao = duracao or 10000
    })
end)

