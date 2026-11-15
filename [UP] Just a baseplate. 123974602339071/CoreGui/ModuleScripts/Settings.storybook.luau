-- Path: CoreGui.RobloxGui.Modules.Settings.Settings.storybook
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.UIBlox)
v3.init(require(v1.Workspace.Packages.RobloxAppUIBloxConfig))
local v_u_4 = v3.App.Style.AppStyleProvider
v_u_2.setGlobalConfig({
	["elementTracing"] = true,
	["propValidation"] = true
})
local v_u_5 = {
	["Default"] = {
		["themeName"] = "Light",
		["fontName"] = "Gotham"
	},
	["Light"] = {
		["themeName"] = "Light",
		["fontName"] = "Gotham"
	},
	["Dark"] = {
		["themeName"] = "Dark",
		["fontName"] = "Gotham"
	}
}
return {
	["roact"] = v_u_2,
	["mapStory"] = function(p_u_6) -- name: mapStory
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
		return function(p7)
			-- upvalues: (ref) v_u_2, (ref) v_u_4, (ref) v_u_5, (copy) p_u_6
			return v_u_2.createElement(v_u_4, {
				["style"] = p7 and v_u_5[p7.theme] or v_u_5.Default
			}, {
				["Child"] = v_u_2.createElement(p_u_6, p7)
			})
		end
	end
}