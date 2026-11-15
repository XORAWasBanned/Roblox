-- Path: CorePackages.Packages._Index.HttpRequest.HttpRequest.HttpSession
local v1 = {}
local v_u_2 = 0
function v1.currentSession() -- name: currentSession
	-- upvalues: (ref) v_u_2
	return v_u_2
end
function v1.startNewSession() -- name: startNewSession
	-- upvalues: (ref) v_u_2
	v_u_2 = v_u_2 + 1
end
return v1