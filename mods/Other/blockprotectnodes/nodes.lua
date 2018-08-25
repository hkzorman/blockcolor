minetest.register_node("blockprotectnodes:node",{
	description = "Block-Protection Node",
wield_image = "color_no.png",
		wield_scale = {x=2,y=1.5,z=0.2},
	groups = {oddly_breakable_by_hand = 1},
	sounds = default.node_sound_stone_defaults(),
	tiles = {"blockprotectnodes-node.png"},
	is_ground_content = false,
	walkable = true,
	pointable = true,
	diggable = true,
	climbable = false,
	buildable_to = false,
	floodable = false,
	light_source = 1,
	on_place = function(itemstack, player, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end
		local under = minetest.get_node_or_nil(pointed_thing.under)
		local above = minetest.get_node_or_nil(pointed_thing.above)
		if not under or not above then
			return itemstack
		end
		local node_pos
		if minetest.registered_nodes[under.name]
		and minetest.registered_nodes[under.name].buildable_to then
			node_pos = pointed_thing.under
		elseif minetest.registered_nodes[above.name]
		and minetest.registered_nodes[above.name].buildable_to then
			node_pos = pointed_thing.above
		else
			return itemstack
		end
		local protect_pos = __blockprotectnodes__:find_protect_node_from_node(node_pos)
		if protect_pos then
			minetest.chat_send_player(player:get_player_name(), "This block is already protected! The protection node is at "..minetest.pos_to_string(protect_pos)..".")
			return itemstack
		else
			return minetest.item_place_node(itemstack, player, pointed_thing)
		end
	end,
	after_place_node = function(node_pos, player)
		local block_pos = __blockprotectnodes__:get_node_block(node_pos)
		local range = __blockprotectnodes__:get_block_node_range(block_pos)
		local owner = player:get_player_name()
		local infotext = "Block ["..block_pos.xx..", "..block_pos.yy..", "..block_pos.zz.."] (nodes in range "..minetest.pos_to_string(range.minp).." to "..minetest.pos_to_string(range.maxp)..") is owned by "..player:get_player_name()..". "
		local meta = minetest.get_meta(node_pos)
		meta:set_string("owner", owner)
		meta:set_string("infotext", infotext)
		minetest.add_entity({
			x = (range.minp.x + range.maxp.x) / 2,
			y = (range.minp.y + range.maxp.y) / 2,
			z = (range.minp.z + range.maxp.z) / 2,
		}, "blockprotectnodes:block")
	end,
	on_punch = function(node_pos, node, puncher, pointed_thing)
		local block = __blockprotectnodes__:get_node_block(node_pos)
		local range = __blockprotectnodes__:get_block_node_range(block)
		minetest.add_entity({
			x = (range.minp.x + range.maxp.x) / 2,
			y = (range.minp.y + range.maxp.y) / 2,
			z = (range.minp.z + range.maxp.z) / 2,
		}, "blockprotectnodes:block")
	end,
	on_use = function(itemstack, user, pointed_thing)
		local block = __blockprotectnodes__:get_node_block(pointed_thing.under)
		local range = __blockprotectnodes__:get_block_node_range(block)
		local pos = {
			x = (range.minp.x + range.maxp.x) / 2,
			y = (range.minp.y + range.maxp.y) / 2,
			z = (range.minp.z + range.maxp.z) / 2,
		}
		minetest.add_entity(pos, "blockprotectnodes:block")
	end,
	after_destruct = function(pos, oldnode)
		local block = __blockprotectnodes__:get_node_block(pos)
		local pos = block.xx..","..block.yy..","..block.zz
		if __blockprotectnodes__.key_lock_secret.by_pos[name] then
			for name, _ in next, __blockprotectnodes__.key_lock_secret.by_pos[name] do
				__blockprotectnodes__.key_lock_secret.by_player[name][pos] = nil
			end
			__blockprotectnodes__.key_lock_secret.by_pos[name] = nil
		end
	end,
	on_skeleton_key_use = function(pos, player, newsecret)
		local meta = minetest.get_meta(pos)
		local owner = meta:get_string("owner")
		local pname = player:get_player_name()
-- verify placer is owner of protection node
		if owner ~= pname then
			minetest.chat_send_player(pname, "You do not own this protection node.")
			return nil
		end
		local secret = meta:get_string("key_lock_secret")
		if secret == "" then
			secret = newsecret
			meta:set_string("key_lock_secret", secret)
		end
		return secret, "block-protecting node", owner
	end,
	on_key_use = function(node_pos, player)
		local name = player:get_player_name()
		local block = __blockprotectnodes__:get_node_block(node_pos)
		local pos = block.xx..","..block.yy..","..block.zz
		__blockprotectnodes__.key_lock_secret.by_player[name][pos] = true
		if not __blockprotectnodes__.key_lock_secret.by_pos[pos] then
			__blockprotectnodes__.key_lock_secret.by_pos[pos] = {}
		end
		__blockprotectnodes__.key_lock_secret.by_pos[pos][name] = true
		minetest.chat_send_player(name, "You are now authorised to build in block ["..pos.."] until you next log out.")
	end,
})
