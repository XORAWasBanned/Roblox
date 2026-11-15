-- Path: CoreGui.RobloxGui.Modules.InGameMenu.Components.AssetImage
local v1 = game:GetService("CorePackages")
local v2 = require(v1.Packages.InGameMenuDependencies)
local v_u_3 = v2.Roact
local v_u_4 = v2.Cryo
local v5 = v2.UIBlox
local v6 = script.Parent.Parent
local v_u_7 = v5.Core.ImageSet.ImageSetLabel
local v_u_8 = v5.Core.ImageSet.ImageSetButton
local v_u_9 = require(v6.Resources.Assets)
return {
	["Label"] = v_u_3.forwardRef(function(p10, p11)
		-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7
		local v12 = p10.imageKey
		local v13 = v_u_9.Images[v12]
		if typeof(v13) == "string" then
			v13 = {
				["Image"] = v13
			}
		end
		local v14 = v_u_4.Dictionary.join(p10, {
			["imageKey"] = v_u_4.None
		}, v13, {
			["BackgroundTransparency"] = 1
		})
		return v_u_3.createElement(v_u_7, v_u_4.Dictionary.join(v14, {
			[v_u_3.Ref] = p11
		}))
	end),
	["Button"] = v_u_3.forwardRef(function(p15, p16)
		-- upvalues: (copy) v_u_9, (copy) v_u_4, (copy) v_u_3, (copy) v_u_8
		local v17 = p15.imageKey
		local v18 = v_u_9.Images[v17]
		if typeof(v18) == "string" then
			v18 = {
				["Image"] = v18
			}
		end
		local v19 = v_u_4.Dictionary.join(p15, {
			["imageKey"] = v_u_4.None
		}, v18, {
			["BackgroundTransparency"] = 1
		})
		return v_u_3.createElement(v_u_8, v_u_4.Dictionary.join(v19, {
			[v_u_3.Ref] = p16
		}))
	end)
}