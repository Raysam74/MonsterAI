local Config = require(script.Parent.Parent.Config.MonsterConfig)
local Senses = require(script.Parent.MonsterSenses)

local Brain = {}
Brain.state = "idle"
Brain.targetPosition = nil

function Brain.update()
    if Senses.isStunned(Config.stunDuration) then
        Brain.state = "stunned"
        return Brain.state
    end

    if Senses.lastNoisePosition then
        Brain.state = "hunt"
        Brain.targetPosition = Senses.lastNoisePosition
        return Brain.state
    end

    Brain.state = "idle"
    return Brain.state
end

function Brain.shouldAmbush(distance)
    return Brain.state == "hunt" and distance < 8
end

return Brain
