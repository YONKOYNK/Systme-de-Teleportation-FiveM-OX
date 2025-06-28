RegisterNetEvent('moneyRemove')
AddEventHandler('moneyRemove', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        local bankMoney = xPlayer.getAccount('bank').money
        local cashMoney = xPlayer.getMoney()

        if bankMoney >= 500 then
            xPlayer.removeAccountMoney('bank', 500)
        elseif bankMoney < 500 and cashMoney >= 500 then
            xPlayer.removeMoney(500)
        end
    end
end)


