local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)

-- Help texts (from mcl_tools)
local pickaxe_longdesc = S("Pickaxes are mining tools to mine hard blocks, such as stone. A pickaxe can also be used as weapon, but it is rather inefficient.")
local axe_longdesc = S("An axe is your tool of choice to cut down trees, wood-based blocks and other blocks. Axes deal a lot of damage as well, but they are rather slow.")
local sword_longdesc = S("Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles. Swords can also be used to cut down a few particular blocks, such as cobwebs.")
local shovel_longdesc = S("Shovels are tools for digging coarse blocks, such as dirt, sand and gravel. They can also be used to turn grass blocks to grass paths. Shovels can be used as weapons, but they are very weak.")
local shovel_use = S("To turn a grass block into a grass path, hold the shovel in your hand, then use (rightclick) the top or side of a grass block. This only works when there's air above the grass block.")

local wield_scale = mcl_vars.tool_wield_scale

-- Registering tools
minetest.register_tool("mcl_emerald_stuff:pick", {
	description = S("Emerald Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "mcl_emerald_stuff_pick.png",
	wield_scale = wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=10 },
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=6},
		punch_attack_uses = 898,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_core:emerald",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		pickaxey = { speed = 8, level = 5, uses = 1796 }
	},
	_mcl_upgradable = true,
	_mcl_upgrade_item = "mcl_tools:pick_netherite"
})

minetest.register_tool("mcl_emerald_stuff:shovel", {
	description = S("Emerald Shovel"),
	_doc_items_longdesc = shovel_longdesc,
	_doc_items_usagehelp = shovel_use,
	inventory_image = "mcl_emerald_stuff_shovel.png",
	wield_scale = wield_scale,
	groups = { tool=1, shovel=1, dig_speed_class=6, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=5,
		damage_groups = {fleshy=6},
		punch_attack_uses = 898,
	},
	on_place = make_grass_path,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_core:emerald",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 8, level = 5, uses = 1796 }
	},
	_mcl_upgradable = true,
	_mcl_upgrade_item = "mcl_tools:shovel_netherite"
})

minetest.register_tool("mcl_emerald_stuff:axe", {
	description = S("Emerald Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "mcl_emerald_stuff_axe.png",
	wield_scale = wield_scale,
	groups = { tool=1, axe=1, dig_speed_class=6, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=5,
		damage_groups = {fleshy=10},
		punch_attack_uses = 898,
	},
	on_place = make_stripped_trunk,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_core:emerald",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 8, level = 5, uses = 1796 }
	},
	_mcl_upgradable = true,
	_mcl_upgrade_item = "mcl_tools:axe_netherite"
})

minetest.register_tool("mcl_emerald_stuff:sword", {
	description = S("Emerald Sword"),
	_doc_items_longdesc = sword_longdesc,
	inventory_image = "mcl_emerald_stuff_sword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=5,
		damage_groups = {fleshy=8},
		punch_attack_uses = 1796,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "mcl_core:emerald",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 8, level = 5, uses = 1796 },
		swordy_cobweb = { speed = 8, level = 5, uses = 1796 }
	},
	_mcl_upgradable = true,
	_mcl_upgrade_item = "mcl_tools:sword_netherite"
})

-- Registering crafts
minetest.register_craft({
	output = "mcl_emerald_stuff:pick",
	recipe = {
		{"mcl_core:emerald", "mcl_core:emerald", "mcl_core:emerald"},
		{"", "mcl_core:stick", ""},
		{"", "mcl_core:stick", ""},
	}
})

minetest.register_craft({
	output = "mcl_emerald_stuff:shovel",
	recipe = {
		{"mcl_core:emerald"},
		{"mcl_core:stick"},
		{"mcl_core:stick"},
	}
})

minetest.register_craft({
	output = "mcl_emerald_stuff:axe",
	recipe = {
		{"mcl_core:emerald", "mcl_core:emerald"},
		{"mcl_core:emerald", "mcl_core:stick"},
		{"", "mcl_core:stick"},
	}
})
minetest.register_craft({
	output = "mcl_emerald_stuff:axe",
	recipe = {
		{"mcl_core:emerald", "mcl_core:emerald"},
		{"mcl_core:stick", "mcl_core:emerald"},
		{"mcl_core:stick", ""},
	}
})

minetest.register_craft({
	output = "mcl_emerald_stuff:sword",
	recipe = {
		{"mcl_core:emerald"},
		{"mcl_core:emerald"},
		{"mcl_core:stick"},
	}
})
