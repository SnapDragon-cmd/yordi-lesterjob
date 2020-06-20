ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('yordi:pistol')
AddEventHandler('yordi:pistol', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneyCheck = xPlayer.getMoney()

    if moneyCheck >= 500 then
        xPlayer.addInventoryItem('yPistol', 1)
        xPlayer.removeMoney(500)
        TriggerClientEvent('yordi:weaponbuyingComplete', source)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterli paran yok.' })
    end

end)

RegisterServerEvent('yordi:microsmg')
AddEventHandler('yordi:microsmg', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneyCheck = xPlayer.getMoney()

    if moneyCheck >= 1500 then
        xPlayer.addInventoryItem('yMicroSMG', 1)
        xPlayer.removeMoney(1500)
        TriggerClientEvent('yordi:weaponbuyingComplete', source)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterli paran yok.' })
    end

end)

RegisterServerEvent('yordi:smg')
AddEventHandler('yordi:smg', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneyCheck = xPlayer.getMoney()

    if moneyCheck >= 2500 then
        xPlayer.addInventoryItem('ySMG', 1)
        xPlayer.removeMoney(2500)
        TriggerClientEvent('yordi:weaponbuyingComplete', source)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterli paran yok.' })
    end

end)

RegisterServerEvent('yordi:sellingWeapon')
AddEventHandler('yordi:sellingWeapon', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPistolcheck = xPlayer.getInventoryItem('yPistol').count
    local yMicroSMGcheck = xPlayer.getInventoryItem('yMicroSMG').count
    local ySMGcheck = xPlayer.getInventoryItem('ySMG').count

    if yPistolcheck >= 1 then
        xPlayer.addMoney(2500)
        xPlayer.removeInventoryItem('yPistol', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'success', text = 'Başarıyla 2500$ kazandın, pistol silahını teslim ederek.'})
    end

    if yMicroSMGcheck >= 1 then
        xPlayer.addMoney(4000)
        xPlayer.removeInventoryItem('yMicroSMG', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'success', text = 'Başarıyla 4000$ kazandın, micro smg silahını teslim ederek.'})
    end

    if yMicroSMGcheck >= 1 then
        xPlayer.addMoney(7500)
        xPlayer.removeInventoryItem('ySMG', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'success', text = 'Başarıyla 7500$ kazandın, smg silahını teslim ederek.'})
    end

end)

RegisterServerEvent('yordi:giveMoney')
AddEventHandler('yordi:giveMoney', function(money)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(money)
end)

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('yordi:pistol')
AddEventHandler('yordi:pistol', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneyCheck = xPlayer.getMoney()

    if moneyCheck >= 500 then
        xPlayer.addInventoryItem('yPistol', 1)
        xPlayer.removeMoney(500)
        TriggerClientEvent('yordi:weaponbuyingComplete', source)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterli paran yok.' })
    end

end)

RegisterServerEvent('yordi:microsmg')
AddEventHandler('yordi:microsmg', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneyCheck = xPlayer.getMoney()

    if moneyCheck >= 1500 then
        xPlayer.addInventoryItem('yMicroSMG', 1)
        xPlayer.removeMoney(1500)
        TriggerClientEvent('yordi:weaponbuyingComplete', source)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterli paran yok.' })
    end

end)

RegisterServerEvent('yordi:smg')
AddEventHandler('yordi:smg', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local moneyCheck = xPlayer.getMoney()

    if moneyCheck >= 2500 then
        xPlayer.addInventoryItem('ySMG', 1)
        xPlayer.removeMoney(2500)
        TriggerClientEvent('yordi:weaponbuyingComplete', source)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterli paran yok.' })
    end

end)

RegisterServerEvent('yordi:sellingWeapon')
AddEventHandler('yordi:sellingWeapon', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local yPistolcheck = xPlayer.getInventoryItem('yPistol').count
    local yMicroSMGcheck = xPlayer.getInventoryItem('yMicroSMG').count
    local ySMGcheck = xPlayer.getInventoryItem('ySMG').count

    if yPistolcheck >= 1 then
        xPlayer.addMoney(2500)
        xPlayer.removeInventoryItem('yPistol', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'success', text = 'Başarıyla 2500$ kazandın, pistol silahını teslim ederek.'})
    end

    if yMicroSMGcheck >= 1 then
        xPlayer.addMoney(4000)
        xPlayer.removeInventoryItem('yMicroSMG', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'success', text = 'Başarıyla 4000$ kazandın, micro smg silahını teslim ederek.'})
    end

    if yMicroSMGcheck >= 1 then
        xPlayer.addMoney(7500)
        xPlayer.removeInventoryItem('ySMG', 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'success', text = 'Başarıyla 7500$ kazandın, smg silahını teslim ederek.'})
    end

end)

RegisterServerEvent('yordi:giveItem')
AddEventHandler('yordi:giveItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(item, 1)
end)

RegisterServerEvent('yordi:itembuyingChallenge')
AddEventHandler('yordi:itembuyingChallenge', function()
    local item = "phone"
    local xPlayer = ESX.GetPlayerFromId(source)
    local itemCheck = xPlayer.getInventoryItem(item).count

    if itemCheck >= 1 then
        xPlayer.addMoney(7500)
        xPlayer.removeInventoryItem(item, 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'success', text = 'Başarıyla eşyayı teslim ettin ve 7500$ kazandın.'})
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'error', text = 'Yanlış eşyayı getirdin ve görev iptal edildi!'})
    end

end)