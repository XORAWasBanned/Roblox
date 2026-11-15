-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Button.getSharedVariants
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v1.Constants)
local v_u_4 = require(v2.Dash)
require(v1.Components.Types)
local v_u_5 = require(v1.Enums.ButtonVariant)
local v_u_6 = require(v1.Enums.ColorNamespace)
require(v1.Enums.StateLayerMode)
require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_7 = require(v1.Enums.InputSize)
local function v_u_19(p8, p9, p10) -- name: createButtonVariantStyles
	-- upvalues: (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	local v11 = {}
	for v12 in v_u_6 do
		local v13 = p8[v12]
		local v14
		if type(p9) == "table" then
			v14 = {
				["Foreground"] = v_u_4.get(v13, p9)
			}
		else
			v14 = v13[p9]
		end
		local v15 = {}
		local v16 = {
			["style"] = v14.Background
		}
		local v17
		if v14.Border then
			local v18 = v14.Border
			v17 = {
				["Color"] = v18.Color3,
				["Transparency"] = v18.Transparency
			}
		else
			v17 = nil
		end
		v16.stroke = v17
		v16.stateLayer = {
			["mode"] = v_u_3.COLOR_NAMESPACE_TO_STATE_LAYER_MODE[p10 or false][v12]
		}
		v15.container = v16
		v15.content = {
			["style"] = v14.Foreground
		}
		v11[v12] = v15
	end
	return v11
end
local function v_u_21(p20) -- name: getButtonTypes
	-- upvalues: (copy) v_u_5, (copy) v_u_19
	return {
		[v_u_5.Utility] = v_u_19(p20, "ActionUtility"),
		[v_u_5.Standard] = v_u_19(p20, "ActionStandard"),
		[v_u_5.Emphasis] = v_u_19(p20, "ActionEmphasis"),
		[v_u_5.Alert] = v_u_19(p20, "ActionAlert"),
		[v_u_5.SubEmphasis] = v_u_19(p20, "ActionSubEmphasis", true),
		[v_u_5.SoftEmphasis] = v_u_19(p20, "ActionSoftEmphasis"),
		[v_u_5.Subtle] = v_u_19(p20, "ActionSubtle"),
		[v_u_5.Text] = v_u_19(p20, { "Content", "Emphasis" }),
		[v_u_5.Link] = v_u_19(p20, { "Content", "Link" }),
		[v_u_5.OverMedia] = v_u_19(p20, "ActionOverMedia", true)
	}
end
local function v_u_32(p22) -- name: getSizes
	-- upvalues: (copy) v_u_7
	local v23 = {}
	local v24 = v_u_7.XSmall
	local v25 = {
		["container"] = {
			["radius"] = p22.Radius.Small,
			["height"] = p22.Size.Size_600
		}
	}
	v23[v24] = v25
	local v26 = v_u_7.Small
	local v27 = {
		["container"] = {
			["radius"] = p22.Radius.Medium,
			["height"] = p22.Size.Size_800
		}
	}
	v23[v26] = v27
	local v28 = v_u_7.Medium
	local v29 = {
		["container"] = {
			["radius"] = p22.Radius.Medium,
			["height"] = p22.Size.Size_1000
		}
	}
	v23[v28] = v29
	local v30 = v_u_7.Large
	local v31 = {
		["container"] = {
			["radius"] = p22.Radius.Medium,
			["height"] = p22.Size.Size_1200
		}
	}
	v23[v30] = v31
	return v23
end
return function(p33) -- name: getSharedVariants
	-- upvalues: (copy) v_u_32, (copy) v_u_21
	return {
		["sizes"] = v_u_32(p33),
		["types"] = v_u_21(p33)
	}
end