Config = {}

GetFramework = function()
    if GetResourceState('es_extended') ~= 'missing' then
        return 'esx'
    elseif GetResourceState('qb-core') ~= 'missing' then
        return 'qb'
    else
        return 'qbx'
    end
end

Config.framework = GetFramework() -- qb / esx /qbox

Config.Apartmentstart = true
Config.SavedLocations = false

Config.weathertime = true
Config.spawneffect = true

Config.defualtsaved = { ------default configuration for players personal saved locations
    anim = 'WORLD_HUMAN_DRINKING',
    time = {
        seconds = 0,
        minutes = 0,
        hours = 21,
    },
    weather = 'EXTRASUNNY',
}

Config.Jail = {
    anim = 'PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS',
    time = {
        seconds = 0,
        minutes = 0,
        hours = 21,
    },
    weather = 'EXTRASUNNY',
    previewcoords = vector3(1622.9805, 2549.9250, 45.5649),
    previewrotations = vector3(2.913854, 0.054161, -101.034904),
    spawnlocation = vector4(1640.8562, 2532.5867, 44.9486, 232.7152),
}

Config.Spawn = {

    {
        id = 'mazebank',
        label = 'Maze Bank',
        job = false,
        anim = 'WORLD_HUMAN_BINOCULARS',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 19,
        },
        weather = 'SMOG',
        previewcoords = vector3(-132.5002, -800.6231, 44.8288),
        previewrotations = vector3(59.286457, 0.027769, -77.141304),
        spawnlocation = vector4(-136.6797, -772.1584, 44.2236, 332.1633),
    },

    {
        id = 'santosbeach',
        label = 'Santos Beach',
        job = false,
        anim = 'WORLD_HUMAN_LEANING',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 21,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vector3(-1500.4333, -1271.8795, 2.2781),
        previewrotations = vector3(5.164217, 0.054107, 73.197754),
        spawnlocation = vector4(-1514.0807, -1275.1416, 3.4592, 95.3040),
    },


    {
        id = 'mrpd',
        label = 'Mission Row',
        job = 'police',
        anim = 'PROP_HUMAN_SEAT_BENCH_FOOD',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 19,
        },
        previewcoords = vector3(446.1489, -978.6146, 30.6896),
        previewrotations = vector3(-0.601110, 0.054288, -40.638042),
        spawnlocation = vector4(452.7823, -975.4525, 30.1233, 94.0029),
    },

    {
        id = 'legionsquare',
        label = 'Legion Square',
        job = false,
        anim = 'WORLD_HUMAN_DRINKING',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 19,
        },
        previewcoords = vector3(132.7623, -1072.4529, 29.1924),
        previewrotations = vector3(10.666785, 0.053337, 96.114014),
        spawnlocation = vector4(151.3214, -1062.3265, 29.1924, 80.5791),
    },

    {
        id = 'groovestreet',
        label = 'Groove Street',
        job = false,
        anim = 'WORLD_HUMAN_DRUG_DEALER_HARD',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'NEUTRAL',
        previewcoords = vector3(94.1907, -1957.9049, 20.9357),
        previewrotations = vector3(2.221036, 0.054229, -69.528221),
        spawnlocation = vector4(121.5141, -1934.2198, 20.7397, 119.1720),
    },

    {
        id = 'pinkcage',
        label = 'PinkCage Motel',
        job = false,
        anim = 'PROP_HUMAN_SEAT_BENCH_FOOD',
        time = {
            seconds = 0,
            minutes = 20,
            hours = 5,
        },
        weather = 'CLOUDS',
        previewcoords = vector3(313.1524, -244.6177, 53.9808),
        previewrotations = vector3(13.533565, 0.052757, -75.191223),
        spawnlocation = vector4(321.9109, -245.2160, 53.3583, 156.7315),
    },

    {
        id = 'lsairport',
        label = 'LS Airport',
        job = false,
        anim = 'WORLD_HUMAN_MOBILE_FILM_SHOCKING',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 17,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vector3(-977.8924, -2706.6655, 13.8731),
        previewrotations = vector3(13.674648, 0.052811, 111.610275),
        spawnlocation = vector4(-1024.5791, -2696.3025, 13.7863, 239.0250),
    },


    {
        id = 'lsdocks',
        label = 'LS Docks',
        job = false,
        anim = 'WORLD_HUMAN_DRINKING_FACILITY',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'FOGGY',
        previewcoords = vector3(863.7946, -2911.5298, 5.9006),
        previewrotations = vector3(12.582990, -0.000000, -92.159813),
        spawnlocation = vector4(854.0290, -2932.0564, 5.9008, 275.6747),
    },

    {
        id = 'galileo',
        label = 'Galileo Observatory',
        job = false,
        anim = 'WORLD_HUMAN_LEANING',
        time = {
            seconds = 0,
            minutes = 40,
            hours = 19,
        },
        weather = 'CLEAR',
        previewcoords = vector3(-412.1314, 1121.7242, 325.9043),
        previewrotations = vector3(2.295555, 0.054182, 100.989418),
        spawnlocation = vector4(-424.1537, 1117.1168, 326.7680, 75.4131),
    },

    {
        id = 'sandyshores',
        label = 'Sandy Shores',
        job = false,
        anim = 'WORLD_HUMAN_DRINKING',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vector3(1607.1744, 3554.0989, 35.8736),
        previewrotations = vector3(4.663305, 0.054152, 57.269794),
        spawnlocation = vector4(1597.0552, 3568.8518, 38.7313, 124.0735),
    },

    {
        id = 'paletobay',
        label = 'Paleto Bay',
        job = false,
        anim = 'WORLD_HUMAN_GARDENER_LEAF_BLOWER',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vector3(-351.8636, 6166.3789, 31.3716),
        previewrotations = vector3(22.079121, 0.050260, -124.279915),
        spawnlocation = vector4(-334.5834, 6172.2148, 32.3729, 308.3910),
    },

    {
        id = 'mountchilliad',
        label = 'Mount Chilliad',
        job = false,
        anim = 'WORLD_HUMAN_CLIPBOARD_FACILITY',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'XMAS',
        previewcoords = vector3(458.5358, 5545.9912, 787.0457),
        previewrotations = vector3(-9.808603, 0.053460, 37.138485),
        spawnlocation = vector4(452.7495, 5572.0859, 781.1844, 85.8257),
    },
}




Config.Apartment = {
    {
        id = "apartment1",
        label = "South Rockford Drive",
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vec3(-680.8401, -1057.5262, 15.6781),
        previewrotations = vec3(33.742599, 0.045212, -158.740417)
    },
    {
        id = "apartment2",
        label = "Morningwood Blvd",
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vec3(-1251.2296, -400.3814, 43.7918),
        previewrotations = vec3(7.418149, 0.053873, 119.693336)
    },
    {
        id = "apartment3",
        label = "Integrity Way",
        time = {
            seconds = 0,
            minutes = 30,
            hours = 20,
        },
        weather = 'OVERCAST',
        previewcoords = vec3(266.1850, -628.6122, 42.0212),
        previewrotations = vec3(10.300801, 0.054154, 168.478302)
    },
    {
        id = "apartment4",
        label = "Tinsel Towers",
        time = {
            seconds = 0,
            minutes = 30,
            hours = 20,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vec3(-565.7740, -21.8335, 44.1068),
        previewrotations = vec3(21.445902, 0.024789, 34.156109)
    },
    {
        id = "apartment5",
        label = "Fantastic Plaza",
        time = {
            seconds = 0,
            minutes = 0,
            hours = 19,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vec3(294.5243, -1087.2241, 29.4023),
        previewrotations = vec3(11.862809, 0.053081, -9.410534)
    },
}



