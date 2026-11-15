-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Spritesheets.ShareGameIcons
local v_u_1 = {}
local v2 = {
	["back"] = {
		["offset"] = Vector2.new(2, 19),
		["size"] = Vector2.new(24, 24)
	},
	["clear"] = {
		["offset"] = Vector2.new(6, 51),
		["size"] = Vector2.new(16, 16)
	},
	["invite"] = {
		["offset"] = Vector2.new(2, 75),
		["size"] = Vector2.new(24, 24)
	},
	["search_border"] = {
		["offset"] = Vector2.new(11, 1),
		["size"] = Vector2.new(7, 7)
	},
	["search_large"] = {
		["offset"] = Vector2.new(3, 132),
		["size"] = Vector2.new(22, 22)
	},
	["search_small"] = {
		["offset"] = Vector2.new(6, 106),
		["size"] = Vector2.new(16, 16)
	},
	["friends"] = {
		["offset"] = Vector2.new(0, 159),
		["size"] = Vector2.new(72, 72)
	},
	["cross"] = {
		["offset"] = Vector2.new(4, 231),
		["size"] = Vector2.new(24, 24)
	},
	["modal_border"] = {
		["offset"] = Vector2.new(0, 255),
		["size"] = Vector2.new(7, 7)
	}
}
v_u_1.frames = v2
return {
	["GetFrame"] = function(_, p3) -- name: GetFrame
		-- upvalues: (copy) v_u_1
		return v_u_1.frames[p3]
	end,
	["GetImagePath"] = function(_) -- name: GetImagePath
		return "rbxasset://textures/ui/Settings/ShareGame/icons.png"
	end,
	["ApplyImage"] = function(p4, p5, p6) -- name: ApplyImage
		local v7 = p4:GetFrame(p6)
		p5.Image = "rbxasset://textures/ui/Settings/ShareGame/icons.png"
		p5.ImageRectOffset = v7.offset
		p5.ImageRectSize = v7.size
	end
}