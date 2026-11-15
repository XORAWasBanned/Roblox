-- Path: CoreGui.RobloxGui.Modules.InspectAndBuy.Components.CloseButton
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("GuiService")
local v_u_3 = require(v1.Packages.Roact)
local v4 = require(v1.Packages.RoactRodux)
local v5 = script.Parent.Parent
local v_u_6 = require(v5.Actions.SetDetailsInformation)
local v_u_7 = require(v5.Actions.SetTryingOnInfo)
local v_u_8 = require(v5.Components.InspectAndBuyContext)
local v9 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_10 = require(v9.Settings.Theme)
local v11 = v_u_3.PureComponent:extend("CloseButton")
function v11.render(p12) -- name: render
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_10, (copy) v_u_2
	local v_u_13 = p12.props.view
	local v_u_14 = p12.props.detailsInformation.viewingDetails
	local v_u_15 = p12.props.closeDetails
	local v_u_16 = p12.props.setTryingOnInfo
	local v21 = {
		["render"] = function(p17) -- name: render
			-- upvalues: (copy) v_u_13, (ref) v_u_10, (ref) v_u_3, (copy) v_u_14, (copy) v_u_15, (copy) v_u_16, (ref) v_u_2
			local v18 = p17[v_u_13]
			local v19 = UDim2.new(0, 0, 0, 0)
			local v20
			if v_u_10.UseInspectAndBuyPanel() then
				v19 = UDim2.new(0, v18.BorderPaddingSize, 0, 0)
				v20 = 18
			else
				v20 = 26
			end
			return v_u_3.createElement("ImageButton", {
				["Size"] = UDim2.new(0, v20, 0, v20),
				["Position"] = v18.CloseButtonPosition + v19,
				["BackgroundTransparency"] = 1,
				["Selectable"] = false,
				["Image"] = v_u_14 and "rbxasset://textures/ui/InspectMenu/caret_tail_left.png" or "rbxasset://textures/ui/InspectMenu/x.png",
				["ZIndex"] = 2,
				[v_u_3.Event.Activated] = function()
					-- upvalues: (ref) v_u_14, (ref) v_u_15, (ref) v_u_16, (ref) v_u_2
					if v_u_14 then
						v_u_15()
						v_u_16(false, nil)
					else
						v_u_2:CloseInspectMenu()
					end
				end
			})
		end
	}
	return v_u_3.createElement(v_u_8.Consumer, v21)
end
return v4.UNSTABLE_connect2(function(p22, _)
	return {
		["view"] = p22.view,
		["detailsInformation"] = p22.detailsInformation
	}
end, function(p_u_23)
	-- upvalues: (copy) v_u_6, (copy) v_u_7
	return {
		["closeDetails"] = function() -- name: closeDetails
			-- upvalues: (copy) p_u_23, (ref) v_u_6
			p_u_23(v_u_6(false, nil))
		end,
		["setTryingOnInfo"] = function(p24, p25) -- name: setTryingOnInfo
			-- upvalues: (copy) p_u_23, (ref) v_u_7
			p_u_23(v_u_7(p24, p25))
		end
	}
end)(v11)