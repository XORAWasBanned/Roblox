-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Preferences.usePreferences
local v1 = script.Parent
local v2 = script:FindFirstAncestor("Foundation").Parent
local v_u_3 = require(v1.PreferencesContext)
local v_u_4 = require(v2.React)
return function() -- name: usePreferences
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	return v_u_4.useContext(v_u_3)
end