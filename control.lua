
local function check_techs()
    for _, force in pairs(game.forces) do
        if force.technologies["discharge-defense-equipment"].researched then
            force.recipes["automatic-discharge-defense-equipment"].enabled = true
        end
    end
end

script.on_init(function()
    check_techs()
end)

script.on_configuration_changed(function()
    check_techs()
end)
