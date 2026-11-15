-- Path: CorePackages.Packages._Index.Foundation.Foundation.Providers.Style.BackgroundStyleContext
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
require(v1.Components.Types)
local v_u_4 = require(v1.Providers.Style.useTokens)
local v_u_5 = v_u_3.createContext(nil)
function useBackgroundStyle() -- name: useBackgroundStyle
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
	local v6 = v_u_3.useContext(v_u_5)
	local v7 = v_u_4()
	if v6 == nil then
		return v7.Color.Surface.Surface_0
	else
		return v6
	end
end
return {
	["useBackgroundStyle"] = useBackgroundStyle,
	["Provider"] = v_u_5.Provider
}