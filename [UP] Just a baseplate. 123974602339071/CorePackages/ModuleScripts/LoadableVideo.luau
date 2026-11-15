-- Path: CorePackages.Packages._Index.MomentsCommon.MomentsCommon.Components.LoadableVideo
local v1 = script:FindFirstAncestor("MomentsCommon")
local v2 = v1.Parent
local v_u_3 = game:GetService("ContentProvider")
local v4 = require(v2.Foundation)
local v_u_5 = require(v2.React)
local v_u_6 = v4.Skeleton
local v_u_7 = v4.View
local v_u_8 = require(v1.Enums.LoadingState)
local v_u_9 = require(v1.Utils.getCropSize)
local v_u_10 = require(v1.Utils.getFitSize)
return function(p_u_11)
	-- upvalues: (copy) v_u_5, (copy) v_u_8, (copy) v_u_3, (copy) v_u_7, (copy) v_u_10, (copy) v_u_9, (copy) v_u_6
	local v12, v_u_13 = v_u_5.useState(Vector2.new(0, 0))
	local v_u_14, v_u_15 = v_u_5.useState(v_u_8.Loading)
	local v16, v_u_17 = v_u_5.useState(Vector2.new(0, 0))
	v_u_5.useEffect(function()
		-- upvalues: (copy) p_u_11, (ref) v_u_3, (copy) v_u_15, (ref) v_u_8
		if p_u_11.Video ~= nil and p_u_11.Video ~= "" then
			local v_u_19 = v_u_3:GetAssetFetchStatusChangedSignal(p_u_11.Video):Connect(function(p18)
				-- upvalues: (ref) v_u_15, (ref) v_u_8
				if p18 == Enum.AssetFetchStatus.Failure then
					v_u_15(v_u_8.Failed)
				end
			end)
			return function()
				-- upvalues: (copy) v_u_19, (ref) v_u_15, (ref) v_u_8
				v_u_19:Disconnect()
				v_u_15(v_u_8.Loading)
			end
		end
	end, { p_u_11.Video })
	local v21 = v_u_5.useCallback(function(p20)
		-- upvalues: (copy) v_u_13, (copy) p_u_11
		v_u_13(p20.AbsoluteSize)
		if p_u_11.onAbsoluteSizeChanged then
			p_u_11.onAbsoluteSizeChanged(p20)
		end
	end, { p_u_11.onAbsoluteSizeChanged, v_u_13 })
	local v24 = v_u_5.useCallback(function(p22)
		-- upvalues: (copy) v_u_17, (copy) p_u_11
		local v23 = p22.Resolution
		v_u_17(v23)
		if p_u_11.onResolutionChanged then
			p_u_11.onResolutionChanged(v23)
		end
	end, { p_u_11.onResolutionChanged, v_u_17 })
	local v26 = v_u_5.useCallback(function(p25)
		-- upvalues: (copy) v_u_14, (ref) v_u_8, (copy) v_u_15, (copy) p_u_11
		if v_u_14 == v_u_8.Loading then
			v_u_15(v_u_8.Finished)
		end
		p_u_11.onLoaded(p25)
	end, { v_u_14, p_u_11.onLoaded })
	if v_u_14 == v_u_8.Failed then
		return p_u_11.renderOnFailed()
	end
	local v27 = v_u_5.createElement
	local v28 = v_u_7
	local v29 = {
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = nil,
		["ClipsDescendants"] = nil,
		["isDisabled"] = true,
		["onAbsoluteSizeChanged"] = nil,
		["Position"] = nil,
		["Size"] = nil,
		["ZIndex"] = nil,
		["AnchorPoint"] = p_u_11.AnchorPoint,
		["BackgroundTransparency"] = p_u_11.BackgroundTransparency,
		["ClipsDescendants"] = p_u_11.ClipsDescendants ~= false,
		["onAbsoluteSizeChanged"] = v21,
		["Position"] = p_u_11.Position,
		["Size"] = p_u_11.Size,
		["ZIndex"] = p_u_11.ZIndex
	}
	local v30 = {}
	local v31 = v_u_5.createElement
	local v32 = "VideoFrame"
	local v33 = {
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["BackgroundTransparency"] = 1,
		["Looped"] = p_u_11.Looped == nil and true or p_u_11.Looped,
		["Playing"] = p_u_11.Playing,
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["ref"] = p_u_11.videoRef
	}
	local v34
	if p_u_11.scaleType == Enum.ScaleType.Fit then
		v34 = v_u_10(v12, v16)
	else
		v34 = v_u_9(v12, v16)
	end
	v33.Size = v34
	v33.Video = p_u_11.Video
	v33.VideoContent = p_u_11.VideoContent
	local v35
	if v16.X > 0 then
		v35 = v16.Y > 0
	else
		v35 = false
	end
	v33.Visible = v35
	v33[v_u_5.Change.Resolution] = v24
	v33[v_u_5.Event.Loaded] = v26
	local v36 = {}
	local v37
	if p_u_11.cornerRadius then
		v37 = v_u_5.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, p_u_11.cornerRadius)
		})
	else
		v37 = nil
	end
	v36.Corner = v37
	v30.VideoFrame = v31(v32, v33, v36)
	local v38
	if v_u_14 == v_u_8.Finished then
		v38 = nil
	else
		v38 = v_u_5.createElement(v_u_6, {
			["Size"] = nil,
			["ZIndex"] = 2,
			["Size"] = UDim2.fromScale(1, 1)
		})
	end
	v30.Shimmer = v38
	return v27(v28, v29, v30)
end