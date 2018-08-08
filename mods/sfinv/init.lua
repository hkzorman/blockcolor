dofile(minetest.get_modpath("sfinv") .. "/api.lua") 
					
sfinv.register_page("sfinv:crafting", {
	title = "About",
	get = function(self, player, context)
		return sfinv.make_formspec(player, context, [[
		
		image_button[0,0;1,1;blocks.png;blocks;]
		image_button[1,0;1,1;stairs.png;stairs;]
		image_button[2,0;1,1;slabs.png;slabs;]
	  image_button[3,0;1,1;windows.png;windows;]
	  image_button[4,0;1,1;lights.png;lights;]
	  image_button[5,0;1,1;waters.png;waters;]
	  image_button[6,0;1,1;doors.png;doors;]
     image_button[7,0;1,1;carpets.png;carpets;] 	
     image_button[0,1;1,1;trapdoor.png;trapdoor;]
     image_button[1,1;1,1;fence.png;fence;]
   
			]], true)
	end
})
	


