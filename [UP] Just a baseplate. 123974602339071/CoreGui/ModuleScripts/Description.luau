-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Slideshow.Description
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.UIBlox)
local v_u_4 = v_u_3.Core.Style.useStyle
local v5 = script.Parent.Parent.Parent
local v_u_6 = require(v5.Resources.FTUXSlideshowData)
local v_u_7 = require(v1.Packages.LuauPolyfill)
require(v5.Enums.PlatformEnum)
local v_u_8 = require(v1.Workspace.Packages.Localization).withLocalization
return function(p9) -- name: Description
	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_8, (copy) v_u_2, (copy) v_u_7, (copy) v_u_3
	local v10 = v_u_4()
	local v_u_11 = v10.Theme
	local v_u_12 = v10.Font
	local v_u_13 = v_u_6[p9.platform][p9.currentIndex].text
	return v_u_8(v_u_13)(function(p_u_14)
		-- upvalues: (ref) v_u_2, (ref) v_u_7, (copy) v_u_13, (ref) v_u_3, (copy) v_u_12, (copy) v_u_11
		return v_u_2.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0.4, 0),
			["Position"] = UDim2.new(0, 0, 0, 0)
		}, v_u_2.createElement("UIListLayout", {
			["Padding"] = UDim.new(0, 0),
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Center,
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}), v_u_7.Array.map(v_u_13, function(_, p15)
			-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) p_u_14, (ref) v_u_12, (ref) v_u_11, (ref) v_u_13
			return v_u_2.createElement(v_u_3.App.Text.StyledTextLabel, {
				["text"] = p_u_14[p15],
				["fontStyle"] = v_u_12.CaptionBody,
				["colorStyle"] = v_u_11.TextDefault,
				["textXAlignment"] = Enum.TextXAlignment.Left,
				["size"] = UDim2.new(1, 0, 1 / #v_u_13, 0),
				["layoutOrder"] = p15
			})
		end))
	end)
end