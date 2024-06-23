ptdelay = 13
htdelay = 80

function drip()
   LogToConsole("masih idup lu")
    --SendPacket(2,"action|input\n|text|mehh")
end

function nc(x, y)
    SendPacketRaw(false, {type = 0, x = x * 32, y = y * 32})
end

function raw(type, value, x, y)
    SendPacketRaw(
        false, 
        {
            type = type,
            value = value,
            x = x * 32,
            y = y * 32,
            px = x,
            py = y
        }
    )
end

local lastDripTime = os.time()

while true do
    
    if os.time() - lastDripTime >= 10 then
        drip()
        lastDripTime = os.time()
    end

    for y = 0, 50 do
        for x = 0, 99 do
            t = GetTile(x, y)
            if t.fg == 0 then
                raw(3, 5640, x, y)
                sleep(ptdelay)
                
               
                if os.time() - lastDripTime >= 10 then
                    drip()
                    lastDripTime = os.time()
                end
            end
        end
    end

    for y = 0, 50 do
        for x = 0, 99 do
            t = GetTile(x, y)
            if t.readyharvest == true then
                nc(x, y)
                raw(3, 18, x, y)
                sleep(htdelay)
                
               
                if os.time() - lastDripTime >= 10 then
                    drip()
                    lastDripTime = os.time()
                end
            end 
        end
    end
end
