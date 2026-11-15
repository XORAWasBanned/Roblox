-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.Tooltip
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("CoreGui")
local v_u_3 = require(v1.Packages.React)
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(script.Parent.Parent.Constants)
local v_u_6 = v5.Font.MainWindowHeader
local v_u_7 = v5.DefaultFontSize.MainWindowHeader
local v_u_8 = v5.Color.Text
local v_u_9 = v5.Color.UnselectedGray
local v_u_10 = v5.Tooltip.Padding
local v_u_11 = v5.Tooltip.Offset
local v_u_12 = v5.Tooltip.MaxWidth
local v_u_13 = v5.Tooltip.Delay
return function(p14) -- name: Tooltip
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_4, (copy) v_u_2, (copy) v_u_7, (copy) v_u_8, (copy) v_u_6, (copy) v_u_11, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12
	local v15, v_u_16 = v_u_3.useState(false)
	local v17 = p14.text
	local v18 = p14.pos
	v_u_3.useEffect(function()
		-- upvalues: (copy) v_u_16, (ref) v_u_13
		v_u_16(false)
		local v_u_19 = false
		task.delay(v_u_13, function()
			-- upvalues: (ref) v_u_19, (ref) v_u_16
			if not v_u_19 then
				v_u_16(true)
			end
		end)
		return function()
			-- upvalues: (ref) v_u_19
			v_u_19 = true
		end
	end, { v17, v18 })
	local v20 = v_u_4.createElement
	local v21 = v_u_4.Portal
	local v22 = {
		["target"] = v_u_2
	}
	local v23 = {}
	local v24 = v_u_4.createElement
	local v25 = {}
	local v26 = v_u_4.createElement
	local v27 = {
		["Text"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextWrapped"] = true,
		["TextXAlignment"] = nil,
		["Font"] = nil,
		["AutomaticSize"] = nil,
		["Position"] = nil,
		["BackgroundColor3"] = nil,
		["BackgroundTransparency"] = 0,
		["BorderSizePixel"] = 0,
		["Text"] = v17,
		["TextSize"] = v_u_7,
		["TextColor3"] = v_u_8,
		["TextXAlignment"] = Enum.TextXAlignment.Left,
		["Font"] = v_u_6,
		["AutomaticSize"] = Enum.AutomaticSize.XY,
		["Position"] = v18 + v_u_11,
		["BackgroundColor3"] = v_u_9
	}
	local v28 = {}
	local v29 = {
		["PaddingTop"] = v_u_10,
		["PaddingBottom"] = v_u_10,
		["PaddingLeft"] = v_u_10,
		["PaddingRight"] = v_u_10
	}
	v28.Padding = v_u_4.createElement("UIPadding", v29)
	v28.SizeConstraint = v_u_4.createElement("UISizeConstraint", {
		["MaxSize"] = Vector2.new(v_u_12, (1 / 0))
	})
	v25.Tooltip = v26("TextLabel", v27, v28)
	v23.TooltipContainer = v24("ScreenGui", {
		["DisplayOrder"] = 20,
		["IgnoreGuiInset"] = true,
		["OnTopOfCoreBlur"] = true,
		["Enabled"] = nil,
		["Enabled"] = v15
	}, v25)
	return v20(v21, v22, v23)
end