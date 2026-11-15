-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Slideshow.Title
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.UIBlox)
local v_u_4 = v_u_3.Core.Style.useStyle
local v_u_5 = require(v1.Workspace.Packages.Localization).withLocalization
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Resources.FTUXSlideshowData)
require(v6.Enums.PlatformEnum)
return function(p8) -- name: Title
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_3
	local v9 = v_u_4()
	local v_u_10 = v9.Theme
	local v_u_11 = v9.Font
	return v_u_5({
		["titleText"] = v_u_7[p8.platform][p8.currentIndex].title
	})(function(p12)
		-- upvalues: (ref) v_u_2, (ref) v_u_3, (copy) v_u_11, (copy) v_u_10
		return v_u_2.createElement(v_u_3.App.Text.StyledTextLabel, {
			["text"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["textXAlignment"] = nil,
			["size"] = nil,
			["layoutOrder"] = 1,
			["text"] = p12.titleText,
			["fontStyle"] = v_u_11.SubHeader1,
			["colorStyle"] = v_u_10.TextEmphasis,
			["textXAlignment"] = Enum.TextXAlignment.Left,
			["size"] = UDim2.new(1, 0, 0.031, 0)
		})
	end)
end