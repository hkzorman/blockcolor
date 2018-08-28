-- This is inspired by the landrush mod by Bremaweb

areas.hud = {}

minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local pos = vector.round(player:getpos())
		local areaStrings = {}

		for id, area in pairs(areas:getAreasAtPos(pos)) do
			table.insert(areaStrings, ("%s")
					:format(area.name, id, area.owner,
					area.open and ":open" or ""))
		end

		for i, area in pairs(areas:getExternalHudEntries(pos)) do
			local str = ""
			if area.name then str = area.name .. " " end
			table.insert(areaStrings, str)
		end

		local areaString = ""
		if #areaStrings > 0 then
			areaString = areaString..""..
				table.concat(areaStrings, "")
		end
		local hud = areas.hud[name]
		if not hud then
			hud = {}
			areas.hud[name] = hud
			hud.areasId = player:hud_add({
				hud_elem_type = "text",
				name = "Areas",
				number = 0xFF0000 ,
				position = {x=0.45, y=0.05},
				text = areaString,
				alignment = {x=1, y=-1},
			})
			hud.oldAreas = areaString
			return
		elseif hud.oldAreas ~= areaString then
			player:hud_change(hud.areasId, "text", areaString)
			hud.oldAreas = areaString
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	areas.hud[player:get_player_name()] = nil
end)

