-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.PresentationContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v1.Enums.ColorNamespace)
local v_u_4 = require(v2.React)
local v_u_5 = v_u_4.createContext({
	["isIconSize"] = false,
	["colorNamespace"] = nil,
	["colorNamespace"] = v3.Color
})
return {
	["Provider"] = v_u_5.Provider,
	["usePresentationContext"] = function() -- name: usePresentationContext
		-- upvalues: (copy) v_u_4, (copy) v_u_5
		return v_u_4.useContext(v_u_5)
	end
}