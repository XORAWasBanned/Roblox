-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.FeedbackAlert.useFeedbackAlertVariants
local v1 = script:FindFirstAncestor("Foundation")
require(v1.Components.Types)
local v_u_2 = require(v1.Enums.AlertSeverity)
local v_u_3 = require(v1.Utility.composeStyleVariant)
require(v1.Providers.Style.Tokens)
local v_u_4 = require(v1.Providers.Style.VariantsContext)
local function v_u_7(_, p5) -- name: createSeverityStyles
	local v6 = {
		["icon"] = {
			["style"] = p5
		},
		["stroke"] = {
			["Color"] = nil,
			["Transparency"] = nil,
			["Thickness"] = 1,
			["Color"] = p5.Color3,
			["Transparency"] = p5.Transparency
		},
		["backgroundStyle"] = {
			["Color3"] = nil,
			["Transparency"] = 0.95,
			["Color3"] = p5.Color3
		}
	}
	return v6
end
local function v_u_9(p8) -- name: variantsFactory
	-- upvalues: (copy) v_u_2, (copy) v_u_7
	return {
		["common"] = {
			["container"] = {
				["tag"] = "col align-x-left align-y-center gap-medium size-full-0 auto-y padding-large radius-medium"
			},
			["headerRow"] = {
				["tag"] = "row align-y-center gap-medium size-full-0 auto-y"
			},
			["title"] = {
				["tag"] = "shrink auto-xy text-title-medium text-truncate-split content-emphasis"
			},
			["subtitle"] = {
				["tag"] = "shrink auto-xy text-body-medium text-truncate-split content-default"
			},
			["description"] = {
				["tag"] = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left text-truncate-split content-default"
			},
			["link"] = {
				["tag"] = "shrink auto-xy text-body-medium text-truncate-split content-emphasis"
			}
		},
		["severity"] = {
			[v_u_2.Info] = v_u_7(p8, p8.Color.System.Emphasis),
			[v_u_2.Warning] = v_u_7(p8, p8.Color.System.Warning),
			[v_u_2.Success] = v_u_7(p8, p8.Color.System.Success),
			[v_u_2.Error] = v_u_7(p8, p8.Color.System.Alert)
		}
	}
end
return function(p10, p11)
	-- upvalues: (copy) v_u_4, (copy) v_u_9, (copy) v_u_3
	local v12 = v_u_4.useVariants("FeedbackAlert", v_u_9, p10)
	return v_u_3(v12.common, v12.severity[p11])
end