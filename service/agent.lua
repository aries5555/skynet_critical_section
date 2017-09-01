local skynet = require("skynet")
local queue = require "skynet.queue"

local cs = queue()
local agent = {}

agent.count = function(name, count)
    foo(name, count)

    -- 解决方案，采用队列，串行执行
    -- cs(foo, name, count)
end

function foo(name, count)
    agent.c = count

    print(name, agent.c)

    -- do somthing block
    skynet.sleep(100)
    print('after do somthing block', name)

    print(name, agent.c)
end

skynet.start(function()
    skynet.dispatch('lua', function(_,_, cmd, ...)
        local f = agent[cmd]
        if f then
            f(...)
        end
    end)
end)