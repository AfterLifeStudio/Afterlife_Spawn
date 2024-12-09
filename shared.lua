Config = {}

GetFramework = function()
    if GetResourceState('es_extended') ~= 'missing' then
        return 'esx'
    elseif GetResourceState('qb-core') ~= 'missing' then
        return 'qb'
    end
end

Config.framework = GetFramework() -- qb / esx /qbox /ox

Config.Apartmentstart = true



Config.defualtsaved = { ------default configuration for players personal saved locations 
    time = {
        seconds = 0,
        minutes = 0,
        hours = 21,
    },
    weather = 'EXTRASUNNY',
} 

Config.Spawn = {
    {
        id = 'santosbeach',
        label = 'Santos Beach',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 21,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vector3(-1500.7225, -1267.2964, 2.1709),
        previewrotations = vector3(10.540741,-0.000000,86.52),
        spawnlocation = vector4(-1514.1067, -1275.2244, 2.4592, 281.3539),
        img = 'https://imgur.com/5Yyhvou.png'
    },
    {
        id =  'legionsquare',
        label = 'Legion Square',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vector3(99.8915, -997.5879, 34.1591),
        previewrotations = vector3(13.0,-0.000000,40.0),
        img = 'https://i.imgur.com/eN6MCQ2.png'
    },
    {
        id = 'mazebank',
        label = 'Maze Bank',

        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'OVERCAST',
        previewcoords = vector3(12.5576, -765.4310, 49.6451),
        previewrotations = vector3(4.0,-0.000000,84.5),
        img = 'https://imgur.com/OtC7xTd.png'
    },
    {
        id = 'constructionsite',
        label = 'Construction Site',
        time = {
            seconds = 0,
            minutes = 0,
            hours = 12,
        },
        weather = 'EXTRASUNNY',
        previewcoords =  vector3(-180.7535, -1095.3901, 45.1091),
        previewrotations = vector3(0.681184,-0.000000,163.421463),
        img = 'https://imgur.com/Y9GROeS.png'
    },
    {
        id = 'littlesoul',
        label = 'Little Soul',
        time = {
            seconds = 0,
            minutes = 30,
            hours = 20,
        },
        weather = 'EXTRASUNNY',
        previewcoords = vector3(-438.2030, -812.6075, 34.2543),
        previewrotations = vector3(-2.784726,0.000000,73.260139),
        spawnlocation = vector4(-449.6915, -820.9112, 30.6998, 166.1623),
        img = 'https://imgur.com/kj4D4RH.png'
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
        previewrotations = vec3(33.742599,0.045212,-158.740417)
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
        previewrotations = vec3(7.418149,0.053873,119.693336)
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
        previewrotations = vec3(10.300801,0.054154,168.478302)
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
        previewrotations = vec3(21.445902,0.024789,34.156109)
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
        previewrotations = vec3(11.862809,0.053081,-9.410534)
    },
}




Config.Lang = {
    START = 'START',
    CREDIT = 'CREDITS',
    create = 'CREATE',
    character = 'CHARACTER',
    description = 'Choose your character info and make sure to put realistic name and dob',
    firstName = 'FIRST NAME',
    lastName = 'LAST NAME',
    male = 'Male',
    female = 'Female',
    dob = 'Date Of Birth',
    year = 'Year',
    day = 'Day',
    month = 'Month',
    nationality = 'NATIONALITY',
    searchcountry = 'Search Country',
    done = 'Done',
    esc = 'ESC',
    back = 'BACK',
    exit = 'EXIT',
    EXIT = 'EXIT',
    enter = 'ENTER',
    dev = '@Developed by',
    afterlife = 'AfterLife Studios',
    exitgame = 'EXIT GAME',
    exitdescription = 'Are you sure you want to exit the game?',
    delete = 'DELETE CHARACTER',
    deletedescription = 'Are you sure you want to delete the character?',
    hold = 'Hold',
    loadingsession = "LOADING SESSION",
    loadingscene = "LOADING SCENE",
    loadingcharacter = "LOADING CHARACTER"
}

