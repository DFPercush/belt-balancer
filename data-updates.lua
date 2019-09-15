---set_bobs_logistic_group
---@param recipe string recipe to change group
---@param tier number tier group to change subgroup
function set_bobs_logistic_group(recipe_name, tier)
    local recipe = data.raw.recipe[recipe_name]
    recipe.group = "bob-logistics"
    recipe.subgroup = "bob-logistic-tier-" .. tier
end

if mods["boblogistics"] then
    -- recalculate technology costs
    -- this is a simple mathToFloor to 10/25 exponent
    data.raw.technology["belt-balancer-0"].unit.count = data.raw.technology["logistics-0"].unit.count
    data.raw.technology["belt-balancer-1"].unit.count = data.raw.technology["logistics"].unit.count
    data.raw.technology["belt-balancer-2"].unit.count = 10 * (math.floor((data.raw.technology["logistics-2"].unit.count / 3 * 2) / 10))
    data.raw.technology["belt-balancer-3"].unit.count = 25 * (math.floor((data.raw.technology["logistics-3"].unit.count / 3 * 2) / 25))
    data.raw.technology["belt-balancer-4"].unit.count = 25 * (math.floor((data.raw.technology["logistics-4"].unit.count / 3 * 2) / 25))
    data.raw.technology["belt-balancer-5"].unit.count = 25 * (math.floor((data.raw.technology["logistics-5"].unit.count / 3 * 2) / 25))

    -- move recipes to boblogistics item group
    set_bobs_logistic_group("belt-balancer-basic-belt", 0)
    set_bobs_logistic_group("belt-balancer-normal-belt", 1)
    set_bobs_logistic_group("belt-balancer-fast-belt", 2)
    set_bobs_logistic_group("belt-balancer-express-belt", 3)
    set_bobs_logistic_group("belt-balancer-turbo-belt", 4)
    set_bobs_logistic_group("belt-balancer-ultimate-belt", 5)
end
