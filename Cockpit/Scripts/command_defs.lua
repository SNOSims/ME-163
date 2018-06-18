Keys =
{
    PlanePickleOn   = 350,
    PlanePickleOff  = 351,
    PlaneFireOn     = 84,
    PlaneFireOff    = 85,
}

start_command   = 3000
device_commands = {}
for i = 1, 100 do
   device_commands['Button_' .. tostring(i)] = start_command + i
end

