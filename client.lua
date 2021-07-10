RegisterCommand("car", function(source, args, raw)
     local model = args[1]
    
     if model ~= nil then
         local modelHash = GetHashKey(model)
         RequestModel(modelHash)
         local isLoaded = HasModelLoaded(modelHash)
         while isLoaded == false do
             Citizen.Wait(0)
         end
         local vehicle = CreateVehicle(modelHash, GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId()), 1, 0)
         SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
     end
 end)