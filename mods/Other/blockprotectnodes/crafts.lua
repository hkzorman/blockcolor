minetest.register_craft({
	output = "blockprotectnodes:node",
	recipe = {
		{"default:cobble", "default:mese_crystal_fragment", "default:cobble"},
		{"default:cobble", "default:cobble"               , "default:cobble"},
		{"default:cobble", "default:steel_ingot"          , "default:cobble"},
	},
})
