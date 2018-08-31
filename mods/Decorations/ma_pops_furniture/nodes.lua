
-- Chair

local chair_table = { --name, material, invimg, colour

{'Green Chair', 'green', 'color_green.png', '00FF00'},
{'Red Chair', 'red', 'color_red.png', 'FF0000'},
{'Blue Chair', 'blue', 'color_blue.png', '0000FF'},
{'Yellow Chair', 'yellow', 'color_yellow.png', 'FFFF00'},
{'Orange Chair', 'orange', 'color_orange.png', 'FF6103'},
{'Pink Chair', 'pink', 'color_pink.png', 'FF69B4'},
{'White Chair', 'white', 'color_white.png', 'F5F5F5'},
{'Black Chair', 'black', 'color_black.png', '292421'},

}

for i in ipairs (chair_table) do
	local name = chair_table[i][1]
	local material = chair_table[i][2]
	local invimg = chair_table[i][3]
   local colour = chair_table[i][4]

minetest.register_node('ma_pops_furniture:chair_'..material, {
	description = name,
	drawtype = 'nodebox',
wield_image = "color_no.png",
		wield_scale = {x=2,y=1.5,z=0.2},
   inventory_image = "chair.png^[colorize:#"..colour..":70",
	tiles = {'color_'..material..'.png'},
	groups = {choppy=2, oddly_breakably_by_hand=2, furniture=1, flammable=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),

	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, -0.4375, -0.1875, 0, -0.25}, -- NodeBox1
			{-0.375, -0.5, 0.25, -0.1875, 0, 0.4375}, -- NodeBox2
			{0.1875, -0.5, 0.25, 0.375, 0, 0.4375}, -- NodeBox3
			{0.1875, -0.5, -0.4375, 0.375, 0, -0.25}, -- NodeBox4
			{-0.375, 0, -0.4375, 0.375, 0.1875, 0.4375}, -- NodeBox5
			{-0.375, 0.1875, 0.3125, 0.375, 0.875, 0.4375}, -- NodeBox6
		}
	}
})
end

-- Table

local table_table = { --name, material, invimg, colour

{'Green Table', 'green', 'color_green.png', '00FF00'},
{'Red Table', 'red', 'color_red.png', 'FF0000'},
{'Blue Table', 'blue', 'color_blue.png', '0000FF'},
{'Yellow Table', 'yellow', 'color_yellow.png', 'FFFF00'},
{'Orange Table', 'orange', 'color_orange.png', 'FF6103'},
{'Pink Table', 'pink', 'color_pink.png', 'FF69B4'},
{'White Table', 'white', 'color_white.png', 'F5F5F5'},
{'Black Table', 'black', 'color_black.png', '292421'},

}

for i in ipairs (table_table) do
	local name = table_table[i][1]
	local material = table_table[i][2]
	local invimg = table_table[i][3]
 local colour = table_table[i][4]
	
minetest.register_node('ma_pops_furniture:table_'..material, {
	description = name,
wield_image = "color_no.png",
		wield_scale = {x=2,y=1.5,z=0.2},
inventory_image = "table.png^[colorize:#"..colour..":70",
	drawtype = 'nodebox',
	tiles = {'color_'..material..'.png'},
	groups = {snappy = 2, oddly_breakable_by_hand = 2, furniture = 1, flammable = 1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.125, 0.125, 0.3125, 0.125}, -- NodeBox2
			{-0.5, 0.3125, -0.5, 0.5, 0.5, 0.5}, -- NodeBox3
		}
	}
})
end

-- Chair

local chair2_table = { --name, material, invimg, colour

{'Green Sofa', 'green', 'color_green.png', '00FF00'},
{'Red Sofa', 'red', 'color_red.png', 'FF0000'},
{'Blue Sofa', 'blue', 'color_blue.png', '0000FF'},
{'Yellow Sofa', 'yellow', 'color_yellow.png', 'FFFF00'},
{'Orange Sofa', 'orange', 'color_orange.png', 'FF6103'},
{'Pink Sofa', 'pink', 'color_pink.png', 'FF69B4'},
{'White Sofa', 'white', 'color_white.png', 'F5F5F5'},
{'Black Sofa', 'black', 'color_black.png', '292421'},

}

for i in ipairs (chair2_table) do
	local name = chair2_table[i][1]
	local material = chair2_table[i][2]
	local invimg = chair2_table[i][3]
   local colour = chair2_table[i][4]

minetest.register_node('ma_pops_furniture:chair2_'..material, {
	description = name,
	drawtype = 'nodebox',
wield_image = "color_no.png",
		wield_scale = {x=2,y=1.5,z=0.2},
   inventory_image = "sofas.png^[colorize:#"..colour..":70",
	tiles = {'color_'..material..'.png'},
	groups = {choppy=2, oddly_breakably_by_hand=2, furniture=1, flammable=1},
	paramtype = 'light',
	paramtype2 = 'facedir',
	sounds = default.node_sound_wood_defaults(),

	node_box = {
		type = "fixed",
		fixed = {
           {-0.4, -0.5, -0.4, -0.3, -0.4, -0.3},
            {-0.4, -0.5, 0.4, -0.3, -0.4, 0.3},
            {0.4, -0.5, 0.4, 0.3, -0.4, 0.3},
            {0.4, -0.5, -0.4, 0.3, -0.4, -0.3},
            -----------------------------------
            {-0.450, -0.4, -0.450, 0.450, 0.1, 0.450},
            {-0.5, 0.1, -0.5, -0.3, 0.3, 0.0},
            {0.5, 0.1, -0.5, 0.3, 0.3, 0.0},
            {0.450, 0.1, -0.0, -0.450, 0.5, 0.450},
        },
    }
})
end
