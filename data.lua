
require("util")

local auto_discharge_defense = util.table.deepcopy(data.raw["active-defense-equipment"]["discharge-defense-equipment"])
auto_discharge_defense.name = "automatic-discharge-defense-equipment"
auto_discharge_defense.automatic = true

local auto_discharge_defense_item = util.table.deepcopy(data.raw.item["discharge-defense-equipment"])
auto_discharge_defense_item.name = "automatic-discharge-defense-equipment"
auto_discharge_defense_item.place_as_equipment_result = "automatic-discharge-defense-equipment"
auto_discharge_defense_item.order = auto_discharge_defense_item.order .. "-a[auto]"

---@type data.RecipePrototype
local auto_discharge_defense_recipe = {
    type = "recipe",
    name = "automatic-discharge-defense-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
        { type = "item", name = "advanced-circuit",            amount = 2 },
        { type = "item", name = "discharge-defense-equipment", amount = 1 },
        { type = "item", name = "discharge-defense-remote",    amount = 1 }
    },
    results =
    {
        { type = "item", name = "automatic-discharge-defense-equipment", amount = 1 }
    },
}

local tech_effect = {
    type = "unlock-recipe",
    recipe = "automatic-discharge-defense-equipment"
}
for _, technology in pairs(data.raw["technology"]) do
    if technology.effects then
        for _, effect in pairs(technology.effects) do
            if effect.type == "unlock-recipe" and effect.recipe == "discharge-defense-equipment" then
                table.insert(technology.effects, tech_effect)
            end
        end
    end
end

data:extend({
    auto_discharge_defense,
    auto_discharge_defense_item,
    auto_discharge_defense_recipe,
})
