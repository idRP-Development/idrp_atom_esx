ESX = exports["es_extended"]:getSharedObject()

CreateThread(function()
	for k, v in pairs(Config.Models) do
		ESX.RegisterUsableItem(v.prop, function(source)
			local xPlayer = ESX.GetPlayerFromId(source)
			if v.remove then
				xPlayer.removeInventoryItem(v.itemName, 1)
			end
			if v.status_type == "food" then
				TriggerClientEvent("esx_status:add", source, "hunger", v.status)
				TriggerClientEvent('idrp_atom:UseItem', source, v.prop)
			elseif v.status_type == "drink" then
				TriggerClientEvent("esx_status:add", source, "thirst", v.status)
				TriggerClientEvent('idrp_atom:UseItem', source, v.prop)
			end
		end)
	end
end)
