fx_version 'cerulean'
games {'rdr3'}

author 'rsg-anuncio'
description 'Sistema de Notificação'
version '1.0.0'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script 'client/client.lua'
server_script 'server/server.lua'

-- Página HTML principal que centraliza os templates
ui_page 'html/index.html'

files {
    'html/index.html',
    'html/index.js',
    'html/boticario.html',
    'html/empresa.html',
    'html/juridico.html',
    'html/oficial.html',
    'html/script.js',
    'html/style.css',

    -- Fontes e imagens 
    'html/Fontes/**',
    'html/img/**'
}
