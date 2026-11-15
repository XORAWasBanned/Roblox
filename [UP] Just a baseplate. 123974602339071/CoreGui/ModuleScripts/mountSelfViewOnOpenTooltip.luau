-- Path: CoreGui.RobloxGui.Modules.SelfView.mountSelfViewOnOpenTooltip
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v_u_3 = game:GetService("CoreGui")
local v4 = require(v1.Packages.UIBlox)
local v5 = require(v1.Packages.Foundation).Enums.ColorMode
local v_u_6 = v4.App.Style.AppStyleProvider
local v_u_7 = v5.Dark
local v_u_8 = require(v1.Packages.Promise)
local v_u_9 = require(script.Parent.SelfViewTooltipFTUX)
return function(p10)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_9, (copy) v_u_8
	local v11 = Instance.new("ScreenGui")
	v11.Name = "SelfViewTooltipOnOpenGui"
	v11.DisplayOrder = -1
	v11.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	v11.Parent = v_u_3
	local v12 = v_u_2.createElement
	local v13 = v_u_6
	local v14 = {
		["style"] = {
			["themeName"] = v_u_7
		}
	}
	local v15 = {}
	local v16 = v_u_2.createElement
	local v17 = {
		["Position"] = nil,
		["Size"] = nil,
		["BackgroundTransparency"] = 0,
		["AnchorPoint"] = nil,
		["Visible"] = false,
		["Position"] = p10.position,
		["Size"] = p10.size,
		["AnchorPoint"] = p10.anchorPoint
	}
	local v18 = {
		["aspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
			["AspectRatio"] = nil,
			["AspectType"] = "ScaleWithParentSize",
			["DominantAxis"] = "Width",
			["AspectRatio"] = p10.aspectRatio
		}),
		["sizeConstraint"] = v_u_2.createElement("UISizeConstraint", {
			["MaxSize"] = p10.maxSize,
			["MinSize"] = p10.minSize
		})
	}
	local v19 = v_u_2.createElement
	local v20 = {
		["Position"] = nil,
		["Size"] = nil,
		["Visible"] = false,
		["BackgroundTransparency"] = 0,
		["Position"] = p10.bottomButtonsFramePosition,
		["Size"] = p10.bottomButtonsFrameSize
	}
	local v21 = {
		["tooltip"] = v_u_2.createElement(v_u_9, {
			["fallbackText"] = p10.fallbackText,
			["translationKey"] = p10.translationKey,
			["tooltipLifetime"] = p10.tooltipLifetime
		})
	}
	v18.bottomButtonsMock = v19("Frame", v20, v21)
	v15.frame = v16("Frame", v17, v18)
	local v22 = v12(v13, v14, v15)
	local v_u_23 = v_u_2.mount(v22, v11, "SelfViewTooltipOnOpenGui")
	local function v25()
		-- upvalues: (ref) v_u_2, (copy) v_u_23
		local function v24()
			-- upvalues: (ref) v_u_2, (ref) v_u_23
			v_u_2.unmount(v_u_23)
		end
		pcall(v24)
	end
	v_u_8.delay(p10.tooltipLifetime + 5):andThen(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_23
		local function v26()
			-- upvalues: (ref) v_u_2, (ref) v_u_23
			v_u_2.unmount(v_u_23)
		end
		pcall(v26)
	end)
	return {
		["instance"] = v_u_23,
		["unmount"] = v25
	}
end