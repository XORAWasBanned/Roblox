-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Shortcut.keyDisplay
local v1 = script:FindFirstAncestor("Foundation")
local v_u_2 = require(v1.Utility.Wrappers.Services).UserInputService
require(v1.Enums.InputPlatform)
local v_u_3 = require(v1.Utility.getIconForKeyCode)
local v_u_4 = {}
for _, v5 in Enum.KeyCode:GetEnumItems() do
	v_u_4[v5.Name] = v5
end
local v_u_6 = {
	["RightAlt"] = "LeftAlt",
	["RightControl"] = "LeftControl",
	["RightMeta"] = "LeftMeta",
	["RightShift"] = "LeftShift",
	["RightSuper"] = "LeftSuper"
}
local v_u_7 = {
	["BackSlash"] = "\\",
	["Backquote"] = "`",
	["Comma"] = ",",
	["Equals"] = "=",
	["LeftBracket"] = "[",
	["Minus"] = "-",
	["PageDown"] = "Page Down",
	["PageUp"] = "Page Up",
	["Period"] = ".",
	["Quote"] = "\'",
	["RightBracket"] = "]",
	["Semicolon"] = ";",
	["Slash"] = "/",
	["QuotedDouble"] = "\"",
	["Hash"] = "#",
	["Dollar"] = "$",
	["Percent"] = "%",
	["Ampersand"] = "&",
	["LeftParenthesis"] = "(",
	["RightParenthesis"] = ")",
	["Plus"] = "+",
	["LessThan"] = "<",
	["GreaterThan"] = ">",
	["Question"] = "?",
	["At"] = "@",
	["Underscore"] = "_",
	["Colon"] = ":",
	["Pipe"] = "|",
	["LeftCurly"] = "{",
	["RightCurly"] = "}",
	["Tilde"] = "~",
	["Euro"] = "\226\130\172",
	["MouseLeftButton"] = "Left mouse button",
	["MouseMiddleButton"] = "Middle mouse button",
	["MouseRightButton"] = "Right mouse button",
	["MouseWheel"] = "Mouse wheel",
	["Thumbstick1Up"] = "Left stick up",
	["Thumbstick1Down"] = "Left stick down",
	["Thumbstick1Left"] = "Left stick left",
	["Thumbstick1Right"] = "Left stick right",
	["Thumbstick2Up"] = "Right stick up",
	["Thumbstick2Down"] = "Right stick down",
	["Thumbstick2Left"] = "Right stick left",
	["Thumbstick2Right"] = "Right stick right"
}
local v_u_8 = {
	["MouseDelta"] = true,
	["MousePosition"] = true,
	["None"] = true,
	["TouchPosition"] = true,
	["TrackpadPan"] = true,
	["TrackpadPinch"] = true,
	["Unknown"] = true
}
return {
	["isNonDisplayable"] = function(p9) -- name: isNonDisplayable
		-- upvalues: (copy) v_u_8
		return v_u_8[p9.Name] == true
	end,
	["resolveKey"] = function(p_u_10, p11) -- name: resolveKey
		-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7, (copy) v_u_2
		if v_u_8[p_u_10.Name] == true then
			return nil
		end
		local v12 = v_u_6[p_u_10.Name]
		if v12 ~= nil then
			p_u_10 = v_u_4[v12] or p_u_10
		end
		local v13 = v_u_3(p_u_10, p11)
		if v13 then
			local v14 = p_u_10.Name
			return ((v14:match("^Button") ~= nil or v14:match("^DPad") ~= nil) and true or v14:match("^Thumbstick") ~= nil) and {
				["kind"] = "GamepadIcon",
				["icon"] = nil,
				["icon"] = v13
			} or {
				["kind"] = "Icon",
				["icon"] = nil,
				["icon"] = v13
			}
		end
		local v15 = v_u_7[p_u_10.Name]
		if v15 then
			return {
				["kind"] = "Text",
				["text"] = nil,
				["text"] = v15
			}
		end
		local v16 = {
			["kind"] = "Text",
			["text"] = nil
		}
		local function v17()
			-- upvalues: (ref) v_u_2, (copy) p_u_10
			return v_u_2:GetStringForKeyCode(p_u_10)
		end
		local v18, v19 = pcall(v17)
		if not v18 or (typeof(v19) ~= "string" or v19 == "") then
			v19 = nil
		end
		v16.text = v19 or p_u_10.Name
		return v16
	end
}