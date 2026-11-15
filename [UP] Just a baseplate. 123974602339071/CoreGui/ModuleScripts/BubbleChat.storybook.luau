-- Path: CoreGui.RobloxGui.Modules.InGameChat.BubbleChat.BubbleChat.storybook
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Cryo)
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v1.Packages.RoactRodux)
require(v1.Packages.UIBlox).init(require(v1.Workspace.Packages.RobloxAppUIBloxConfig))
local v_u_5 = require(script.Parent.Helpers.StoryStore)
local v_u_6 = require(script.Parent.ChatSettings)
v_u_3.setGlobalConfig({
	["elementTracing"] = true,
	["propValidation"] = true
})
return {
	["roact"] = v_u_3,
	["mapStory"] = function(p_u_7) -- name: mapStory
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2, (copy) v_u_6
		return function(p8)
			-- upvalues: (ref) v_u_3, (ref) v_u_4, (ref) v_u_5, (copy) p_u_7, (ref) v_u_2, (ref) v_u_6
			local v9 = v_u_3.createElement
			local v10 = v_u_4.StoreProvider
			local v11 = {
				["store"] = v_u_5
			}
			local v12 = {}
			local v13 = {
				["chatSettings"] = v_u_6
			}
			v12.Story = v_u_3.createElement(p_u_7, v_u_2.Dictionary.join(p8, v13))
			return v9(v10, v11, v12)
		end
	end
}