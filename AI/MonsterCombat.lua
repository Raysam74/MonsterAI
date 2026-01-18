local Combat = {}

function Combat.chooseAttack(playerPosition, monsterPosition, facing)
    local distance = (playerPosition - monsterPosition).Magnitude

    if distance < 4 and facing < 0.3 then
        return "back_kill"
    end

    if distance < 6 then
        return "frontal_grab"
    end

    return "leap_attack"
end

function Combat.executeAttack(attackType)
    return {
        type = attackType,
        success = true
    }
end

return Combat
