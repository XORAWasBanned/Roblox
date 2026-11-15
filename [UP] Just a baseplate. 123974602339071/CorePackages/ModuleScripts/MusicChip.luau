-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.MusicChip
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.Foundation)
local v_u_5 = require(v2.React)
local v_u_6 = v_u_4.Icon
local v_u_7 = v_u_4.Text
local v_u_8 = v_u_4.View
local v_u_9 = v3.Icon.MusicNote
local v_u_10 = require(v1.Hooks.useMusicInfo)
return function(p11) -- name: MusicChip
	-- upvalues: (copy) v_u_10, (copy) v_u_5, (copy) v_u_8, (copy) v_u_6, (copy) v_u_9, (copy) v_u_4, (copy) v_u_7
	local v12 = v_u_10(p11.musicAssetId)
	local v13 = v_u_5.createElement
	local v14 = v_u_8
	local v15 = {
		["tag"] = "align-x-center align-y-center auto-x bg-over-media-0 gap-medium padding-x-medium padding-y-xsmall radius-circle row size-0-800",
		["LayoutOrder"] = 1,
		["onActivated"] = nil,
		["onActivated"] = p11.onActivated
	}
	local v16 = {
		["Icon"] = v_u_5.createElement(v_u_6, {
			["name"] = nil,
			["LayoutOrder"] = 1,
			["size"] = nil,
			["name"] = v_u_9,
			["size"] = v_u_4.Enums.IconSize.Small
		})
	}
	local v17 = v_u_5.createElement
	local v18 = v_u_7
	local v19 = {
		["tag"] = "auto-xy content-action-standard text-align-x-left text-align-y-center text-caption-medium text-truncate-split",
		["sizeConstraint"] = nil,
		["LayoutOrder"] = 2,
		["Text"] = nil,
		["sizeConstraint"] = {
			["MaxSize"] = Vector2.new(100, (1 / 0))
		},
		["Text"] = v12.Title
	}
	v16.MusicTitle = v17(v18, v19)
	return v13(v14, v15, v16)
end