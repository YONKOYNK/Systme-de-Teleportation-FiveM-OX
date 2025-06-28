lib.registerContext({
  id = 'tp_menu',
  title = 'Voyage rapide',
  options = {
    {
      title = 'Cayo Perico',
      onSelect = function()
        local alert = lib.alertDialog({header = 'Hello there', content = 'Etes vous sur de vouloir vous teleporter au Cayo Perico pour 500 ', centered = true, cancel = true})
        if alert == 'confirm' then
          TriggerServerEvent('moneyRemove')
          lib.progressCircle({duration = Config.progressTime, position = 'bottom', useWhileDead = false, canCancel = false})
          SetEntityCoords(PlayerPedId(), Config.Locations.cayo_perico)
          lib.notify({title = 'Téléportation', description = 'Téléporté à Cayo Perico', type = 'success'})
        end
      end
    },
    {
      title = 'Hopital',
      onSelect = function()
        local alert = lib.alertDialog({header = 'Hello there', content = 'Etes vous sur de vouloir vous teleporter au Hopital pour 500', centered = true, cancel = true})
        if alert == 'confirm' then
          TriggerServerEvent('moneyRemove')
          lib.progressCircle({duration = Config.progressTime, position = 'bottom', useWhileDead = false, canCancel = false})
          SetEntityCoords(PlayerPedId(), Config.Locations.hopital)
          lib.notify({title = 'Téléportation', description = 'Téléporté à l\'Hopital', type = 'success'})
        end
      end
    },
    {
      title = 'Police',
      onSelect = function()
        local alert = lib.alertDialog({header = 'Hello there', content = 'Etes vous sur de vouloir vous teleporter à la Police pour 500', centered = true, cancel = true})
        if alert == 'confirm' then
          TriggerServerEvent('moneyRemove')
          lib.progressCircle({duration = Config.progressTime, position = 'bottom', useWhileDead = false, canCancel = false})
          SetEntityCoords(PlayerPedId(), Config.Locations.police)
          lib.notify({title = 'Téléportation', description = 'Téléporté à la Police', type = 'success'})
        end
      end
    },
    {
      title = 'Parking Central',
      onSelect = function()
        local alert = lib.alertDialog({header = 'Hello there', content = 'Etes vous sur de vouloir vous teleporter au Parking Central pour 500', centered = true, cancel = true})
        if alert == 'confirm' then
          TriggerServerEvent('moneyRemove')
          lib.progressCircle({duration = Config.progressTime, position = 'bottom', useWhileDead = false, canCancel = false})
          SetEntityCoords(PlayerPedId(), Config.Locations.parking_central)
          lib.notify({title = 'Téléportation', description = 'Téléporté au Parking Central', type = 'success'})
        end
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
