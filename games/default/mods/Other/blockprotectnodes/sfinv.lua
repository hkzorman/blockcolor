sfinv.register_page("blockprotectnodes:help", {
	title = "Protection",
	get = function(self, player, context)
		local name = player:get_player_name()
		local formspec =
		"item_image[0,0;1,1;default:cobble]item_image[1,0;1,1;default:mese_crystal_fragment]item_image[2,0;1,1;default:cobble]"..
		"item_image[0,1;1,1;default:cobble]item_image[1,1;1,1;default:cobble]item_image[2,1;1,1;default:cobble]"..
		"item_image[0,2;1,1;default:cobble]item_image[1,2;1,1;default:steel_ingot]item_image[2,2;1,1;default:cobble]"..
		"image[3.75,1;1,1;gui_furnace_arrow_fg.png^[transformR270]"..
		"item_image[5.5,0;3,3;blockprotectnodes:node]"..
		"label[0.6,3;If you don't protect your creations, they might get]"..
		"label[0.25,3.5;vandalised. The administrator of this server will not be]"..
		"label[0,4;held responsible for this. To protect your belongings, craft]"..
		"label[0.05,4.5;and place protection nodes near them. These protection]"..
		"label[0.3,5;nodes don't function the same way as the protection]"..
		"label[0.3,5.5;nodes offered by other mods in that these ones are]"..
		"label[0.2,6;block-based, not node-based. What that means is that]"..
		"label[0,6.5;they protect a 16^3 node area, but that area isn't centred]"..
		"label[0,7;on the protection node. This eliminates a glitch present in]"..
		"label[0.2,7.5;node-based protection areas, but makes protection a]"..
		"label[0,8;little less intuitive. Pointing at the node will make it tell you]"..
		"label[1.8,8.5;the range it protects. Be careful!]"..
		""
		return sfinv.make_formspec(player, context, formspec, false)
	end,
	is_in_nav = function()
		return true
	end,
})
