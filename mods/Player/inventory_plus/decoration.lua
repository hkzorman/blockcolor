-- Frigos

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.frigo then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:frigowhite')
player:get_inventory():add_item('main', 'hdb:frigoblack')
player:get_inventory():add_item('main', 'hdb:frigored')
player:get_inventory():add_item('main', 'hdb:frigoorange')
player:get_inventory():add_item('main', 'hdb:frigoyellow')
player:get_inventory():add_item('main', 'hdb:frigopink')
player:get_inventory():add_item('main', 'hdb:frigogreen')
player:get_inventory():add_item('main', 'hdb:frigoblue')

end 
end
)

-- Cabinets

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.armoire then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:armoirewhite')
player:get_inventory():add_item('main', 'hdb:armoireblack')
player:get_inventory():add_item('main', 'hdb:armoirered')
player:get_inventory():add_item('main', 'hdb:armoireorange')
player:get_inventory():add_item('main', 'hdb:armoireyellow')
player:get_inventory():add_item('main', 'hdb:armoirepink')
player:get_inventory():add_item('main', 'hdb:armoiregreen')
player:get_inventory():add_item('main', 'hdb:armoireblue')

end 
end
)

-- Benchs

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.bench then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:benchwhite')
player:get_inventory():add_item('main', 'hdb:benchblack')
player:get_inventory():add_item('main', 'hdb:benchred')
player:get_inventory():add_item('main', 'hdb:benchorange')
player:get_inventory():add_item('main', 'hdb:benchyellow')
player:get_inventory():add_item('main', 'hdb:benchpink')
player:get_inventory():add_item('main', 'hdb:benchgreen')
player:get_inventory():add_item('main', 'hdb:benchblue')

end 
end
)


-- Computers 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.computers then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:computerwhite')
player:get_inventory():add_item('main', 'hdb:computerblack')
player:get_inventory():add_item('main', 'hdb:computerred')
player:get_inventory():add_item('main', 'hdb:computerorange')
player:get_inventory():add_item('main', 'hdb:computeryellow')
player:get_inventory():add_item('main', 'hdb:computerpink')
player:get_inventory():add_item('main', 'hdb:computergreen')
player:get_inventory():add_item('main', 'hdb:computerblue')

end 
end
)


-- Desks

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.desks then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:deskwhite')
player:get_inventory():add_item('main', 'hdb:deskblack')
player:get_inventory():add_item('main', 'hdb:deskred')
player:get_inventory():add_item('main', 'hdb:deskorange')
player:get_inventory():add_item('main', 'hdb:deskyellow')
player:get_inventory():add_item('main', 'hdb:deskpink')
player:get_inventory():add_item('main', 'hdb:deskgreen')
player:get_inventory():add_item('main', 'hdb:deskblue')

end 
end
)

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

-- Trampoline
minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.trampoline then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'trampoline:trampoline_white')
player:get_inventory():add_item('main', 'trampoline:trampoline_black')
player:get_inventory():add_item('main', 'trampoline:trampoline_red')
player:get_inventory():add_item('main', 'trampoline:trampoline_orange')
player:get_inventory():add_item('main', 'trampoline:trampoline_yellow')
player:get_inventory():add_item('main', 'trampoline:trampoline_pink')
player:get_inventory():add_item('main', 'trampoline:trampoline_green')
player:get_inventory():add_item('main', 'trampoline:trampoline_blue') 						

end 	
end
)
