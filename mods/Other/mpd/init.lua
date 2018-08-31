
mpd={}


mpd.pause_between_songs=minetest.settings:get("mpd.pause_between_songs") or 10

--end config

mpd.modpath=minetest.get_modpath("mpd")
if not mpd.modpath then
	error("mpd mod folder has to be named 'mpd'!")
end
--{name, length, gain~1}
mpd.songs = {}
local sfile, sfileerr=io.open(mpd.modpath..DIR_DELIM.."songs.txt")
if not sfile then error("Error opening songs.txt: "..sfileerr) end
for line in sfile:lines() do
	if line~="" and line[1]~="#" then
		local name, timeMinsStr, timeSecsStr, gainStr, title = string.match(line, "^(%S+)%s+(%d+):([%d%.]+)%s+([%d%.]+)%s*(.*)$")
		local timeMins, timeSecs, gain = tonumber(timeMinsStr), tonumber(timeSecsStr), tonumber(gainStr)
		if title=="" then title = name end
		if name and timeMins and timeSecs and gain then
			mpd.songs[#mpd.songs+1]={name=name, length=timeMins*60+timeSecs, lengthhr=timeMinsStr..":"..timeSecsStr, gain=gain, title=title}
		else
			minetest.log("warning", "[mpd] Misformatted song entry in songs.txt: "..line)
		end
	end
end
sfile:close()

if #mpd.songs==0 then
	print("[mpd]no songs registered, not doing anything")
	return
end

mpd.storage = minetest.get_mod_storage()

mpd.handles={}

mpd.playing=false
mpd.id_playing=nil
mpd.song_time_left=nil
mpd.time_next=10 --sekunden
mpd.id_last_played=nil

minetest.register_globalstep(function(dtime)
	if mpd.playing then
		if mpd.song_time_left<=0 then
			mpd.stop_song()
			mpd.time_next=mpd.pause_between_songs
		else
			mpd.song_time_left=mpd.song_time_left-dtime
		end
	elseif mpd.time_next then
		if mpd.time_next<=0 then
			mpd.next_song()
		else
			mpd.time_next=mpd.time_next-dtime
		end
	end
end)
mpd.play_song=function(id)
	if mpd.playing then
		mpd.stop_song()
	end
	local song=mpd.songs[id]
	if not song then return end
	for _,player in ipairs(minetest.get_connected_players()) do
		local pname=player:get_player_name()
		local pvolume=tonumber(mpd.storage:get_string("vol_"..pname))
		if not pvolume then pvolume=1 end
		if pvolume>0 then
			local handle = minetest.sound_play(song.name, {to_player=pname, gain=song.gain*pvolume})
			if handle then
				mpd.handles[pname]=handle
			end
		end
	end
	mpd.playing=id
	--adding 2 seconds as security
	mpd.song_time_left = song.length + 2
end
mpd.stop_song=function()
	for pname, handle in pairs(mpd.handles) do
		minetest.sound_stop(handle)
	end
	mpd.id_last_played=mpd.playing
	mpd.playing=nil
	mpd.handles={}
	mpd.time_next=nil
end

mpd.next_song=function()
	local next
	repeat
		next=math.random(1,#mpd.songs)
	until #mpd.songs==1 or next~=mpd.id_last_played
	mpd.play_song(next)
end

mpd.song_human_readable=function(id)
	if not tonumber(id) then return "<error>" end
	local song=mpd.songs[id]
	if not song then return "<error>" end
	return id..": "..song.title.." ["..song.lengthhr.."]"
end