-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.MusicPreviewItem
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v3 = require(v2.BuilderIcons)
local v_u_4 = require(v2.Foundation)
local v5 = require(v2.MomentsCommon)
local v_u_6 = require(v2.React)
local v_u_7 = v_u_4.IconButton
local v_u_8 = v_u_4.Skeleton
local v_u_9 = v_u_4.Text
local v_u_10 = v_u_4.View
local v_u_11 = v3.Icon.PlayLarge
local v_u_12 = v3.Icon.PauseLarge
local v_u_13 = v5.MusicThumbnailIcon
local v_u_14 = require(v1.Components.RadialProgressBar)
local v_u_15 = v_u_6.useBinding
local v_u_16 = v_u_6.useEffect
local v_u_17 = require(v1.Hooks.useMusicInfo)
local v_u_18 = v5.Enums.MusicThumbnailIconSize
return function(p_u_19)
	-- upvalues: (copy) v_u_17, (copy) v_u_15, (copy) v_u_16, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_13, (copy) v_u_18, (copy) v_u_9, (copy) v_u_7, (copy) v_u_12, (copy) v_u_11, (copy) v_u_4, (copy) v_u_14
	local v20 = v_u_17(p_u_19.musicAssetId)
	local v21, v_u_22 = v_u_15(p_u_19.progress or 0)
	v_u_16(function()
		-- upvalues: (copy) v_u_22, (copy) p_u_19
		v_u_22(p_u_19.progress or 0)
	end, { p_u_19.progress })
	local v23 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_19
		if p_u_19.onMusicSelected then
			p_u_19.onMusicSelected(p_u_19.musicAssetId)
		end
	end, { p_u_19.onMusicSelected, p_u_19.musicAssetId })
	local v24 = v_u_6.useCallback(function()
		-- upvalues: (copy) p_u_19
		if p_u_19.togglePreviewMusic then
			p_u_19.togglePreviewMusic(p_u_19.musicAssetId)
		end
	end, { p_u_19.togglePreviewMusic, p_u_19.musicAssetId })
	if not v20 then
		return v_u_6.createElement(v_u_8, {
			["Size"] = UDim2.new(1, 0, 0, 64)
		})
	end
	local v25 = v_u_6.createElement
	local v26 = v_u_10
	local v27 = {
		["LayoutOrder"] = nil,
		["onActivated"] = nil,
		["tag"] = "align-x-left align-y-center auto-y row gap-medium padding-x-xsmall padding-y-small radius-medium",
		["Size"] = nil,
		["LayoutOrder"] = p_u_19.layoutOrder
	}
	if not p_u_19.onMusicSelected then
		v23 = nil
	end
	v27.onActivated = v23
	v27.Size = UDim2.fromScale(1, 0)
	local v28 = {
		["MusicThumbnail"] = v_u_6.createElement(v_u_13, {
			["assetId"] = v20.AssetId,
			["size"] = v_u_18.Large
		}),
		["MusicInfo"] = v_u_6.createElement(v_u_10, {
			["LayoutOrder"] = 2,
			["tag"] = "auto-y col gap-xsmall size-full-0 shrink"
		}, {
			["Title"] = v_u_6.createElement(v_u_9, {
				["Text"] = nil,
				["tag"] = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-align-y-top",
				["Text"] = v20.Title
			}),
			["Artist"] = v_u_6.createElement(v_u_9, {
				["Text"] = nil,
				["tag"] = "auto-xy text-body-small content-neutral text-truncate-end text-align-x-left text-align-y-top",
				["Text"] = v20.Artist
			})
		})
	}
	local v29
	if p_u_19.togglePreviewMusic then
		local v30 = v_u_6.createElement
		local v31 = v_u_10
		local v32 = {
			["LayoutOrder"] = 3,
			["tag"] = "anchor-center-center clip position-center-center radius-circle size-900-900 padding-xxsmall"
		}
		local v33 = {}
		local v34 = v_u_6.createElement
		local v35 = v_u_7
		local v36 = {
			["icon"] = nil,
			["isCircular"] = true,
			["onActivated"] = nil,
			["size"] = nil,
			["variant"] = nil
		}
		local v37
		if p_u_19.isPreviewing then
			v37 = v_u_12
		else
			v37 = v_u_11
		end
		v36.icon = v37
		v36.onActivated = v24
		v36.size = v_u_4.Enums.IconSize.Small
		v36.variant = v_u_4.Enums.ButtonVariant.Standard
		v33.PlaybackIndicator = v34(v35, v36)
		local v38
		if p_u_19.progress then
			v38 = v_u_6.createElement(v_u_14, {
				["progress"] = v21
			})
		else
			v38 = nil
		end
		v33.ProgressBar = v38
		v29 = v30(v31, v32, v33)
	else
		v29 = nil
	end
	v28.PlaybackButton = v29
	return v25(v26, v27, v28)
end