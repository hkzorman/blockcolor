minetest.register_privilege("dimensions", {
	description = "Can use dimensions teleport tool",
	give_to_singleplayer= true,
})

minetest.register_alias("dim", "multidimensions:teleporttool")

multidimensions.setrespawn=function(object,pos)
	if not object:is_player() then return false end
	local name=object:get_player_name()
	if minetest.check_player_privs(name, {dimensions=true}) then return false end
	if multidimensions.remake_bed and minetest.get_modpath("beds")~=nil then
		beds.spawn[name]=pos
		beds.save_spawns()
	end
	if multidimensions.remake_home and minetest.get_modpath("sethome")~=nil then
		sethome.set(name, pos)
	end
end

multidimensions.move=function(object,pos)
	local move=false
	object:setpos(pos)
	multidimensions.setrespawn(object,pos)
	minetest.after(1, function(pos,object,move)
		for i=1,100,1 do
			local nname=minetest.get_node(pos).name
			if nname~="air" and nname~="ignore" then
				pos.y=pos.y+1
				move=true
			elseif move then
				object:setpos(pos)
				multidimensions.setrespawn(object,pos)
				break
			end
		end
	end, pos,object,move)
	minetest.after(5, function(pos,object,move)
		for i=1,100,1 do
			local nname=minetest.get_node(pos).name
			if nname~="air" and nname~="ignore" then
				pos.y=pos.y+1
				move=true
			elseif move then
				object:setpos(pos)
				multidimensions.setrespawn(object,pos)
				break
			end
		end
	end, pos,object,move)
	return true
end



multidimensions.form=function(player,object)
	local name=player:get_player_name()
	local buttons=""
	local y=1
	local x=3
	local n=2
	local info=""
	multidimensions.user[name]={}
	multidimensions.user[name].pos=object:getpos()
	multidimensions.user[name].object=object
	if object:is_player() and object:get_player_name()==name then
		info="Teleport you"
	elseif object:is_player() and object:get_player_name()~=name then
		info="Teleport "..object:get_player_name()
	else
		info="Teleport object"
	end
	buttons="button_exit[0,1;3,1;b1;Earth]"
	for i, but in pairs(multidimensions.dimensions) do
	if but.name then
		buttons=buttons .."button_exit[" .. x.. "," .. y .. ";3,1;b" .. n .. ";" .. but.name .. "]"
		if x==3 then
			y=y+1
			x=0
		else
			x=3
		end
		n=n+1
	end
	end
	local gui=""
	gui=""
	.."size[6.5," .. (y+1) .."]"
	.."label[2,0;" .. info .."]" 
	..buttons
	minetest.after(0.1, function(gui)
		return minetest.show_formspec(player:get_player_name(), "multidimensions.form",gui)
	end, gui)
end


minetest.register_on_player_receive_fields(function(player, form, pressed)
	if form=="multidimensions.form" then
		local name=player:get_player_name()
		local pos=multidimensions.user[name].pos
		local object=multidimensions.user[name].object
		local n=1
		local y=0
		multidimensions.user[name]=nil
		for i, but in pairs(multidimensions.dimensions) do
			local pos=object:getpos()
			local pos2={x=pos.x,y=multidimensions.dimensions[n].y,z=pos.z}
			if pressed["b"..n] and minetest.is_protected(pos2, name)==false then
				if n==1 then pos2.y=0 end
					multidimensions.move(object,pos2)
				return true
			end
			n=n+1
		end
		return false
	end
end)

minetest.register_tool("multidimensions:teleporttool", {
	description = "Dimensions teleport tool",
   wield_image = "none.png",
	inventory_image = "planet.png",
on_use = function(itemstack, user, pointed_thing)
	local pos=user:getpos()
	local name=user:get_player_name()

	if minetest.check_player_privs(name, {dimensions=true})==false then
		itemstack:replace(nil)
		minetest.chat_send_player(name,"You need the dimensions privilege to use this tool")
		return itemstack
	end

	local object={}
	if pointed_thing.type=="object" then
		object=pointed_thing.ref
	else
		object=user
	end
	multidimensions.form(user,object)
	return itemstack
end
})
