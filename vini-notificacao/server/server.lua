local GRNCore = exports['rsg-core']:GetCoreObject() 
-- Função auxiliar para enviar notificações
local function enviarNotificacao(source, args, tipo, permissao)
    local xPlayer = GRNCore.Functions.GetPlayer(source)
    if not xPlayer then
        print("Erro: Jogador não encontrado.")
        return
    end

    -- Verifica se o jogador tem a permissão necessária
    if not permissao(xPlayer) then
        return
    end

    -- Concatena os argumentos para formar a mensagem
    local mensagem = table.concat(args, " ")

    if not mensagem or mensagem:match("^%s*$") then
        return
    end

    -- Envia a notificação para todos os jogadores usando o sistema personalizado
    TriggerClientEvent("notificacao:mostrar", -1, mensagem, tipo, 9000)
end

-- Comando: anuncio
RegisterCommand("anuncio", function(source, args, rawCommand)
    local xPlayer = GRNCore.Functions.GetPlayer(source)
    if not xPlayer then
        print("Erro: Jogador não encontrado.")
        return
    end

    local jobName = xPlayer.PlayerData.job.name

    -- Define os tipos de anúncios e suas permissões
    local anuncios = {
        medic = "boticario",
        armsaloontender = "empresa",
        tumsaloontender = "empresa",
        desertsaloontender = "empresa",
        appwoodcutter = "empresa",
        annlumberjack = "empresa",
        sblumberjack = "empresa",
        bslumberjack = "empresa",
        bwlumberjack = "empresa",
        gunsmith = "empresa",
        vallaw = "oficial",
        rholaw = "oficial",
        blklaw = "oficial",
        strlaw = "oficial",
        stdenlaw = "oficial",
        armlaw = "oficial",
        govenor5 = "juridico"
    }

    local tipo = anuncios[jobName]
    if tipo then
        enviarNotificacao(source, args, tipo, function() return true end)
    else
        print("Erro: Trabalho do jogador não tem permissão para enviar anúncios.")
    end
end, false)