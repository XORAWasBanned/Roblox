-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.LayoutValues
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = require(script.Parent.LayoutValuesContext)
return {
	["Provider"] = function(p4) -- name: layoutValuesProvider
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		return v_u_2.createElement(v_u_3.Provider, {
			["value"] = p4.layoutValues
		}, v_u_2.oneChild(p4[v_u_2.Children]))
	end,
	["Consumer"] = v_u_3.Consumer,
	["WithLayoutValues"] = function(p5) -- name: withLayoutValues
		-- upvalues: (copy) v_u_2, (copy) v_u_3
		local v6 = type(p5) == "function"
		assert(v6, "Expect withLayoutValues callback to be a function.")
		return v_u_2.createElement(v_u_3.Consumer, {
			["render"] = p5
		})
	end
}