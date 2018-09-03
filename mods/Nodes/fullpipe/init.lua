-- Blockcolor 1.46.4 : pipefull by Chiantos ( Fork Columnia // 2018)

-- Minetest 0.4 mod: columnia by Glunggi(former Stairs Copyright by(C) 2011-2012 Kahrl <kahrl@gmx.net> Copyright (C) 2011-2012 celeron55, Perttu Ahola)
-- See README.txt for licensing and other information.

fullpipe = {}

function fullpipe.register_pipe_border(subname, recipeitem, groups, images, description, inventorys, sounds)
	minetest.register_node("fullpipe:border_" .. subname, {
	   wield_image = "none.png",
		wield_scale = {x=2,y=1.5,z=0.2},
      inventory_image = inventorys,
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			   {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5}, 
			   {-0.375, 0, -0.375, 0.375, 0.5, 0.375},
		    },
		},
		 
	})

end

function fullpipe.register_pipe_block(subname, recipeitem, groups, images, description, inventorys, sounds)
	minetest.register_node("fullpipe:block_" .. subname, {
      wield_image = "none.png",
	 	wield_scale = {x=2,y=1.5,z=0.2},
      inventory_image = inventorys,
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			 fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
		},
			})

end

function fullpipe.register_pipe(subname, recipeitem, groups, images, desc_pipe_border, desc_pipe_block, inv_pipe_border, inv_pipe_block, sounds)

	fullpipe.register_pipe_border(subname, recipeitem, groups, images, desc_pipe_border, inv_pipe_border, sounds)
	fullpipe.register_pipe_block(subname, recipeitem, groups, images, desc_pipe_block, inv_pipe_block, sounds)
	
end

local source_list = {
	{"black", "Darkened", "292421", 40, 36, 33}, 
	{"blue", "Blue", "0000FF", 0, 0, 255},
	{"green", "Green", "00FF00", 0, 255, 0}, 
	{"white", "White", "F5F5F5", 245, 245, 245}, 
	{"orange", "Orange", "FF6103", 255, 97, 3}, 
	{"red", "Red", "FF0000", 255, 0, 0}, 
	{"yellow", "Yellow", "FFFF00", 255, 255, 0}, 
	{"pink", "Pink", "FF69B4", 255, 105, 180}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

fullpipe.register_pipe("" .. name .. "", "color:" .. name,
		{cracky=3},
		{"color_" .. name .. ".png"},
		desc .. "FullPipe Border",
		desc .. "FullPipe Block",
      "fullpipeborder.png^[colorize:#"..colour..":70",
      "fullpipe.png^[colorize:#"..colour..":70",
		default.node_sound_stone_defaults()
        )

end
