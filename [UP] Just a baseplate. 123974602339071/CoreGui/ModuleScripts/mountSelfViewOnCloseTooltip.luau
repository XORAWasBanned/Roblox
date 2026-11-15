-- Path: CoreGui.RobloxGui.Modules.SelfView.mountSelfViewOnCloseTooltip
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = game:GetService("CoreGui")
local v4 = v_u_3:WaitForChild("RobloxGui")
local v_u_5 = require(v4.Modules.TopBar.Constants)
local v6 = require(v1.Packages.UIBlox)
local v7 = require(v1.Packages.Foundation).Enums.ColorMode
local v_u_8 = v6.App.Style.AppStyleProvider
local v_u_9 = v7.Dark
local v_u_10 = require(v1.Packages.Promise)
local v_u_11 = require(script.Parent.SelfViewTooltipFTUX)
return function(p12)
	-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_2, (copy) v_u_8, (copy) v_u_9, (copy) v_u_11, (copy) v_u_10
	local v13 = Instance.new("ScreenGui")
	v13.Name = "SelfViewTooltipOnCloseGui"
	v13.DisplayOrder = -1
	v13.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	v13.Parent = v_u_3
	local v14 = v_u_5.useDisplayScaleState(v_u_5.TopBarButtonHeight)
	local v15 = v_u_5.useDisplayScaleState(v_u_5.ScreenSideOffset)
	local v16 = v_u_2.createElement
	local v17 = v_u_8
	local v18 = {
		["style"] = {
			["themeName"] = v_u_9
		}
	}
	local v19 = {}
	local v20 = v_u_2.createElement
	local v21 = {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 0,
		["Visible"] = false,
		["Position"] = UDim2.fromOffset(v15, -v14),
		["Size"] = UDim2.fromOffset(v14, v14)
	}
	local v22 = {
		["tooltip"] = v_u_2.createElement(v_u_11, {
			["fallbackText"] = p12.fallbackText,
			["translationKey"] = p12.translationKey,
			["tooltipLifetime"] = p12.tooltipLifetime
		})
	}
	v19.frame = v20("Frame", v21, v22)
	local v23 = v16(v17, v18, v19)
	local v_u_24 = v_u_2.mount(v23, v13, "SelfViewTooltipOnClose")
	v_u_10.delay(p12.tooltipLifetime + 5):andThen(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_24
		local function v25()
			-- upvalues: (ref) v_u_2, (ref) v_u_24
			v_u_2.unmount(v_u_24)
		end
		pcall(v25)
	end)
end