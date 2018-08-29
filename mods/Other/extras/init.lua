--
extras={}
    extras.playerhotbar     = tonumber(minetest.setting_get("playerhotbar")) or 8
    extras.path             = minetest.get_modpath("extras")
    extras.spawnpoint       = {x=0, y= 27 , z=0}
    extras.pingkick         = minetest.setting_getbool("pingkick") or nil
    extras.autorollback     = minetest.setting_getbool("autorollback") or nil
    extras.isplayer         = minetest.setting_getbool("isplayer") or nil
    extras.jail             = minetest.setting_getbool("jail") or nil
    extras.crash            = minetest.setting_getbool("crash_to_reset") or nil
    extras.empty            = minetest.setting_getbool("restart_if_empty") or nil
    extras.nospawn          = minetest.setting_getbool("restart_if_empty") or nil

-- dofile(extras.path .. "/join_leave.lua")
-- dofile(extras.path .. "/jail.lua")

extras.setprivs_jailed = function ( name)
    minetest.chat_send_all("*************************")
    minetest.chat_send_all(name.." has had all privs removed.")
    minetest.chat_send_all("*************************")
    minetest.chat_send_all(name.." is granted shout to explain themselves...")
    local privs = {}
    privs.shout = true
    minetest.set_player_privs(name, privs)
    return true
end

extras.setprivs_released = function ( name)
    minetest.chat_send_all(name.." is reset to basic privs.")
    local privs = {}
    privs.home = true
    privs.fly = true
    privs.fast = true
    privs.shout = true
    privs.interact = true
    minetest.set_player_privs(name, privs)
    return true
end

minetest.register_privilege("ismod", { description = "Allows one to promote players" })

minetest.register_chatcommand("rbc", {
    description = "who built it?",
    privs = {ismod = true},
    func = function( name, param)
        local cmd_def = minetest.chatcommands["rollback_check"]
        if cmd_def then
            minetest.chat_send_player(name, "Punch a node to ID builder...")
			cmd_def.func(name, "rollback_check 1 100000000")
		end
        return false
    end,
    })

minetest.register_chatcommand("rb", {
    description = "Demote & rollback Player",
    privs = {ismod = true},
    func = function( name, param)
        minetest.chat_send_all("Player "..param.." has privs removed, and all their work is being removed from the game.")
        local privs = minetest.get_player_privs(param)
        privs.spill = nil
        privs.outlander = nil
        privs.noclip = nil
        minetest.set_player_privs(param, privs)
        minetest.rollback_revert_actions_by("player:"..param, 100000000)
        return false
    end,
    })

if not extras.nospawn then
    minetest.register_chatcommand("spawn", {
        description = "Teleport player to spawn point.",
        privs = {interact=true},
        func = function ( name, param )
            local player = minetest.get_player_by_name(name)
            minetest.chat_send_player(player:get_player_name(), "Teleporting to spawn...")
            player:setpos(extras.spawnpoint)
            return true
        end,
    })
end

minetest.register_chatcommand("afk", {
    description = "Tell everyone you are afk.",
	privs = {interact=true},
    func = function ( name, param )
        local player = minetest.get_player_by_name(name)
        minetest.chat_send_all(name.." is AFK! "..param)
        return true
    end,
})

if extras.crash then
    minetest.register_chatcommand("r", {
        description = "Reset the server.",
        privs = {server=true},
        func = function ( name, param )
        --boop.boom(bob)
        minetest.request_shutdown("   !!!!!  SERVER RESTART... COUNT TO 10 THEN PRESS RECONNECT !!!", true)
        end,
    })
end
