-- Path: CoreGui.RobloxGui.Modules.VoiceChatPrompt.VoiceChatPrompt.storybook
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
require(v1.Packages.UIBlox).init(require(v1.Workspace.Packages.RobloxAppUIBloxConfig))
v_u_2.setGlobalConfig({
	["elementTracing"] = true,
	["propValidation"] = true
})
return {
	["roact"] = v_u_2,
	["mapStory"] = function(p_u_3) -- name: mapStory
		-- upvalues: (copy) v_u_2
		return function(p4)
			-- upvalues: (ref) v_u_2, (copy) p_u_3
			return v_u_2.createElement(p_u_3, p4)
		end
	end
}