local skynet = require 'skynet'

skynet.start(function()
    local agent = skynet.newservice('agent')
    skynet.send(agent, 'lua', 'count', 'one', 1)
    skynet.send(agent, 'lua', 'count', 'two', 2)
end)
