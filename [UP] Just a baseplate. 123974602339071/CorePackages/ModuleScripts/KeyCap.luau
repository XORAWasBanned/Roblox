-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Shortcut.KeyCap
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v_u_3 = require(v2.React)
local v_u_4 = require(v1.Components.Icon)
local v_u_5 = require(v1.Components.Text)
local v_u_6 = require(v1.Components.View)
require(v1.Enums.InputPlatform)
local v_u_7 = require(script.Parent.keyDisplay)
require(script.Parent.useShortcutVariants)
return function(p8) -- name: KeyCap
	-- upvalues: (copy) v_u_7, (copy) v_u_3, (copy) v_u_6, (copy) v_u_4, (copy) v_u_5
	local v9 = p8.variantProps
	local v10 = v_u_7.resolveKey(p8.keyCode, p8.platform)
	if v10 == nil then
		return nil
	end
	if v10.kind == "GamepadIcon" then
		return v_u_3.createElement(v_u_6, {
			["tag"] = v9.capless.tag,
			["LayoutOrder"] = p8.LayoutOrder,
			["testId"] = p8.testId
		}, {
			["Content"] = v_u_3.createElement(v_u_4, {
				["name"] = v10.icon,
				["size"] = v9.gamepadIcon.size,
				["style"] = v9.gamepadIcon.style,
				["testId"] = ("%*--icon"):format(p8.testId)
			})
		})
	end
	local v11
	if v10.kind == "Text" then
		v11 = (utf8.len(v10.text) or 0) > 1
	else
		v11 = false
	end
	local v12 = v_u_3.createElement
	local v13 = v_u_6
	local v14 = {
		["tag"] = v9.cap.tag,
		["padding"] = v11 and {
			["left"] = UDim.new(0, v9.capWide.padding),
			["right"] = UDim.new(0, v9.capWide.padding)
		} or nil,
		["LayoutOrder"] = p8.LayoutOrder,
		["testId"] = p8.testId
	}
	local v15 = {}
	local v16
	if v10.kind == "Icon" then
		v16 = v_u_3.createElement(v_u_4, {
			["name"] = v10.icon,
			["size"] = v9.icon.size,
			["style"] = v9.icon.style,
			["testId"] = ("%*--icon"):format(p8.testId)
		})
	else
		v16 = v_u_3.createElement(v_u_5, {
			["Text"] = v10.text,
			["tag"] = v9.text.tag,
			["testId"] = ("%*--text"):format(p8.testId)
		})
	end
	v15.Content = v16
	return v12(v13, v14, v15)
end