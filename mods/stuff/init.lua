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


-- Waters

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.waters then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'rainbow_source:white_water_source')
player:get_inventory():add_item('main', 'rainbow_source:black_water_source')
player:get_inventory():add_item('main', 'rainbow_source:red_water_source')
player:get_inventory():add_item('main', 'rainbow_source:orange_water_source')
player:get_inventory():add_item('main', 'rainbow_source:yellow_water_source')
player:get_inventory():add_item('main', 'rainbow_source:pink_water_source')
player:get_inventory():add_item('main', 'rainbow_source:green_water_source')
player:get_inventory():add_item('main', 'rainbow_source:blue_water_source') 				

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

player:get_inventory():add_item('main', 'colouredglass:white')
player:get_inventory():add_item('main', 'colouredglass:black')
player:get_inventory():add_item('main', 'colouredglass:red')
player:get_inventory():add_item('main', 'colouredglass:orange')
player:get_inventory():add_item('main', 'colouredglass:yellow')
player:get_inventory():add_item('main', 'colouredglass:pink')
player:get_inventory():add_item('main', 'colouredglass:green')
player:get_inventory():add_item('main', 'colouredglass:blue') 				

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




