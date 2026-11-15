-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.FTUXSlideshow
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = script.Parent.Parent
local v_u_4 = require(v3.Resources.FTUXSlideshowData)
local v_u_5 = require(v3.Resources.FTUXConstants)
require(v3.Enums.PlatformEnum)
local v_u_6 = require(v3.Components.Slideshow.Header)
local v_u_7 = require(v3.Components.Slideshow.Stepper)
local v_u_8 = require(v3.Components.Slideshow.Title)
local v_u_9 = require(v3.Components.Slideshow.Description)
local v_u_10 = require(v3.Components.Slideshow.EndItem)
local v_u_11 = require(v3.Events.EventHandler)
return function(p12) -- name: FTUXSlideshow
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_11, (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_7, (copy) v_u_10
	local v_u_13, v_u_14 = v_u_2.useState(1)
	local v_u_15 = p12.platform
	local v16 = v_u_4[v_u_15]
	local v17 = v_u_5[v_u_15].PanelConstants
	local v18 = v16[v_u_13]
	local v19 = v17.CONTENT_HEIGHT_RATIO
	local v20 = v17.FOOTER_HEIGHT_RATIO
	local v21 = v17.CONTENT_PADDING / v17.SLIDESHOW_FRAME_WIDTH
	local v22 = 1 - 2 * v21
	local v_u_23 = v_u_2.useCallback(function()
		-- upvalues: (copy) v_u_14, (copy) v_u_13
		v_u_14(v_u_13 + 1)
	end, { v_u_13 })
	v_u_2.useEffect(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_15, (copy) v_u_13, (copy) v_u_23
		v_u_11.StartEvents(v_u_15, v_u_13, v_u_23)
		return function()
			-- upvalues: (ref) v_u_11, (ref) v_u_15, (ref) v_u_13
			v_u_11.StopEvents(v_u_15, v_u_13)
		end
	end, { v_u_13 })
	local v24 = v_u_2.createElement
	local v25 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 0, 1, 0),
		["Position"] = UDim2.new(0, 0, 0, 0)
	}
	local v26 = {
		["UICorner"] = v_u_2.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0.05, 0)
		}),
		["SlideshowLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0.05, 0),
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Header"] = v_u_2.createElement(v_u_6, {
			["platform"] = v_u_15
		}),
		["ContentFrame"] = v_u_2.createElement("Frame", {
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["Size"] = UDim2.new(1, 0, v19, 0),
			["Position"] = UDim2.new(0, 0, 0, 0)
		}, {
			["Content"] = v_u_2.createElement("Frame", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Size"] = UDim2.new(v22, 0, 1, 0),
				["Position"] = UDim2.new(v21, 0, 0, 0)
			}, {
				["ContentLayout"] = v_u_2.createElement("UIListLayout", {
					["Padding"] = UDim.new(0.05, 0),
					["FillDirection"] = Enum.FillDirection.Vertical,
					["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
					["SortOrder"] = Enum.SortOrder.LayoutOrder
				}),
				["Title"] = v_u_2.createElement(v_u_8, {
					["platform"] = v_u_15,
					["currentIndex"] = v_u_13
				}),
				["Description"] = v_u_2.createElement(v_u_9, {
					["platform"] = v_u_15,
					["currentIndex"] = v_u_13
				}),
				["ImageFrame"] = v_u_2.createElement("Frame", {
					["LayoutOrder"] = 3,
					["BackgroundTransparency"] = 1,
					["Size"] = nil,
					["Position"] = nil,
					["Size"] = UDim2.new(1.2, 0, 0.4, 0),
					["Position"] = UDim2.new(0, 0, 0, 0)
				}, {
					["Image"] = v_u_2.createElement("ImageLabel", {
						["Image"] = nil,
						["BackgroundTransparency"] = 1,
						["Size"] = nil,
						["LayoutOrder"] = 3,
						["ScaleType"] = nil,
						["Image"] = v18.image,
						["Size"] = UDim2.new(1, 0, 1, 0),
						["ScaleType"] = Enum.ScaleType.Fit
					})
				})
			})
		})
	}
	local v27 = v_u_2.createElement
	local v28 = {
		["LayoutOrder"] = 3,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(1, 0, v20, 0),
		["Position"] = UDim2.new(0, 0, 0, 0)
	}
	local v29 = {}
	local v30 = v_u_2.createElement
	local v31 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["Size"] = UDim2.new(v22, 0, 1, 0),
		["Position"] = UDim2.new(v21, 0, 0, 0)
	}
	local v32 = {
		["ContentLayout"] = v_u_2.createElement("UIListLayout", {
			["Padding"] = v_u_13 ~= #v16 and UDim.new(0.2, 0) or UDim.new(0, 0),
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Stepper"] = v_u_2.createElement(v_u_7, {
			["layoutOrder"] = 1,
			["numberActivated"] = nil,
			["numberOfSteps"] = nil,
			["numberActivated"] = v_u_13,
			["numberOfSteps"] = #v16
		}, {}),
		["EndItem"] = v_u_2.createElement(v_u_10, {
			["platform"] = v_u_15,
			["currentIndex"] = v_u_13,
			["increaseCurrentIndex"] = v_u_23
		})
	}
	v29.Footer = v30("Frame", v31, v32)
	v26.FooterFrame = v27("Frame", v28, v29)
	return v24("Frame", v25, v26)
end