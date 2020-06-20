local yordiActive = true
local weapontruefalse = false
local vehicletruefalse = false
local weaponbuyingtruefalse = false
local weaponsellingtruefalse = false
local weaponbuyingnpctruefalse = false
local vehiclesellingtruefalse = false
local itemchallengetruefalse = false
local itembuyingchallengetruefalse = false

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

        local coords = GetEntityCoords(PlayerPedId())
        local weaponChallenge = GetDistanceBetweenCoords(coords, Config.challengeCoords.weaponChallenge.coords, true)
        local weaponbuyingChallenge = GetDistanceBetweenCoords(coords, Config.challengeCoords.weaponbuyingChallenge.coords, true)
        local lesterDistance = GetDistanceBetweenCoords(coords, Config.lesterCoords.lesterNPC.coords, true)
        local vehiclecarChallenge = GetDistanceBetweenCoords(coords, Config.challengeCoords.vehiclechallengecar.coords, true)
        local vehiclecarsellingChallenge = GetDistanceBetweenCoords(coords, Config.challengeCoords.vehiclesellingChallenge.coords, true)
        local itemChallenge = GetDistanceBetweenCoords(coords, Config.challengeCoords.itemchallenge.coords, true)
        local itembuyingChallenge = GetDistanceBetweenCoords(coords, Config.challengeCoords.itembuyingChallenge.coords, true)

        -- Weapon Challenge
        if weaponChallenge < 100.0 and weapontruefalse == true then
            DrawMarker(2, Config.challengeCoords.weaponChallenge.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 110.0, 0.55, 0.75, 0.25, 232, 126, 4, 255, false, false, 2, false, false, false, false)
        end
        
        if weaponChallenge < 1.5 and weapontruefalse == true then
            ESX.ShowHelpNotification("Silahları almak için ~INPUT_PICKUP~ tuşuna basınız.")
            weaponbuyingtruefalse = true
        end

        if IsControlJustPressed(1, 38) and weaponChallenge < 1.5 and weapontruefalse == true then
            yordiweaponChallenge()
            weapontruefalse = false
        end
        -- Weapon Challenge

        -- Weapon Buying Challenge
        if weaponbuyingChallenge < 1.5 and weaponbuyingtruefalse == true then
            ESX.ShowHelpNotification("Silahları teslim almak için ~INPUT_PICKUP~ tuşuna basınız.")
        end

        if IsControlJustPressed(1, 38) and weaponbuyingChallenge < 1.5 and weaponbuyingtruefalse == true then
            yordibuyingChallenge()
        end
        -- Weapon Buying Challenge

        -- Weapon Selling Challenge
        if weaponChallenge < 100.0 and weaponsellingtruefalse == true then
            DrawMarker(2, Config.challengeCoords.weaponChallenge.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 110.0, 0.55, 0.75, 0.25, 232, 126, 4, 255, false, false, 2, false, false, false, false)
        end
        
        if weaponChallenge < 1.5 and weaponsellingtruefalse == true then
            ESX.ShowHelpNotification("Silahları teslim etmek için ~INPUT_PICKUP~ tuşuna basınız.")
        end

        if IsControlJustPressed(1, 38) and weaponChallenge < 1.5 and weaponsellingtruefalse == true then
            weaponsellingtruefalse = false
            yordiActive = true
            TriggerServerEvent('yordi:sellingWeapon', source)
        end
        -- Weapon Selling Challenge

        -- Vehicle Challenge
        if vehiclecarChallenge < 2.5 and vehicletruefalse == true then
            ESX.ShowHelpNotification("Aracı almak için ~INPUT_ENTER~ tuşuna basınız.")
        end

        if IsControlJustPressed(1, 23) and vehiclecarChallenge < 2.5 and vehicletruefalse == true then
            vehicletruefalse = false
            exports['mythic_notify']:SendAlert('error', 'Görev: Aracı teslim et!')
            exports['mythic_notify']:SendAlert('inform', 'Görev: Bölge GPS\'e tanımlandı.')
            SetNewWaypoint(Config.challengeCoords.vehiclesellingChallenge.coords)
        end
        -- Vehicle Challenge

        -- Vehicle Selling Challenge
        if vehiclecarsellingChallenge < 100.0 and vehiclesellingtruefalse == true then
            DrawMarker(2, Config.challengeCoords.vehiclesellingChallenge.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 110.0, 0.55, 0.75, 0.25, 232, 126, 4, 255, false, false, 2, false, false, false, false)
        end
        
        if vehiclecarsellingChallenge < 1.5 and vehiclesellingtruefalse == true then
            ESX.ShowHelpNotification("Aracı teslim etmek için ~INPUT_PICKUP~ tuşuna basınız.")
        end

        if IsControlJustPressed(1, 38) and vehiclecarsellingChallenge < 1.5 and vehiclesellingtruefalse == true then
            vehiclesellingtruefalse = false
            yordiActive = true
            vehiclesellingChallenge()
        end
        -- Vehicle Selling Challenge

        -- İtem Selling Challenge
        if itemChallenge < 100.0 and itemchallengetruefalse == true then
            DrawMarker(2, Config.challengeCoords.itemchallenge.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 110.0, 0.55, 0.75, 0.25, 232, 126, 4, 255, false, false, 2, false, false, false, false)
        end
        
        if itemChallenge < 1.5 and itemchallengetruefalse == true then
            ESX.ShowHelpNotification("Eşyayı almak için ~INPUT_PICKUP~ tuşuna basınız.")
        end

        if IsControlJustPressed(1, 38) and itemChallenge < 1.5 and itemchallengetruefalse == true then
            itemchallengetruefalse = false
            itemsellingChallenge()
        end
        -- İtem Selling Challenge

        -- İtem Buying Challenge
        if itembuyingChallenge < 2.5 and itembuyingchallengetruefalse == true then
            ESX.ShowHelpNotification("Eşyayı teslim etmek için ~INPUT_PICKUP~ tuşuna basınız.")
        end

        if IsControlJustPressed(1, 38) and itembuyingChallenge < 2.5 and itembuyingchallengetruefalse == true then
            itembuyingchallengetruefalse = false
            yordiActive = true
            TriggerServerEvent('yordi:itembuyingChallenge', source)
        end
        -- İtem Buying Challenge

        -- Lester NPC
        if lesterDistance < 1.5 then
            ESX.ShowHelpNotification("Lester ile konuşmak için ~INPUT_PICKUP~ tuşuna basınız.")
        end

        if IsControlJustPressed(1, 38) and lesterDistance < 1.5 then
            yordimenuOpen()
        end
        -- Lester NPC
        
	end
end)

-- Lester Ped
Citizen.CreateThread(function()
    local ped_hash = 0xB594F5C3
    local ped_coords = Config.lesterCoords.lesterNPC.coords

    RequestModel(ped_hash)
    while not HasModelLoaded(ped_hash) do
        Citizen.Wait(1)
    end

    ped_info = CreatePed(1, ped_hash, ped_coords, 115.0, false, true)
    SetBlockingOfNonTemporaryEvents(ped_info, true)
    SetEntityInvincible(ped_info, true)
    FreezeEntityPosition(ped_info, true)
end)
-- Lester Ped

-- Weapon Buying Ped
Citizen.CreateThread(function()
    local ped_hash = 0xF63DE8E1
    local ped_coords = Config.challengeCoords.weaponbuyingChallenge.coords
    
    RequestModel(ped_hash)
    while not HasModelLoaded(ped_hash) do
        Citizen.Wait(1)
    end
    
    ped_info = CreatePed(1, ped_hash, ped_coords, 125.0, false, true)
    SetBlockingOfNonTemporaryEvents(ped_info, true)
    SetEntityInvincible(ped_info, true)
    FreezeEntityPosition(ped_info, true)
end)
-- Weapon Buying Ped

-- İtem Buying Ped
Citizen.CreateThread(function()
    local ped_hash = 0x37FACDA6
    local ped_coords = Config.challengeCoords.itembuyingChallenge.coords
    
    RequestModel(ped_hash)
    while not HasModelLoaded(ped_hash) do
        Citizen.Wait(1)
    end
    
    ped_info = CreatePed(1, ped_hash, ped_coords, 125.0, false, true)
    SetBlockingOfNonTemporaryEvents(ped_info, true)
    SetEntityInvincible(ped_info, true)
    FreezeEntityPosition(ped_info, true)
end)
-- İtem Buying Ped

function yordimenuOpen()
    if yordiActive then
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'equipfbi', {
            title = 'Lester Menüsü',
            align = 'top-left',
            elements = {
                {label = 'Görev: Silah Teslimatı', value = 'weaponchallenge'},
                {label = 'Görev: Araç Teslimatı', value = 'vehiclechallange'},
                {label = 'Görev: Eşya Teslimatı', value = 'itemchallenge'}
            }
        }, function(data, menu)
            
            if data.current.value == 'weaponchallenge' then
                weapontruefalse = true
                exports['mythic_notify']:SendAlert('error', 'Görev: Silah Teslimatı')
                exports['mythic_notify']:SendAlert('inform', 'Bölge GPS\'e işaretlendi.')
                SetNewWaypoint(Config.challengeCoords.weaponChallenge.coords)
                menu.close()
                yordiActive = false
            end
            
            if data.current.value == 'vehiclechallange' then
                exports['mythic_notify']:SendAlert('error', 'Görev: Araç Teslimatı')
                exports['mythic_notify']:SendAlert('inform', 'Bölge GPS\'e işaretlendi.')
                SetNewWaypoint(Config.challengeCoords.vehiclechallengecar.coords)
                menu.close()
                vehicleChallenge()
                yordiActive = false
            end
    
            if data.current.value == 'itemchallenge' then
                exports['mythic_notify']:SendAlert('error', 'Görev: Eşya Teslimatı')
                exports['mythic_notify']:SendAlert('inform', 'Bölge GPS\'e işaretlendi.')
                SetNewWaypoint(Config.challengeCoords.itemchallenge.coords)
                menu.close()
                itemchallengetruefalse = true
                yordiActive = false
            end
    
        end, function(data, menu)
            menu.close()
        end)
    else
        exports['mythic_notify']:SendAlert('error', 'Zaten teslimat aldın, işini bitirdikten sonra tekrar alabilirsin!')
    end
end

function yordiweaponChallenge()
    exports['mythic_notify']:SendAlert('error', 'Görev: Silahları al!')
    exports['mythic_notify']:SendAlert('inform', 'Silahları alıcağın bölge gps\'e tanımlandı.')
    SetNewWaypoint(Config.challengeCoords.weaponbuyingChallenge.coords)
end

function yordibuyingChallenge()
    ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'equipfbi', {
		title = 'Lester Job (Silah Alış Menüsü)',
		align = 'top-left',
		elements = {
			{label = '1. Pistol - Alış: ' .. Config.weaponchallangeMoney.PistolBuying .. '$ - Teslimat: ' .. Config.weaponchallangeMoney.PistolReward ..' $', value = 'pistol'},
			{label = '2. Micro SMG - Alış: ' .. Config.weaponchallangeMoney.MicroSMGBuying .. '$ - Teslimat: ' .. Config.weaponchallangeMoney.MicroSMGReward ..' $', value = 'microsmg'},
			{label = '3. SMG - Alış: ' .. Config.weaponchallangeMoney.SMGBuying .. '$ - Teslimat: ' .. Config.weaponchallangeMoney.SMGReward ..' $', value = 'smg'}
		}
    }, function(data, menu)
        
        if data.current.value == 'pistol' then
            TriggerServerEvent('yordi:pistol', source)
            weaponbuyingtruefalse = false
            menu.close()
        end

        if data.current.value == 'microsmg' then
            TriggerServerEvent('yordi:microsmg', source)
            weaponbuyingtruefalse = false
            menu.close()
        end

        if data.current.value == 'smg' then
            TriggerServerEvent('yordi:smg', source)
            weaponbuyingtruefalse = false
            menu.close()
        end

	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('yordi:weaponbuyingComplete')
AddEventHandler('yordi:weaponbuyingComplete', function()
    exports['mythic_notify']:SendAlert('error', 'Görev: Silahları teslim et!')
    exports['mythic_notify']:SendAlert('inform', 'Silahları teslim ediceğin bölge gps\'e tanımlandı.')
    SetNewWaypoint(Config.challengeCoords.weaponChallenge.coords)
    weaponsellingtruefalse = true
end)

RegisterNetEvent('yordi:spawntheCar')
AddEventHandler('yordi:spawntheCar', function(coords, model, heading)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
    end)
end)

function vehicleChallenge()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    vehicletruefalse = true

    ESX.Game.SpawnVehicle("seven70", Config.challengeCoords.vehiclechallengecar.coords, 313.46, function(vehicle)
    end)

    SetNewWaypoint(Config.challengeCoords.vehiclechallengecar.coords)
    TriggerEvent('yordi:spawntheCar', source, coords, model, heading)

    vehiclesellingtruefalse = true
end

function vehiclesellingChallenge()
    local money = Config.vehiclechallengeMoney.vehiclesellingMoney
    local ped = PlayerPedId(-1)
    local vehicle = GetVehiclePedIsIn(ped)
    
    if yordivehicleCheck(GetVehiclePedIsIn(ped)) then
        ESX.Game.DeleteVehicle(vehicle)
        TriggerServerEvent('yordi:giveMoney', money)
        exports['mythic_notify']:SendAlert('success', 'Görev başarıyla tamamlandı, ' .. money .. '$ kazandın.')
    else
        exports['mythic_notify']:SendAlert('error', 'Yanlış aracı teslim almışsın ve görev iptal edildi!')
    end
end

function yordivehicleCheck(using)
	local cars = Config.vehicle
  
	for i=1, #cars, 1 do
	  if IsVehicleModel(using, GetHashKey(cars[i])) then
		return true
	  end
	end
end

function itemsellingChallenge()
    local item = "phone" -- yItem (Eşya)
    TriggerServerEvent('yordi:giveItem', item)
    exports['mythic_notify']:SendAlert('error', 'Görev: Eşyayı teslim et!')
    exports['mythic_notify']:SendAlert('inform', 'Bölge GPS\'e tanımlandı.')
    SetNewWaypoint(Config.challengeCoords.itembuyingChallenge.coords)

    itembuyingchallengetruefalse = true
end