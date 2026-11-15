-- Path: CoreGui.RobloxGui.Modules.Settings.Pages.ShareGame.Components.ConversationThumbnail
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v2.Settings.Pages.ShareGame.Constants)
local v_u_5 = require(v1.Workspace.Packages.UserLib).Utils.Constants
local v_u_6 = require(v1.Workspace.Packages.UserLib).Utils.getRbxthumbWithTypeSizeAndOptions
local v_u_7 = v_u_4.Color.GRAY3
local v_u_8 = v_u_4.InviteAvatarThumbnailSize
local v_u_9 = {
	{
		{
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["FrameSize"] = UDim2.new(1, 0, 1, 0),
			["FramePosition"] = UDim2.new(0, 0, 0, 0)
		}
	}
}
local v10 = {}
local v11 = {
	["Size"] = UDim2.new(2, 0, 1, 0),
	["Position"] = UDim2.new(-0.5, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 1, 0),
	["FramePosition"] = UDim2.new(0, 0, 0, 0),
	["Border"] = {
		["BorderPosition"] = UDim2.new(0.5, -1, 0, 0),
		["BorderSize"] = UDim2.new(0, 1, 1, 0)
	}
}
__set_list(v10, 1, {v11, {
	["Size"] = UDim2.new(2, 0, 1, 0),
	["Position"] = UDim2.new(-0.5, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 1, 0),
	["FramePosition"] = UDim2.new(0.5, 1, 0, 0)
}})
v_u_9[2] = v10
local v12 = {}
local v13 = {
	["Size"] = UDim2.new(2, 0, 1, 0),
	["Position"] = UDim2.new(-0.5, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 1, 0),
	["FramePosition"] = UDim2.new(0, 0, 0, 0),
	["Border"] = {
		["BorderPosition"] = UDim2.new(0.5, -1, 0, 0),
		["BorderSize"] = UDim2.new(0, 1, 1, 0)
	}
}
local v14 = {
	["Size"] = UDim2.new(1, 0, 1, 0),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 0.5, -1),
	["FramePosition"] = UDim2.new(0.5, 1, 0, 0),
	["Border"] = {
		["BorderPosition"] = UDim2.new(0.5, 0, 0.5, -1),
		["BorderSize"] = UDim2.new(0.5, 0, 0, 1)
	}
}
__set_list(v12, 1, {v13, v14, {
	["Size"] = UDim2.new(1, 0, 1, 0),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 0.5, -1),
	["FramePosition"] = UDim2.new(0.5, 1, 0.5, 1)
}})
v_u_9[3] = v12
local v15 = {}
local v16 = {
	["Size"] = UDim2.new(1, 0, 1, 0),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 0.5, -1),
	["FramePosition"] = UDim2.new(0, 0, 0, 0),
	["Border"] = {
		["BorderPosition"] = UDim2.new(0, 0, 0.5, -1),
		["BorderSize"] = UDim2.new(1, 0, 0, 1)
	}
}
local v17 = {
	["Size"] = UDim2.new(1, 0, 1, 0),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 0.5, -1),
	["FramePosition"] = UDim2.new(0.5, 1, 0, 0)
}
local v18 = {
	["Size"] = UDim2.new(1, 0, 1, 0),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 0.5, -1),
	["FramePosition"] = UDim2.new(0, 0, 0.5, 1),
	["Border"] = {
		["BorderPosition"] = UDim2.new(0.5, -1, 0, 0),
		["BorderSize"] = UDim2.new(0, 1, 1, 0)
	}
}
__set_list(v15, 1, {v16, v17, v18, {
	["Size"] = UDim2.new(1, 0, 1, 0),
	["Position"] = UDim2.new(0, 0, 0, 0),
	["FrameSize"] = UDim2.new(0.5, -1, 0.5, -1),
	["FramePosition"] = UDim2.new(0.5, 1, 0.5, 1)
}})
v_u_9[4] = v15
local v19 = v_u_3.PureComponent:extend("ConversationThumbnail")
function v19.render(p20) -- name: render
	-- upvalues: (copy) v_u_9, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3, (copy) v_u_7
	local v21 = p20.props.size
	local v22 = p20.props.layoutOrder
	local v23 = p20.props.zIndex
	local v24 = p20.props.users
	local v25 = #v24
	local v26 = {}
	for v27, v28 in ipairs(v24) do
		local v29 = v_u_9[v25][v27]
		local v30
		if v28 then
			local v31 = v_u_5.RbxThumbnailSizeToNumberSize[v_u_8]
			v30 = v_u_6(v28.id, v_u_4.InviteAvatarRbxthumbType, v31)
		else
			v30 = nil
		end
		v26["AvatarHolder-" .. v27] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 1,
			["ClipsDescendants"] = true,
			["Size"] = nil,
			["Position"] = nil,
			["ZIndex"] = nil,
			["Size"] = v29.FrameSize,
			["Position"] = v29.FramePosition,
			["ZIndex"] = v23
		}, {
			["Avatar"] = v_u_3.createElement("ImageLabel", {
				["BackgroundTransparency"] = 1,
				["Size"] = nil,
				["Position"] = nil,
				["Image"] = nil,
				["ZIndex"] = nil,
				["Size"] = v29.Size,
				["Position"] = v29.Position,
				["Image"] = v30 or "rbxasset://textures/ui/LuaApp/graphic/ph-avatar-portrait.png",
				["ZIndex"] = v23
			})
		})
		if not v29.Border then
			continue
		end
		v26["Border-" .. v27] = v_u_3.createElement("Frame", {
			["Size"] = nil,
			["Position"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["ZIndex"] = nil,
			["Size"] = v29.Border.BorderSize,
			["Position"] = v29.Border.BorderPosition,
			["BackgroundColor3"] = v_u_7,
			["ZIndex"] = v23
		})
	end
	return v_u_3.createElement("Frame", {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["LayoutOrder"] = nil,
		["ZIndex"] = nil,
		["Size"] = v21,
		["LayoutOrder"] = v22,
		["ZIndex"] = v23
	}, {
		["ContentsContainer"] = v_u_3.createElement("Frame", {
			["BackgroundTransparency"] = 0,
			["Size"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = nil,
			["BackgroundColor3"] = nil,
			["BorderColor3"] = nil,
			["BorderSizePixel"] = 1,
			["ZIndex"] = nil,
			["Size"] = UDim2.new(1, -1, 1, -1),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["Position"] = UDim2.new(0.5, 0, 0.5, 0),
			["BackgroundColor3"] = v_u_4.Color.WHITE,
			["BorderColor3"] = v_u_7,
			["ZIndex"] = v23
		}, v26)
	})
end
return v19