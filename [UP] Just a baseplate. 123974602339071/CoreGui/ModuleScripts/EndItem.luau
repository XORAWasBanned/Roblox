-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Slideshow.EndItem
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v_u_3 = require(v1.Packages.UIBlox)
local v_u_4 = v_u_3.Core.Style.useStyle
local v_u_5 = require(v1.Workspace.Packages.Localization).withLocalization
local v6 = script.Parent.Parent.Parent
local v_u_7 = require(v6.Resources.FTUXSlideshowData)
local v_u_8 = require(v6.Components.Slideshow.Button)
require(v6.Enums.PlatformEnum)
return function(p_u_9) -- name: EndItem
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_5, (copy) v_u_2, (copy) v_u_8, (copy) v_u_3
	local v10 = v_u_4()
	local v_u_11 = v10.Theme
	local v_u_12 = v10.Font
	local v_u_13 = v_u_7[p_u_9.platform]
	return v_u_5({
		["footerText"] = "CoreScripts.VRFTUX.Label.Footer"
	})(function(p14)
		-- upvalues: (copy) p_u_9, (copy) v_u_13, (ref) v_u_2, (ref) v_u_8, (ref) v_u_3, (copy) v_u_12, (copy) v_u_11
		return p_u_9.currentIndex ~= #v_u_13 and v_u_2.createElement(v_u_8, {
			["platform"] = p_u_9.platform,
			["currentIndex"] = p_u_9.currentIndex,
			["increaseCurrentIndex"] = p_u_9.increaseCurrentIndex
		}) or v_u_2.createElement(v_u_3.App.Text.StyledTextLabel, {
			["text"] = nil,
			["fontStyle"] = nil,
			["colorStyle"] = nil,
			["textXAlignment"] = nil,
			["textYAlignment"] = nil,
			["size"] = nil,
			["layoutOrder"] = 2,
			["text"] = p14.footerText,
			["fontStyle"] = v_u_12.CaptionHeader,
			["colorStyle"] = v_u_11.TextEmphasis,
			["textXAlignment"] = Enum.TextXAlignment.Center,
			["textYAlignment"] = Enum.TextYAlignment.Center,
			["size"] = UDim2.new(1, 0, 1, 0)
		})
	end)
end