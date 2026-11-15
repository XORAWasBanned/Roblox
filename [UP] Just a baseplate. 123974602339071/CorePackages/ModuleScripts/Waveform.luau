-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.Waveform
local v1 = script:FindFirstAncestor("MomentsCreationFlow")
local v2 = v1.Parent
local v_u_3 = require(v2.Dash)
local v4 = require(v2.Foundation)
local v_u_5 = require(v2.React)
local v_u_6 = v4.View
local v_u_7 = require(v1.Hooks.useAudioWaveform)
local v_u_8 = v4.Hooks.useTokens
local v9 = require(v1.Constants)
local v_u_10 = v9.AudioWaveform.WaveformWidth
local v_u_11 = v9.AudioWaveform.WaveformPadding
local v_u_12 = v9.AudioWaveform.WaveformMinHeight
return v_u_5.forwardRef(function(p_u_13, p14) -- name: Waveform
	-- upvalues: (copy) v_u_8, (copy) v_u_7, (copy) v_u_5, (copy) v_u_6, (copy) v_u_11, (copy) v_u_3, (copy) v_u_10, (copy) v_u_12
	local v_u_15 = v_u_8()
	local v_u_16 = v_u_7(p_u_13.audioAssetId, p_u_13.videoDuration)
	v_u_5.useEffect(function()
		-- upvalues: (copy) v_u_16, (copy) p_u_13
		if v_u_16 and #v_u_16 > 0 then
			p_u_13.onWaveformReady()
		end
	end, { p_u_13.audioAssetId, p_u_13.onWaveformReady, v_u_16 })
	local v17 = v_u_5.createElement
	local v18 = v_u_6
	local v19 = {
		["Position"] = nil,
		["tag"] = "align-x-left align-y-center anchor-center-left auto-x size-0-full row",
		["ZIndex"] = nil,
		["layout"] = nil,
		["ref"] = nil,
		["Position"] = p_u_13.position,
		["ZIndex"] = p_u_13.zIndex,
		["layout"] = {
			["FillDirection"] = Enum.FillDirection.Horizontal,
			["Padding"] = UDim.new(0, v_u_11)
		},
		["ref"] = p14
	}
	return v17(v18, v19, v_u_3.map(v_u_16, function(p20, p21)
		-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_10, (ref) v_u_12, (copy) v_u_15
		return v_u_5.createElement(v_u_6, {
			["key"] = nil,
			["LayoutOrder"] = nil,
			["Size"] = nil,
			["backgroundStyle"] = nil,
			["tag"] = "radius-circle",
			["key"] = p21,
			["LayoutOrder"] = p21,
			["Size"] = UDim2.new(0, v_u_10, p20, v_u_12),
			["backgroundStyle"] = v_u_15.Color.Content.Muted
		})
	end))
end)