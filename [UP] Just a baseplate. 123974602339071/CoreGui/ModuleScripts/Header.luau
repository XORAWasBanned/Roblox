-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Slideshow.Header
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.UIBlox)
local v_u_4 = v_u_3.Core.Style.useStyle
local v_u_5 = require(v1.Workspace.Packages.Localization).withLocalization
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Resources.FTUXConstants)
require(v6.Enums.PlatformEnum)
return function(p8) -- name: Header
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v9 = v_u_4()
	local v_u_10 = v9.Theme
	local v_u_11 = v9.Font
	local v12 = v_u_7[p8.platform].PanelConstants
	local v_u_13 = v_u_10.BackgroundContrast.Color
	local v_u_14 = v12.HEADER_HEIGHT_RATIO
	local v_u_15 = v12.CONTENT_PADDING / v12.SLIDESHOW_FRAME_WIDTH
	local v_u_16 = 1 - 2 * v_u_15
	return v_u_5({
		["headerText"] = "CoreScripts.VRFTUX.Heading.Header"
	})(function(p17)
		-- upvalues: (ref) v_u_2, (copy) v_u_13, (copy) v_u_14, (copy) v_u_16, (copy) v_u_15, (ref) v_u_3, (copy) v_u_11, (copy) v_u_10
		local v18 = v_u_2.createElement
		local v19 = {
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0,
			["Size"] = nil,
			["LayoutOrder"] = 1,
			["BackgroundColor3"] = v_u_13,
			["Size"] = UDim2.new(1, 0, v_u_14, 0)
		}
		local v20 = {
			["UICorner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0.26, 0)
			})
		}
		local v21 = v_u_2.createElement
		local v22 = {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0)
		}
		local v23 = {}
		local v24 = v_u_2.createElement
		local v25 = {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(v_u_16, 0, 1, 0),
			["Position"] = UDim2.new(v_u_15, 0, 0, 0)
		}
		local v26 = {
			["HeaderText"] = v_u_2.createElement(v_u_3.App.Text.StyledTextLabel, {
				["text"] = nil,
				["fontStyle"] = nil,
				["colorStyle"] = nil,
				["textXAlignment"] = nil,
				["size"] = nil,
				["fluidSizing"] = true,
				["automaticSize"] = nil,
				["text"] = p17.headerText,
				["fontStyle"] = v_u_11.Header1,
				["colorStyle"] = v_u_10.TextEmphasis,
				["textXAlignment"] = Enum.TextXAlignment.Left,
				["size"] = UDim2.new(1, 0, 1, 0),
				["automaticSize"] = Enum.AutomaticSize.XY
			})
		}
		v23.Box = v24("Frame", v25, v26)
		v20.HeaderFrame = v21("Frame", v22, v23)
		return v18("Frame", v19, v20)
	end)
end