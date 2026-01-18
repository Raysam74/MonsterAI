local Senses = {}

Senses.lastNoisePosition = nil
Senses.lastLightHit = 0

function Senses.hearNoise(position, intensity)
    if intensity <= 0 then return end
    Senses.lastNoisePosition = position
end

function Senses.hitByLight(power)
    if power <= 0 then return end
    Senses.lastLightHit = os.clock()
end

function Senses.isStunned(duration)
    return os.clock() - Senses.lastLightHit < duration
end

return Senses
