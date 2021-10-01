local IsNew = false

RegisterNetEvent('qb-interior:client:SetNewState', function(bool)
	IsNew = bool
end)

-- Functions

local function DespawnInterior(objects, cb)
    Citizen.CreateThread(function()
        for k, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end

        cb()
    end)
end

local function TeleportToInterior(x, y, z, h)
    Citizen.CreateThread(function()
        SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), h)

        Citizen.Wait(100)

        DoScreenFadeIn(1000)
    end)
end

-- Starting Apartment

local function CreateApartmentFurnished(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":1.2,"y":4.29636328125,"x":3.572736328125,"h":2.2633972168}')
	POIOffsets.clothes = json.decode('{"z":1.2,"y":-2.6444736328,"x":0.524350097,"h":2.2633972168}')
	POIOffsets.stash = json.decode('{"z":0.5,"y":1.9440585937501,"x":-1.08997509763,"h":2.2633972168}')
	POIOffsets.logout = json.decode('{"z":0.8,"y":-3.0555111328,"x":-4.5689604492,"h":2.2633972168}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`gabz_pinkcage`)
	while not HasModelLoaded(`gabz_pinkcage`) do
	    Citizen.Wait(3)
	end
	local house = CreateObject(`gabz_pinkcage`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x - 3.32089355468, spawn.y - 3.69636328125, spawn.z + 1.2, POIOffsets.exit.h)
	if IsNew then
		SetTimeout(750, function()
			TriggerEvent('qb-clothes:client:CreateFirstCharacter')
			IsNew = false
		end)
	end
    return { objects, POIOffsets }
end

-- Shells

local function CreateApartmentShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":1.2,"y":-6.2,"x":4.7,"h":358.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`appartment`)
	while not HasModelLoaded(`appartment`) do
	    Citizen.Wait(1000)
	end
	local house = CreateObject(`appartment`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + 4.7, spawn.y - 6.2, spawn.z + 2.0, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateCaravanShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":2.3,"y":-2.1,"x":-1.4,"h":358.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`caravan_shell`)
	while not HasModelLoaded(`caravan_shell`) do
	    Citizen.Wait(1000)
	end
	local house = CreateObject(`caravan_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x - 1.3, spawn.y + POIOffsets.exit.y + 0.2, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateFranklinShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":6.7,"y":7.8,"x":10.8,"h":125.5}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`frankelientje`)
	while not HasModelLoaded(`frankelientje`) do
	    Citizen.Wait(1000)
	end
	local house = CreateObject(`frankelientje`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateFranklinAuntShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":2.7,"y":-5.7,"x":-0.4,"h":358.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`tante_shell`)
	while not HasModelLoaded(`tante_shell`) do
	    Citizen.Wait(1000)
	end
	local house = CreateObject(`tante_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateTier1House(spawn, isBackdoor)
    local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = json.decode('{"z":2.5,"y":-15.901171875,"x":4.251012802124,"h":2.2633972168}')
	POIOffsets.clothes = json.decode('{"z":2.5,"y":-3.9233189,"x":-7.84363671,"h":2.2633972168}')
	POIOffsets.stash = json.decode('{"z":2.5,"y":1.33868212,"x":-9.084908691,"h":2.2633972168}')
	POIOffsets.logout = json.decode('{"z":2.0,"y":-1.1463337,"x":-6.69117089,"h":2.2633972168}')
    POIOffsets.backdoor = json.decode('{"z":2.5,"y":4.3798828125,"x":0.88999176025391,"h":182.2633972168}')
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
    RequestModel(`playerhouse_tier1`)
	while not HasModelLoaded(`playerhouse_tier1`) do
	    Citizen.Wait(1000)
	end
    local shell = CreateObject(`playerhouse_tier1`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(shell, true)
    objects[#objects+1] = shell
    local dt = CreateObject(`V_16_DT`, spawn.x-1.21854400, spawn.y-1.04389600, spawn.z + 1.39068600, false, false, false)
    objects[#objects+1] = dt
    if not isBackdoor then
        TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.5, POIOffsets.exit.h)
        Citizen.Wait(100)
        TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.5, POIOffsets.exit.h)
        Citizen.Wait(100)
        TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + 1.5, POIOffsets.exit.h)
    else
        TeleportToInterior(spawn.x + POIOffsets.backdoor.x, spawn.y + POIOffsets.backdoor.y, spawn.z + 1.5, POIOffsets.backdoor.h + 180)
    end
    return { objects, POIOffsets }
end

local function CreateMichaelShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":1.4,"y":2.65636328125,"x":-10.572736328125,"h":265.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`micheal_shell`)
	while not HasModelLoaded(`micheal_shell`) do
	    Citizen.Wait(1000)
	end
	local house = CreateObject(`micheal_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x - 9.52089355468, spawn.y + 2.80144140625, spawn.z + 1.5, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

local function CreateTrevorsShell(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"z":7.9,"y":-3.9,"x":0.1,"h":358.633972168}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Citizen.Wait(10)
    end
	RequestModel(`trevors_shell`)
	while not HasModelLoaded(`trevors_shell`) do
	    Citizen.Wait(1000)
	end
	local house = CreateObject(`trevors_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
	objects[#objects+1] = house
	TeleportToInterior(spawn.x + 0.0, spawn.y - 3.20144140625, spawn.z + 6.5, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

-- Exports

exports('DespawnInterior', DespawnInterior)
exports('CreateTier1House', CreateTier1House)
exports('CreateMichaelShell', CreateMichaelShell)
exports('CreateTrevorsShell', CreateTrevorsShell)
exports('CreateApartmentShell', CreateApartmentShell)
exports('CreateCaravanShell', CreateCaravanShell)
exports('CreateFranklinShell', CreateFranklinShell)
exports('CreateFranklinAuntShell', CreateFranklinAuntShell)
exports('CreateApartmentFurnished', CreateApartmentFurnished)