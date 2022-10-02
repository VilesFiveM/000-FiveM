-- Simple 000 Command --

        webhookURL = 'https://discord.com/api/webhooks/992747441361256489/htvNHUVyYwrg5nXvQNALfcy3YFQ7hugLyqA52SGTH1tOgfgA8giegaUsl2-SYLGnIicU' 

        function sendMsg(src, msg)
            TriggerClientEvent('chat:addMessage', src, {
                args = { prefix .. msg }
            })
        end
        function sendToDisc(title, message, footer)
            local embed = {}
            embed = {
                {
                    ["color"] = 16711680, -- GREEN = 65280 --- RED = 16711680
                    ["title"] = "**".. title .."**",
                    ["description"] = "" .. message ..  "",
                    ["footer"] = {
                        ["text"] = footer,
                    },
                }
            }
            -- Start
            -- TODO Input Webhook
            PerformHttpRequest(webhookURL, 
            function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
          -- END
        end
        isCop = {}
        AddEventHandler('playerDropped', function (reason) 
          -- Clear their lists 
          local src = source;
          isCop[src] = nil;
        end) 

        displayLocation = true

RegisterServerEvent('000')
AddEventHandler('000', function(location, msg)
    local playername = GetPlayerName(source)
    if displayLocation == false then
   		TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4000 | Caller ID: ^r' .. playername .. '^*^4 | Report: ^r' .. msg)
   	else
   		TriggerClientEvent('chatMessage', -1, '', {255,255,255}, '^*^4000 | Caller ID: ^r' .. playername .. '^*^4 | Location: ^r' .. location .. '^*^4 | Report: ^r' .. msg)
   	end
end)
        