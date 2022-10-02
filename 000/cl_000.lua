
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/000', 'Submits a 000 call to Victoria Police!', {
    { name="Report", help="" }
})
end)

RegisterCommand('000', function(source, args)
    local ped = GetPlayerPed(-1)
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    TriggerServerEvent('000', location, msg)
end)  

Citizen.CreateThread(function()
	TriggerServerEvent('000')
end)

RegisterNetEvent("000")
AddEventHandler("000", function(x, y)
	-- Set the waypoint for this player
	SetNewWaypoint(x, y)
end)