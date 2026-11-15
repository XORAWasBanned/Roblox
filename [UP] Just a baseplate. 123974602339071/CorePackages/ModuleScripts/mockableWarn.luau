-- Path: CorePackages.Packages._Index.FocusNavigationUtils.FocusNavigationUtils.mockableWarn
local v_u_1 = warn
local v3 = {
	["mock"] = function(p2) -- name: mock
		-- upvalues: (ref) v_u_1
		v_u_1 = p2
	end,
	["unmock"] = function() -- name: unmock
		-- upvalues: (ref) v_u_1
		v_u_1 = warn
	end
}
local v4 = {
	["__call"] = function(_, ...) -- name: __call
		-- upvalues: (ref) v_u_1
		v_u_1(...)
	end
}
return setmetatable(v3, v4)