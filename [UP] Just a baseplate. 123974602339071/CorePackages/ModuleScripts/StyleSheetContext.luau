-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.StyleSheetContext
local v1 = script:FindFirstAncestor("Foundation").Parent
local v2 = require(v1.Dash)
local v_u_3 = require(v1.React)
local v_u_4 = v2.None
local v_u_5 = v_u_3.createContext(v_u_4)
return {
	["Provider"] = v_u_5.Provider,
	["useStyleSheet"] = function() -- name: useStyleSheet
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
		local v6 = v_u_3.useContext(v_u_5)
		if v6 == v_u_4 then
			return nil
		else
			return v6
		end
	end
}