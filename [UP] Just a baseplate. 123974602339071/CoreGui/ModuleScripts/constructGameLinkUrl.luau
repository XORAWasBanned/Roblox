-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Utility.constructGameLinkUrl
local v1 = script.Parent.Parent
local v_u_2 = require(v1.Network.Url)
return function(p3) -- name: constructGameLinkUrl
	-- upvalues: (copy) v_u_2
	return ("%*games/%*"):format(v_u_2.DOMAIN, p3)
end