-- The node and entity code here have been directly copied from
-- zing269's simple_anchor mod
-- (<https://github.com/zing269/simple_anchor/>, copyright 2018, MIT
-- licenced), with only minor changes, mostly in the form of changing
-- the names to work within this mod's namespace instead of the
-- simple_anchor mod's namespace. In turn, this code from simple_anchor
-- was derived from TenPlus1's protector mod
-- (<https://notabug.org/TenPlus1/protector>, copyright 2016, MIT
-- licensed), but with bigger changes made.

-- display entity shown when loader node is punched
minetest.register_entity("blockprotectnodes:block", {
	physical = false,
	collisionbox = {0, 0, 0, 0, 0, 0},
	visual = "wielditem",
	-- wielditem seems to be scaled to 1.5 times original node size
	visual_size = {x = 1.0 / 1.5, y = 1.0 / 1.5},
	textures = {"blockprotectnodes:block"},
	timer = 0,
	on_step = function(self, dtime)
		self.timer = self.timer + dtime
		-- remove after 15 seconds
		if self.timer > 15 then
			self.object:remove()
		end
	end,
	colors = {"#F00"},
})

-- Display-zone node, Do NOT place the display as a node,
-- it is made to be used as an entity (see above)
minetest.register_node("blockprotectnodes:block", {
	tiles = {"blockprotectnodes-block.png"},
	use_texture_alpha = true,
	walkable = false,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			-- sides
			{-8.01, -8.01, -8.01, -7.99, 8.01, 8.01},
			{-8.01, -8.01, 7.99, 8.01, 8.01, 8.01},
			{7.99, -8.01, -8.01, 8.01, 8.01, 8.01},
			{-8.01, -8.01, -8.01, 8.01, 8.01, -7.99},
			-- top
			{-8.01, 7.99, -8.01, 8.01, 8.01, 8.01},
			-- bottom
			{-8.01, -8.01, -8.01, 8.01, -7.99, 8.01},
		},
	},
	groups = {dig_immediate = 3},
	drop = "",
})
