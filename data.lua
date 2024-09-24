
require("util")

local auto_discharge_defense = util.table.deepcopy(data.raw["active-defense-equipment"]["discharge-defense-equipment"])
auto_discharge_defense.name = "automatic-discharge-defense-equipment"
auto_discharge_defense.automatic = true

local auto_discharge_defense_item = util.table.deepcopy(data.raw.item["discharge-defense-equipment"])
auto_discharge_defense_item.name = "automatic-discharge-defense-equipment"
auto_discharge_defense_item.placed_as_equipment_result = "automatic-discharge-defense-equipment"
auto_discharge_defense_item.order = auto_discharge_defense_item.order .. "-a[auto]"

local auto_discharge_defense_recipe = {
    type = "recipe",
    name = "automatic-discharge-defense-equipment",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
        { "advanced-circuit",            2 },
        { "discharge-defense-equipment", 1 },
        { "discharge-defense-remote",    1 }
    },
    result = "automatic-discharge-defense-equipment",
}

local tech_effect = {
    type = "unlock-recipe",
    recipe = "automatic-discharge-defense-equipment"
}
table.insert(data.raw.technology["discharge-defense-equipment"].effects, tech_effect)

data:extend({
    auto_discharge_defense,
    auto_discharge_defense_item,
    auto_discharge_defense_recipe,
})
