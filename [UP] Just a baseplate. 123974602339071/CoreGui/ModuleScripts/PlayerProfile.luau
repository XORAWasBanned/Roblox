-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.PlayerProfile
local v1 = game:GetService("CoreGui").RobloxGui
local v_u_2 = require(v1.Modules.Settings.ReactPageFactory)
local v_u_3 = require(script.PlayerProfileContainer)
function createPlayerProfilePage() -- name: createPlayerProfilePage
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	local v4 = v_u_2:createNewPage("PlayerProfile")
	v4:setPage(v_u_3)
	return v4
end
return createPlayerProfilePage()