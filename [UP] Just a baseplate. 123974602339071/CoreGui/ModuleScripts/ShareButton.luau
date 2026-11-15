-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ShareButton
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_4 = require(v3.Modules.Settings.Theme)
local v_u_5 = v_u_4.font(Enum.Font.SourceSansSemibold, "Semibold")
local v_u_6 = v_u_4.textSize(19)
local v_u_7 = Color3.fromRGB(222, 225, 227)
local v_u_8 = Color3.fromRGB(255, 255, 255)
local v9 = v_u_2.PureComponent:extend("ShareButton")
function v9.init(p10) -- name: init
	p10.state = {
		["isHovering"] = false
	}
end
function v9.render(p_u_11) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_4, (copy) v_u_6, (copy) v_u_5
	local v12 = p_u_11.props.size
	local v13 = p_u_11.props.layoutOrder
	local v_u_14 = p_u_11.props.onShare
	local v_u_15 = p_u_11.props.isEnabled
	local v16 = p_u_11.props.text
	local v17 = {}
	local v18 = v_u_2.createElement
	local v19 = "UIStroke"
	local v20 = {
		["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border
	}
	local v21
	if p_u_11.state.isHovering and v_u_15 then
		v21 = v_u_7
	else
		v21 = v_u_8
	end
	v20.Color = v21
	v20.Thickness = v_u_4.DefaultStokeThickness
	v20.Transparency = v_u_15 and 0 or 0.5
	v17.Border = v18(v19, v20)
	v17.UICorner = v_u_2.createElement("UICorner", {
		["CornerRadius"] = v_u_4.DefaultCornerRadius
	})
	local v22 = v_u_2.createElement
	local v23 = "TextButton"
	local v24 = {
		["LayoutOrder"] = v13,
		["Size"] = v12,
		["Text"] = v16,
		["TextSize"] = v_u_6,
		["Font"] = v_u_5,
		["AutoButtonColor"] = false
	}
	local v25
	if p_u_11.state.isHovering and v_u_15 then
		v25 = v_u_7
	else
		v25 = v_u_8
	end
	v24.BackgroundColor3 = v25
	v24.Transparency = v_u_15 and 0 or 0.5
	v24[v_u_2.Event.Activated] = function()
		-- upvalues: (copy) v_u_15, (copy) v_u_14
		if v_u_15 then
			v_u_14()
		end
	end
	v24[v_u_2.Event.InputBegan] = function()
		-- upvalues: (copy) p_u_11
		p_u_11:setState({
			["isHovering"] = true
		})
	end
	v24[v_u_2.Event.InputEnded] = function()
		-- upvalues: (copy) p_u_11
		p_u_11:setState({
			["isHovering"] = false
		})
	end
	return v22(v23, v24, v17)
end
return v9