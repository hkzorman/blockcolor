-- Initial Stuff

minetest.register_on_newplayer(function(player) 

player:get_inventory():add_item('main', 'color:white')
player:get_inventory():add_item('main', 'color:black')
player:get_inventory():add_item('main', 'color:red')
player:get_inventory():add_item('main', 'color:orange')
player:get_inventory():add_item('main', 'color:yellow')
player:get_inventory():add_item('main', 'color:pink')
player:get_inventory():add_item('main', 'color:green')
player:get_inventory():add_item('main', 'color:blue')

end)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.none then --main page		
					
				 player:get_inventory():set_list("main", {})

end 
end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.sphere then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:sphere_white')
player:get_inventory():add_item('main', 'slope:sphere_black')
player:get_inventory():add_item('main', 'slope:sphere_red')
player:get_inventory():add_item('main', 'slope:sphere_orange')
player:get_inventory():add_item('main', 'slope:sphere_yellow')
player:get_inventory():add_item('main', 'slope:sphere_pink')
player:get_inventory():add_item('main', 'slope:sphere_green')
player:get_inventory():add_item('main', 'slope:sphere_blue')

end 
end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cone then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:cone_white')
player:get_inventory():add_item('main', 'slope:cone_black')
player:get_inventory():add_item('main', 'slope:cone_red')
player:get_inventory():add_item('main', 'slope:cone_orange')
player:get_inventory():add_item('main', 'slope:cone_yellow')
player:get_inventory():add_item('main', 'slope:cone_pink')
player:get_inventory():add_item('main', 'slope:cone_green')
player:get_inventory():add_item('main', 'slope:cone_blue')

end 
end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.outcorner then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:ocorner_white')
player:get_inventory():add_item('main', 'slope:ocorner_black')
player:get_inventory():add_item('main', 'slope:ocorner_red')
player:get_inventory():add_item('main', 'slope:ocorner_orange')
player:get_inventory():add_item('main', 'slope:ocorner_yellow')
player:get_inventory():add_item('main', 'slope:ocorner_pink')
player:get_inventory():add_item('main', 'slope:ocorner_green')
player:get_inventory():add_item('main', 'slope:ocorner_blue')

end 
end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.incorner then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:icorner_white')
player:get_inventory():add_item('main', 'slope:icorner_black')
player:get_inventory():add_item('main', 'slope:icorner_red')
player:get_inventory():add_item('main', 'slope:icorner_orange')
player:get_inventory():add_item('main', 'slope:icorner_yellow')
player:get_inventory():add_item('main', 'slope:icorner_pink')
player:get_inventory():add_item('main', 'slope:icorner_green')
player:get_inventory():add_item('main', 'slope:icorner_blue')

end 
end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.long then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:slopelong_white')
player:get_inventory():add_item('main', 'slope:slopelong_black')
player:get_inventory():add_item('main', 'slope:slopelong_red')
player:get_inventory():add_item('main', 'slope:slopelong_orange')
player:get_inventory():add_item('main', 'slope:slopelong_yellow')
player:get_inventory():add_item('main', 'slope:slopelong_pink')
player:get_inventory():add_item('main', 'slope:slopelong_green')
player:get_inventory():add_item('main', 'slope:slopelong_blue')

end 
end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cylinder then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:cylinder_white')
player:get_inventory():add_item('main', 'slope:cylinder_black')
player:get_inventory():add_item('main', 'slope:cylinder_red')
player:get_inventory():add_item('main', 'slope:cylinder_orange')
player:get_inventory():add_item('main', 'slope:cylinder_yellow')
player:get_inventory():add_item('main', 'slope:cylinder_pink')
player:get_inventory():add_item('main', 'slope:cylinder_green')
player:get_inventory():add_item('main', 'slope:cylinder_blue')

end 
end
)


minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.beds then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'beds:bed_bottom_white')
player:get_inventory():add_item('main', 'beds:bed_bottom_black')
player:get_inventory():add_item('main', 'beds:bed_bottom_red')
player:get_inventory():add_item('main', 'beds:bed_bottom_orange')
player:get_inventory():add_item('main', 'beds:bed_bottom_yellow')
player:get_inventory():add_item('main', 'beds:bed_bottom_pink')
player:get_inventory():add_item('main', 'beds:bed_bottom_green')
player:get_inventory():add_item('main', 'beds:bed_bottom_blue')

end 
end
)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.protect then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'blockprotectnodes:node')

end 
end
)

-- Table

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.signs then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'signs:sign_wall_white')
player:get_inventory():add_item('main', 'signs:sign_wall_black')
player:get_inventory():add_item('main', 'signs:sign_wall_red')
player:get_inventory():add_item('main', 'signs:sign_wall_orange')
player:get_inventory():add_item('main', 'signs:sign_wall_yellow')
player:get_inventory():add_item('main', 'signs:sign_wall_pink')
player:get_inventory():add_item('main', 'signs:sign_wall_green')
player:get_inventory():add_item('main', 'signs:sign_wall_blue')

end 
end
)

-- Table

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.table then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'ma_pops_furniture:table_white')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_black')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_red')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_orange')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_yellow')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_pink')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_green')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_blue')

end 
end
)

-- Chair2

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.chair2 then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_white')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_black')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_red')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_orange')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_yellow')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_pink')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_green')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_blue')

end 
end
)

-- Chair

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.chair then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'ma_pops_furniture:chair_white')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_black')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_red')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_orange')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_yellow')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_pink')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_green')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_blue')

end 
end
)

-- Fence

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.fence then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'fence:white')
player:get_inventory():add_item('main', 'fence:black')
player:get_inventory():add_item('main', 'fence:red')
player:get_inventory():add_item('main', 'fence:orange')
player:get_inventory():add_item('main', 'fence:yellow')
player:get_inventory():add_item('main', 'fence:pink')
player:get_inventory():add_item('main', 'fence:green')
player:get_inventory():add_item('main', 'fence:blue')

end 	
end
)

-- Trapdoor

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.trapdoor then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'doors:trapdoor_white')
player:get_inventory():add_item('main', 'doors:trapdoor_black')
player:get_inventory():add_item('main', 'doors:trapdoor_red')
player:get_inventory():add_item('main', 'doors:trapdoor_orange')
player:get_inventory():add_item('main', 'doors:trapdoor_yellow')
player:get_inventory():add_item('main', 'doors:trapdoor_pink')
player:get_inventory():add_item('main', 'doors:trapdoor_green')
player:get_inventory():add_item('main', 'doors:trapdoor_blue')

end 	
end
)

-- Carpets

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.carpets then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'carpet:white')
player:get_inventory():add_item('main', 'carpet:black')
player:get_inventory():add_item('main', 'carpet:red')
player:get_inventory():add_item('main', 'carpet:orange')
player:get_inventory():add_item('main', 'carpet:yellow')
player:get_inventory():add_item('main', 'carpet:pink')
player:get_inventory():add_item('main', 'carpet:green')
player:get_inventory():add_item('main', 'carpet:blue')

end 	
end
)

-- Doors

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.doors then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'doors:door_white')
player:get_inventory():add_item('main', 'doors:door_black')
player:get_inventory():add_item('main', 'doors:door_red')
player:get_inventory():add_item('main', 'doors:door_orange')
player:get_inventory():add_item('main', 'doors:door_yellow')
player:get_inventory():add_item('main', 'doors:door_pink')
player:get_inventory():add_item('main', 'doors:door_green')
player:get_inventory():add_item('main', 'doors:door_blue')

end 	
end
)

-- Waters

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.waters then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'water:white_water_source')
player:get_inventory():add_item('main', 'water:black_water_source')
player:get_inventory():add_item('main', 'water:red_water_source')
player:get_inventory():add_item('main', 'water:orange_water_source')
player:get_inventory():add_item('main', 'water:yellow_water_source')
player:get_inventory():add_item('main', 'water:pink_water_source')
player:get_inventory():add_item('main', 'water:green_water_source')
player:get_inventory():add_item('main', 'water:blue_water_source') 				

end 	
end
)

-- Lights

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.lights then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'light:white')
player:get_inventory():add_item('main', 'light:black')
player:get_inventory():add_item('main', 'light:red')
player:get_inventory():add_item('main', 'light:orange')
player:get_inventory():add_item('main', 'light:yellow')
player:get_inventory():add_item('main', 'light:pink')
player:get_inventory():add_item('main', 'light:green')
player:get_inventory():add_item('main', 'light:blue') 						

end 	
end
)

-- Blocks

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.blocks then --main page		
					
player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'color:white')
player:get_inventory():add_item('main', 'color:black')
player:get_inventory():add_item('main', 'color:red')
player:get_inventory():add_item('main', 'color:orange')
player:get_inventory():add_item('main', 'color:yellow')
player:get_inventory():add_item('main', 'color:pink')
player:get_inventory():add_item('main', 'color:green')
player:get_inventory():add_item('main', 'color:blue') 							

end 	
end
)

-- Windows

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.windows then --main page		
					
player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'glass:white')
player:get_inventory():add_item('main', 'glass:black')
player:get_inventory():add_item('main', 'glass:red')
player:get_inventory():add_item('main', 'glass:orange')
player:get_inventory():add_item('main', 'glass:yellow')
player:get_inventory():add_item('main', 'glass:pink')
player:get_inventory():add_item('main', 'glass:green')
player:get_inventory():add_item('main', 'glass:blue') 				

end 	
end
)

-- Stairs 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.stairs then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'stairs:stair_white')
player:get_inventory():add_item('main', 'stairs:stair_black')
player:get_inventory():add_item('main', 'stairs:stair_red')
player:get_inventory():add_item('main', 'stairs:stair_orange')
player:get_inventory():add_item('main', 'stairs:stair_yellow')
player:get_inventory():add_item('main', 'stairs:stair_pink')
player:get_inventory():add_item('main', 'stairs:stair_green')
player:get_inventory():add_item('main', 'stairs:stair_blue') 						

end 	
end
)

-- Slabs

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.slabs then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'stairs:slab_white')
player:get_inventory():add_item('main', 'stairs:slab_black')
player:get_inventory():add_item('main', 'stairs:slab_red')
player:get_inventory():add_item('main', 'stairs:slab_orange')
player:get_inventory():add_item('main', 'stairs:slab_yellow')
player:get_inventory():add_item('main', 'stairs:slab_pink')
player:get_inventory():add_item('main', 'stairs:slab_green')
player:get_inventory():add_item('main', 'stairs:slab_blue') 		

end 	
end
)
