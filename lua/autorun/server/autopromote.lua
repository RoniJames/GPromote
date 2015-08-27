--Group to start promoting people
local startinggroup = "member"
-- Last group in the inheritance tree that should be promoted
local endinggroup = "tmod"
--Put any extra groups you dont want being demoted/promoted
--format = [NEXTNUMBER] = "GROUP", <--- dont forget the comma
local extrablacklisted = {
[1] = "vip",
[2] = "vip+",

}
-- format = [HOURS] = "RANK", <--- dont forget the comma
local autopromote = {  
[24] = "regular",
[50] = "trusted",
[80] = "veteran",

}

timer.Create( "autopromotev2", 10, 0, function()
	for k,v in pairs( player.GetAll() ) do
	local uptime = v:GetUTimeTotalTime() / 3600
		for t,r in pairs( autopromote ) do		
			if uptime >= t and v:CheckGroup( startinggroup ) and !v:CheckGroup( endinggroup ) and !table.HasValue(extrablacklisted,v:GetUserGroup()) and !v:IsAdmin() and !v:CheckGroup( r ) then
				RunConsoleCommand( "ulx","adduser", v:Nick(), r )
			elseif uptime < t and v:CheckGroup(r) then
				RunConsoleCommand("ulx","adduser",v:Nick(),startinggroup)
			end
		end
	end
end )