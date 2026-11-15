-- Path: CoreGui.RobloxGui.Modules.FTUX.Components.Slideshow.Button
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.UIBlox)
local v_u_4 = v3.App.Button.Button
local v_u_5 = v3.App.Button.Enum.ButtonType
local v_u_6 = v3.Core.Style.useStyle
local v7 = script.Parent.Parent.Parent
local v_u_8 = require(v7.Resources.FTUXSlideshowData)
local v_u_9 = require(v1.Workspace.Packages.Localization).withLocalization
require(v7.Enums.PlatformEnum)
local v_u_10 = require(v7.Enums.ButtonEnum)
return function(p11) -- name: SlideshowButton
	-- upvalues: (copy) v_u_6, (copy) v_u_8, (copy) v_u_9, (copy) v_u_5, (copy) v_u_10, (copy) v_u_2, (copy) v_u_4
	local v_u_12 = v_u_6().Font
	local v13 = v_u_8[p11.platform]
	local v14 = p11.currentIndex
	local v_u_15 = p11.increaseCurrentIndex
	local v_u_16 = v13[v14].button
	return v_u_9({
		["skip"] = "CoreScripts.VRFTUX.Action.Skip",
		["next"] = "CoreScripts.VRFTUX.Action.Next"
	})(function(p17)
		-- upvalues: (ref) v_u_5, (copy) v_u_16, (ref) v_u_10, (ref) v_u_2, (ref) v_u_4, (copy) v_u_12, (copy) v_u_15
		local v18 = v_u_5.Secondary
		local v19 = p17.skip
		if v_u_16 == v_u_10.NextButton then
			v18 = v_u_5.PrimaryContextual
			v19 = p17.next
		end
		return v_u_2.createElement(v_u_4, {
			["buttonType"] = nil,
			["text"] = nil,
			["fontStyle"] = nil,
			["layoutOrder"] = 4,
			["size"] = nil,
			["onActivated"] = nil,
			["buttonType"] = v18,
			["text"] = v19,
			["fontStyle"] = v_u_12.Body,
			["size"] = UDim2.new(1, 0, 0.6, 0),
			["onActivated"] = v_u_15
		})
	end)
end