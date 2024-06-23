id = 5640
place_delay = 10
brp = 10

function put(x,y) 
    pkt = {} 
    pkt.x = x*32
    pkt.y = y*32
    pkt.px = x; 
    pkt.py = y; 
    pkt.type = 3 
    pkt.value = id; 
    SendPacketRaw(false, pkt) 
    Sleep(place_delay) 
end

local dx = math.floor(GetLocal().posX / 32)
local dy = math.floor(GetLocal().posY / 32)

while true do

for d = 1, brp, 1 do
put(dx + d,dy)
end
end
