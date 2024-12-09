fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'shared.lua'
}


client_scripts {
    'util/util.lua',
    'Framework/qb/client.lua',
    'Framework/esx/client.lua',
    'modules/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
    'Framework/qb/server.lua',
    'Framework/esx/server.lua',
}

escrow_ignore {
    'shared.lua'
}

ui_page 'ui/dist/index.html'

files {
    'ui/dist/index.html',
    'ui/dist/assets/*.css',
    'ui/dist/assets/*.js',
    'ui/dist/assets/*.png',
    'ui/dist/assets/*.ttf',
    'ui/dist/assets/*.otf',
    'ui/images/*.png',
}


provide 'qb-spawn'