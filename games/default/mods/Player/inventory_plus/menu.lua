 --[[

Inventory Plus for Minetest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-inventory_plus
License: BSD-3-Clause https://raw.github.com/cornernote/minetest-inventory_plus/master/LICENSE

Edited by TenPlus1 (23rd March 2016)

]]--

-- expose api
inventory_plus = {}

-- define buttons
inventory_plus.buttons = {}

-- default inventory page
inventory_plus.default = minetest.settings:get("inventory_default") or "main"

-- register_button
inventory_plus.register_button = function(player, name, label)

	local player_name = player:get_player_name()

	if inventory_plus.buttons[player_name] == nil then
		inventory_plus.buttons[player_name] = {}
	end

	inventory_plus.buttons[player_name][name] = label
end

-- set_inventory_formspec
inventory_plus.set_inventory_formspec = function(player, formspec)

	 -- error checking
	if not formspec then
		return
	end

	if minetest.settings:get_bool("creative_mode") then

		-- if creative mode is on then wait a bit
		minetest.after(0.01,function()
			player:set_inventory_formspec(formspec)
		end)
	else
		player:set_inventory_formspec(formspec)
	end
end

-- create detached inventory for trashcan
local trashInv = minetest.create_detached_inventory(
	"trash", {
		on_put = function(inv, toList, toIndex, stack, player)
			inv:set_stack(toList, toIndex, ItemStack(nil))
		end
	})

trashInv:set_size("main", 1)

-- get_formspec
inventory_plus.get_formspec = function(player, page)

	if not player then
		return
	end

	-- default inventory page
	local formspec = "size[8,7.5]"
		.. default.gui_bg
		.. default.gui_bg_img
		.. ""

	-- craft page
	if page == "craft" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

.. "image_button_exit[0,0;1,1;blocks.png;blocks;]"
.. "label[0.1,1;Blocks]"
.. "image_button_exit[1,0;1,1;stairs.png;stairs;]"
.. "label[1.1,1;Stairs]"
.. "image_button_exit[2,0;1,1;slabs.png;slabs;]"
.. "label[2.1,1;Slabs]"
.. "image_button_exit[3,0;1,1;windows.png;windows;]"
.. "label[3.1,1; Glass]"
.. "image_button_exit[4,0;1,1;lights.png;lights;]"
.. "label[4.1,1;Lights]"
.. "image_button_exit[5,0;1,1;waters.png;waters;]"
.. "label[5.1,1;Waters]"
.. "image_button_exit[6,0;1,1;doors.png;doors;] "
.. "label[6.1,1;Doors]"
.. "image_button_exit[7,0;1,1;carpets.png;carpets;]"
.. "label[7.1,1;Carpets]"
 .. "image_button_exit[0,2;1,1;trapdoor.png;trapdoor;]"
.. "label[0.1,3; Flaps ]"
 .. "image_button_exit[1,2;1,1;fence.png;fence;]"
.. "label[1.1,3;Fences]"
 .. "image_button_exit[2,2;1,1;chair.png;chair;]"
.. "label[2.1,3;Chairs]"
 .. "image_button_exit[3,2;1,1;table.png;table;]"
.. "label[3.1,3;Tables]"
 .. "image_button_exit[4,2;1,1;signs.png;signs;]"
.. "label[4.1,3;Signs]"
 .. "image_button_exit[5,2;1,1;beds.png;beds;]"
.. "label[5.1,3;Beds]"
 .. "image_button_exit[6,2;1,1;protect.png;protect;]"
.. "label[6.1,3;Protect]"
 .. "image_button_exit[0,4;1,1;cylinder.png;cylinder;]"
.. "label[0.0,5;Cylinder]"
 .. "image_button_exit[1,4;1,1;long.png;long;]"
.. "label[1.0,5;Triangle]"
 .. "image_button_exit[2,4;1,1;cone.png;cone;]"
.. "label[2.15,5;Cone]"
 .. "image_button_exit[3,4;1,1;sphere.png;sphere;]"
.. "label[3.0,5;Sphere]"
 .. "image_button_exit[4,4;1,1;cornera.png;outcorner;]"
.. "label[4.0,5;Corner a]"
 .. "image_button_exit[5.1,4;1,1;cornerb.png;incorner;]"
.. "label[5.1,5;Corner b]"
 .. "image_button_exit[7,5;1,1;nones.png;none;]"
.. "label[7.1,6;None]"
.. ""
.. "button[0.0,7;2,1;main;Back]"
	end
	
	-- main page
	if page == "main" then

		-- buttons
		local x, y = 2, 1

		for k, v in pairs(inventory_plus.buttons[player:get_player_name()]) do

			formspec = formspec 

.. "button[" .. x .. "," .. y .. ";4,2;" .. k .. ";" .. v .. "]"
.. "button_exit[2,5;4,2;quit;Quit]"

			x = x 
y = y + 2
		end
	end
	
	return formspec
end

-- register_on_joinplayer
minetest.register_on_joinplayer(function(player)

	inventory_plus.register_button(player,"craft", "Build")

	minetest.after(1, function()

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, inventory_plus.default))
	end)
end)

-- register_on_player_receive_fields
minetest.register_on_player_receive_fields(function(player, formname, fields)

	-- main

	if fields.main then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "main"))

		return
	end

	-- craft
	if fields.craft then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "craft"))

		return
	end

	-- creative
	if fields.creative_prev
	or fields.creative_next then

		minetest.after(0.1, function()

			inventory_plus.set_inventory_formspec(player,
				inventory_plus.get_formspec(player, "creative"))
		end)

		return
	end
end)
