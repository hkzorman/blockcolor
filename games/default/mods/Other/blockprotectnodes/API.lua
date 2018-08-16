-- The whole of this mod's API is exposed. If you want to alter how
-- this mod works, you might be able to do it from your own mod. If
-- not, get in touch with me at <https://y.st./en/a/contact.xhtml>. We
-- might be able to come up with a simple change for this code that'd
-- make your own adaption possible.
--
-- ... or, you know, you could just alter this code itself, if you
-- really wanted to. This *is* free software, after all. Speaking of
-- which, this code is released by Alex Yst under the GNU LGPLv2.1, for
-- compatibility with upstream Minetest. I prefer the GNU GPL, myself,
-- but the LGPL works too.

__blockprotectnodes__ = {
-- This method will *only* call the is_protect methods of protection
-- mods that were loaded *before* this one. As such, it is *not*
-- recommended that other mods make use of this method.
	is_protected = minetest.is_protected,

-- To avoid node coordinates and block coordinates being accidentally
-- interchanged, they've been made incompatible. Node coordinates have
-- been defined by Minetest to use x, y, and z attributes. This mod
-- defines block coordinates to use xx, yy, and zz attributes instead.
	get_node_block = function(self, node_pos)
		return {
			xx = math.floor(node_pos.x / 16),
			yy = math.floor(node_pos.y / 16),
			zz = math.floor(node_pos.z / 16),
		}
	end,

	get_block_node_range = function(self, block_pos)
		local min = {
			x = block_pos.xx * 16,
			y = block_pos.yy * 16,
			z = block_pos.zz * 16,
		}
		local max = {
			x = min.x + 15,
			y = min.y + 15,
			z = min.z + 15,
		}
		return {
			minp = min,
			maxp = max,
		}
	end,

	find_protect_node_from_block = function(self, block_pos)
		local range = self:get_block_node_range(block_pos)
		local nodes = minetest.find_nodes_in_area(range.minp, range.maxp, "blockprotectnodes:node")
-- There should never be multiple protection nodes in one block. If
-- there are, there's some sort of error. If the two nodes belong to
-- different players, the entire block would theoretically become
-- unusable by everyone. To deal with this error condition, we'll
-- disable all protection of the area. As soon as all but one of the
-- protection nodes has been removed, protection will be restored for
-- that final player.
		if nodes[2] then
			minetest.chat_send_all("ERROR: multiple protection nodes in block "..dump(block_pos)..". Disabling protection of damaged map block.")
			return nill
		else
			return nodes[1]
		end
	end,

	find_protect_node_from_node = function(self, node_pos)
		local block_pos = self:get_node_block(node_pos)
		return self:find_protect_node_from_block(block_pos)
	end,

	key_lock_secret = {
		by_pos = {},
		by_player = {
-- Unknown players and unknown players - Including this key prevents
-- crashes otherwise caused by the sharing system when the game decides
-- to call minetest.is_protected() without passing in a player name.
			[""] = {},
		},
	},
}

minetest.register_on_joinplayer(function(ObjectRef)
	__blockprotectnodes__.key_lock_secret.by_player[ObjectRef:get_player_name()] = {}
end)

minetest.register_on_leaveplayer(function(ObjectRef, timed_out)
	local name = ObjectRef:get_player_name()
	for pos, _ in next, __blockprotectnodes__.key_lock_secret.by_player[name] do
		__blockprotectnodes__.key_lock_secret.by_pos[pos][name] = nil
	end
	__blockprotectnodes__.key_lock_secret.by_player[name] = nil
end)

-- This is where the magic happens. The rest of this script simply
-- defines what "magic" even means.
function minetest.is_protected(node_pos, player_name)
	local block = __blockprotectnodes__:get_node_block(node_pos)
	local protect_node = __blockprotectnodes__:find_protect_node_from_block(block)
	local block_pos = block.xx..","..block.yy..","..block.zz
	if protect_node then
		minetest.debug(player_name)
		minetest.debug(block_pos)
		local owner = minetest.get_meta(protect_node):get_string("owner")
		if __blockprotectnodes__.key_lock_secret.by_player[player_name][block_pos]
		or owner == player_name then
			return __blockprotectnodes__.is_protected(node_pos, player_name)
		else
			minetest.chat_send_player(player_name, "This area is owned by "..owner..".")
			return true
		end
	else
		return __blockprotectnodes__.is_protected(node_pos, player_name)
	end
end
