ESX = exports['es_extended']:getSharedObject()

function teleportToPlace(price, location)
    local alert = lib.alertDialog({header = 'Hello there', content = 'Etes vous sur de vouloir vous teleporter ', centered = true, cancel = true})
        if alert == 'confirm' then
            TriggerServerEvent('moneyRemove', price)
            lib.progressCircle({duration = Config.progressTime, position = 'bottom', useWhileDead = false, canCancel = false})
            SetEntityCoords(PlayerPedId(), location)
            lib.notify({title = 'Téléportation', description = 'Bien teleporte', type = 'success'})
        end
end

lib.registerContext({
  id = 'tp_menu',
  title = 'Voyage rapide',
  options = {
    {
      title = 'Cayo Perico',
      icon = 'fa-solid fa-umbrella-beach',
      onSelect = function()
        teleportToPlace(Config.InfosLocation[1].price, Config.InfosLocation[1].location)
      end
    },
    {
      title = 'Hopital',
      icon = 'fa-solid fa-hospital',
      onSelect = function()
        teleportToPlace(Config.InfosLocation[2].price, Config.InfosLocation[2].location)
      end
    },
    {
      title = 'Police',
      icon = 'fa-solid fa-shield-alt',
      onSelect = function()
         teleportToPlace(Config.InfosLocation[3].price, Config.InfosLocation[3].location)
      end
    },
    {
      title = 'Parking Central',
      icon = 'fa-solid fa-parking',
      onSelect = function()
         teleportToPlace(Config.InfosLocation[4].price, Config.InfosLocation[4].location)
      end
    }
  }
})

Citizen.CreateThread(function()
  while true do
    Wait(0)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    if not IsEntityDead(playerPed) and not IsPedInAnyVehicle(playerPed, true) then
      local distance = #(playerCoords - Config.MainLocation)
      if distance <= 4.0 then
        DrawMarker(Config.Marker, Config.MainLocation.x, Config.MainLocation.y, Config.MainLocation.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 150, 255, 200, false, true, 2, false, nil, nil, false)
        if IsControlJustPressed(0, Config.Touche) and distance <= 1.0 then
          lib.showContext('tp_menu')
          print('Menu Ouvert')
        end
      end
    end
  end
end)
