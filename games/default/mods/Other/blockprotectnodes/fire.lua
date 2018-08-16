local function ignite(pos, node, active_object_count, active_object_count_wider)
-- If there is water or stuff like that around node, don't ignite
	if minetest.find_node_near(pos, 1, {"group:puts_out_fire"})
-- If the flammable node is too close to an unloaded block, we can't
-- properly detect the presence of protected flammable nodes within
-- that block. We'll put off ignition until that block is loaded, at
-- which point this ABM will be likely to be called again soon, seeing
-- as the flammable node and igniter are still present.
	or #minetest.find_nodes_in_area({
		x = pos.x - 2,
		y = pos.y - 2,
		z = pos.z - 2,
	}, {
		x = pos.x + 2,
		y = pos.y + 2,
		z = pos.z + 2,
	}, "ignore") > 0 then
		return
	end
	local p = minetest.find_node_near(pos, 1, {"air"})
	if p then
		local fuels = minetest.find_nodes_in_area({
			x = p.x - 1,
			y = p.y - 1,
			z = p.z - 1,
		}, {
			x = p.x + 1,
			y = p.y + 1,
			z = p.z + 1,
		}, {
			"group:flammable",
			"ignore",
		})
		local allow_ignition = true
		for _, fuel in next, fuels do
			if minetest.is_protected(fuel, "") then
				allow_ignition = false
			end
		end
		if allow_ignition then
			minetest.set_node(p, {name = "fire:basic_flame"})
		else
			local igniters = minetest.find_nodes_in_area({
				x = pos.x - 1,
				y = pos.y - 1,
				z = pos.z - 1,
			}, {
				x = pos.x + 1,
				y = pos.y + 1,
				z = pos.z + 1,
			}, "group:igniter")
			for _, igniter in next, igniters do
				local node = minetest.get_node(igniter)
				if minetest.registered_nodes[node.name].liquidtype == "none" then
					minetest.remove_node(igniter)
				else
					default.cool_lava(igniter, node)
				end
			end
		end
	end
end

for _, ABM in next, minetest.registered_abms do
	if ABM.mod_origin == "fire" and ABM.label == "Ignite flame" then
		ABM.action = ignite
	end
end

local ignite_using_tool = minetest.registered_tools["fire:flint_and_steel"].on_use
minetest.override_item("fire:flint_and_steel", {
	on_use = function(itemstack, user, pointed_thing)
		local allow_use = true
		local player_name = user:get_player_name()
		if pointed_thing.type == "node" then
			local node_under = minetest.get_node(pointed_thing.under).name
			local nodedef = minetest.registered_nodes[node_under]
			if minetest.get_item_group(node_under, "flammable") > 0
			and minetest.get_node(pointed_thing.above).name == "air"
			and not nodedef.on_ignite then
				local fuels = minetest.find_nodes_in_area({
					x = pointed_thing.above.x - 1,
					y = pointed_thing.above.y - 1,
					z = pointed_thing.above.z - 1,
				}, {
					x = pointed_thing.above.x + 1,
					y = pointed_thing.above.y + 1,
					z = pointed_thing.above.z + 1,
				}, {
					"group:flammable",
					"ignore",
				})
				for _, fuel in next, fuels do
					if minetest.is_protected(fuel, player_name)
					or not minetest.get_node_or_nil(fuel) then
						allow_use = false
					end
				end
			end
		end
		if allow_use then
			return ignite_using_tool(itemstack, user, pointed_thing)
		else
			minetest.chat_send_player(player_name, "This area is protected.")
			return itemstack
		end
	end,
})
