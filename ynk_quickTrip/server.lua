RegisterNetEvent('moneyRemove')
AddEventHandler('moneyRemove', function(price)
    local xPlayer = ESX.GetPlayerFromId(source)

    local bankMoney = xPlayer.getAccount('bank').money
    local cashMoney = xPlayer.getMoney()

    if (bankMoney + cashMoney) < price then
        print('vous navez pas assez dargent')
        return
    end

    -- Retirer d'abord sur le cash si suffisant
    if cashMoney >= price then
        xPlayer.removeMoney(price)
    else
        xPlayer.removeAccountMoney('bank', reste)
    end
end)
