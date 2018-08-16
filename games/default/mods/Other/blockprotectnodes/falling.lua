local falling_node = minetest.registered_entities["__builtin:falling_node"]

-- This is pretty much a copy and paste function from
-- "minetest-0.4.17/builtin/game/falling.lua". There doesn't seem to be
-- a way to tap into the API and replace just the two parts of this I
-- need adjusted. The whole function can only either be left alone or
-- entirely replaced, so I'm replacing it with this nearly verbatim
-- copy, but with protection detection added.
-- 
-- This means, of course, that if changes are made in later versions of
-- Minetest, this function replacement will cause the behaviour to be
-- dragged back to what it was in Minetest 0.4.17, so I have to
-- manually update this code with each new release of Minetest. If
-- you're reading this and know of a better way, please let me know by
-- filing a bug report or pull request in the project's bug tracker.
-- 
-- This code is copyright Celeron55, licenced under the terms of the
-- GNU LGPLv2.1+.
function falling_node.on_step(self, dtime)
	-- Set gravity
	local acceleration = self.object:getacceleration()
	if not vector.equals(acceleration, {x = 0, y = -10, z = 0}) then
		self.object:setacceleration({x = 0, y = -10, z = 0})
	end
	-- Turn to actual node when colliding with ground, or continue to move
	local pos = self.object:getpos()
	-- Position of bottom center point
	local bcp = {x = pos.x, y = pos.y - 0.7, z = pos.z}
	-- 'bcn' is nil for unloaded nodes
	local bcn = core.get_node_or_nil(bcp)
	-- Delete on contact with ignore at world edges
	if bcn and bcn.name == "ignore" then
		self.object:remove()
		return
	end
	local bcd = bcn and core.registered_nodes[bcn.name]
	if bcn and
			(not bcd or bcd.walkable or
			(core.get_item_group(self.node.name, "float") ~= 0 and
			bcd.liquidtype ~= "none")) then
		if bcd and bcd.leveled and
				bcn.name == self.node.name then
			local addlevel = self.node.level
			if not addlevel or addlevel <= 0 then
				addlevel = bcd.leveled
			end
			if core.add_node_level(bcp, addlevel) == 0 then
				self.object:remove()
				return
			end
		elseif bcd and bcd.buildable_to and
				(core.get_item_group(self.node.name, "float") == 0 or
				bcd.liquidtype == "none") then
			core.remove_node(bcp)
			return
		end
		local np = {x = bcp.x, y = bcp.y + 1, z = bcp.z}
		-- Check what's here
		local n2 = core.get_node(np)
		local nd = core.registered_nodes[n2.name]
		-- If it's not air or liquid, remove node and replace it with
		-- it's drops
		if n2.name ~= "air" and (not nd or nd.liquidtype == "none") then
-- BEGIN MODIFIED SECTION 0 OF FUNCTION
-- Check for area protection before solidifying node.
			if not minetest.is_protected(np, "") then
-- END MODIFIED SECTION 0 OF FUNCTION
				core.remove_node(np)
				if nd and nd.buildable_to == false then
					-- Add dropped items
					local drops = core.get_node_drops(n2, "")
					for _, dropped_item in pairs(drops) do
						core.add_item(np, dropped_item)
					end
				end
				-- Run script hook
				for _, callback in pairs(core.registered_on_dignodes) do
					callback(np, n2)
				end
-- BEGIN MODIFIED SECTION 1 OF FUNCTION
			end
-- END MODIFIED SECTION 1 OF FUNCTION
		end
		-- Create node and remove entity
		if core.registered_nodes[self.node.name] then
-- BEGIN MODIFIED SECTION 0 OF FUNCTION
-- Check for area protection before solidifying node.
			if minetest.is_protected(np, "") then
				core.add_item(np, self.node.name)
			else
-- END MODIFIED SECTION 0 OF FUNCTION
				core.add_node(np, self.node)
				if self.meta then
					local meta = core.get_meta(np)
					meta:from_table(self.meta)
				end
-- BEGIN MODIFIED SECTION 1 OF FUNCTION
			end
-- END MODIFIED SECTION 1 OF FUNCTION
		end
		self.object:remove()
		core.check_for_falling(np)
		return
	end
	local vel = self.object:getvelocity()
	if vector.equals(vel, {x = 0, y = 0, z = 0}) then
		local npos = self.object:getpos()
		self.object:setpos(vector.round(npos))
	end
end

core.register_entity(":__builtin:falling_node", falling_node)
