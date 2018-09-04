-- Cars 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cars then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'driftcar:driftcarwhite')
player:get_inventory():add_item('main', 'driftcar:driftcarblack')
player:get_inventory():add_item('main', 'driftcar:driftcarred')
player:get_inventory():add_item('main', 'driftcar:driftcarorange')
player:get_inventory():add_item('main', 'driftcar:driftcaryellow')
player:get_inventory():add_item('main', 'driftcar:driftcarpink')
player:get_inventory():add_item('main', 'driftcar:driftcargreen')
player:get_inventory():add_item('main', 'driftcar:driftcarblue')

end 
end
)

-- Beds

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

-- Signs

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
				if fields.sofas then --main page		
					
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

-- Flowers

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.flowers then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'flowers:white')
player:get_inventory():add_item('main', 'flowers:black')
player:get_inventory():add_item('main', 'flowers:red')
player:get_inventory():add_item('main', 'flowers:orange')
player:get_inventory():add_item('main', 'flowers:yellow')
player:get_inventory():add_item('main', 'flowers:pink')
player:get_inventory():add_item('main', 'flowers:green')
player:get_inventory():add_item('main', 'flowers:blue')

end 	
end
)