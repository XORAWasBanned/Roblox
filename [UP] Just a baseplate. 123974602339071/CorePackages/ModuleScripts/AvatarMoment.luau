-- Path: CorePackages.Packages._Index.MomentScenes.MomentScenes.Builders.AvatarMoment
require(script.Parent.Parent.Types)
local v_u_1 = require(script.Parent._Utils.avatarFloorPosition)
local v_u_2 = require(script.Parent._Utils.frameCamera)
local v_u_3 = require(script.Parent._Utils.cameraPath)
local v_u_4 = require(script.Parent._Utils.avatarBackground)
local v_u_5 = require(script.Parent._Utils.avatarRig)
local v_u_6 = require(script.Parent._Utils.createPlayhead)
local v_u_7 = require(script.addKeyLight)
local v_u_8 = require(script.addFallbackBackdrop)
local v_u_9 = require(script.resolveOutfit)
local v_u_10 = require(script.emotes)
local v_u_11 = require(script.Flags)
local function v_u_15(p12, p13) -- name: resolveEmoteId
	-- upvalues: (copy) v_u_10
	if v_u_10.isName(p12.emote) then
		return v_u_10.resolve(p12.emote, p13)
	end
	if p12.emote ~= nil then
		warn((("AvatarMoment: unknown emote %*, falling through to emoteId or wave"):format(p12.emote)))
	end
	local v14 = p12.emoteId
	if typeof(v14) ~= "number" or p12.emoteId <= 0 then
		return v_u_10.resolve("wave", p13)
	end
	if p13 == Enum.HumanoidRigType.R6 then
		warn((("AvatarMoment: emoteId %* plays as authored on an R6 rig, and an R15 clip will not move it. The emote arg resolves per rig."):format(p12.emoteId)))
	end
	return p12.emoteId
end
local function v_u_19(p16) -- name: resolveSnapshot
	-- upvalues: (copy) v_u_9
	local v17 = p16.outfitId
	if typeof(v17) ~= "number" or v17 <= 0 then
		v17 = nil
	end
	local v18 = p16.userId
	if typeof(v18) ~= "number" or v18 <= 0 then
		v18 = nil
	end
	if v17 ~= nil and v18 ~= nil then
		error("AvatarMoment: supply outfitId or userId, not both")
	end
	if v17 ~= nil then
		return v_u_9.resolve(v17)
	end
	if v18 ~= nil then
		return v_u_9.resolveUser(v18)
	end
	error("AvatarMoment: outfitId or userId (positive number) is required")
end
return function(p20) -- name: buildAvatarMoment
	-- upvalues: (copy) v_u_11, (copy) v_u_19, (copy) v_u_9, (copy) v_u_7, (copy) v_u_4, (copy) v_u_8, (copy) v_u_5, (copy) v_u_1, (copy) v_u_3, (copy) v_u_2, (copy) v_u_15, (copy) v_u_6
	local v21 = p20 or {}
	local v22
	if v_u_11.MomentScenesAvatarMomentUserId then
		v22 = v_u_19(v21)
	else
		local v23 = v21.outfitId
		if typeof(v23) ~= "number" or v21.outfitId <= 0 then
			error("AvatarMoment: outfitId (positive number) is required")
		end
		v22 = v_u_9.resolve(v21.outfitId)
	end
	local v24 = Instance.new("Model")
	v24.Name = "Live3DScene"
	local v25 = v21.backgroundAssetId
	v_u_7(v24)
	if typeof(v25) ~= "number" or v25 <= 0 then
		v25 = v_u_4.DEFAULT_ASSET_ID
	end
	local v26 = v_u_4.attach(v24, v25)
	if v26 == nil then
		v_u_8(v24)
	end
	v24.WorldPivot = CFrame.new()
	if v26 ~= nil then
		v_u_4.pinToParent(v26, v24)
	end
	local v27 = v_u_5.createAvatar(v22.humanoidDescription, v22.rigType)
	v27.Name = "Avatar"
	local v_u_28 = v27:FindFirstChildOfClass("Humanoid")
	if v_u_28 ~= nil then
		v_u_28.NameOcclusion = Enum.NameOcclusion.OccludeAll
		v_u_28.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		v_u_28.NameDisplayDistance = 0
	end
	v_u_1.positionOnFloor(v27, 0, CFrame.new())
	v27.Parent = v24
	local v_u_29 = Instance.new("Camera")
	v_u_29.Name = "SceneCamera"
	v_u_29.CameraType = Enum.CameraType.Scriptable
	v_u_29.FieldOfView = 56
	v_u_29.Parent = v24
	local v30 = v21.cameraPath or "subtle"
	local v_u_31 = v_u_3.resolve(v30)
	local v32
	if v_u_3.framingFor(v30) == "face" then
		v32 = v_u_2.fitStandingFace
	else
		v32 = v_u_2.fitStandingCharacters
	end
	local _, v_u_33, v_u_34 = v32({ v27 }, v_u_29.FieldOfView)
	v_u_29.Focus = CFrame.new(v_u_33)
	local v35 = v_u_15(v21, v22.rigType)
	local v36 = v_u_5.playEmote(v27, v35)
	local v_u_37 = v36 == nil and {} or { v36 }
	local function v40() -- name: duration
		-- upvalues: (copy) v_u_37
		local v38 = 0
		for _, v39 in v_u_37 do
			if v38 >= v39.Length then
				continue
			end
			v38 = v39.Length
		end
		return v38 <= 0 and 0 or v38 * 4
	end
	local v41 = v_u_6
	local v42 = {
		["root"] = v24,
		["tracks"] = v_u_37
	}
	local v43
	if v_u_28 == nil then
		v43 = nil
	else
		v43 = v_u_28:FindFirstChildOfClass("Animator")
	end
	v42.animator = v43
	v42.getDuration = v40
	function v42.syncVisuals(p44) -- name: syncVisuals
		-- upvalues: (copy) v_u_37, (copy) v_u_29, (ref) v_u_3, (copy) v_u_33, (copy) v_u_34, (copy) v_u_31
		local v45 = 0
		for _, v46 in v_u_37 do
			if v45 >= v46.Length then
				continue
			end
			v45 = v46.Length
		end
		local v47 = v45 <= 0 and 0 or v45 * 4
		local v48 = v47 <= 0 and 0 or p44 % v47 / v47
		v_u_29.CFrame = v_u_3.eval(v_u_33, v_u_34, v_u_31, v48)
	end
	function v42.play(p49) -- name: play
		-- upvalues: (copy) v_u_28
		if v_u_28 ~= nil then
			v_u_28.AutoRotate = false
		end
		p49()
	end
	local v50 = v41(v42)
	local v51 = 0
	for _, v52 in v_u_37 do
		if v51 >= v52.Length then
			continue
		end
		v51 = v52.Length
	end
	local v53 = (v51 <= 0 and 0 or v51 * 4) > 0
	return {
		["root"] = v24,
		["camera"] = v_u_29,
		["playhead"] = v50,
		["capabilities"] = {
			["canUserToggle"] = v53,
			["hasDuration"] = v53
		},
		["dispose"] = v50.dispose
	}
end