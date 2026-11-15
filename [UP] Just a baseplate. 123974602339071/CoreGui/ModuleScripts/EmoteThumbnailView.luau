-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.EmoteThumbnailView
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = require(v1.Packages.Thumbnailing).EmoteUtility
local v_u_5 = require(v1.Packages.Roact)
local v6 = require(v1.Packages.t)
local v7 = require(script.Parent.EmoteThumbnailParameters)
local v8 = v_u_5.PureComponent:extend("EmoteThumbnailView")
v8.validateProps = v6.strictInterface({
	["animationClip"] = v6.instanceIsA("AnimationClip"),
	["thumbnailParameters"] = v7.validate,
	["position"] = v6.optional(v6.UDim2),
	["anchorPoint"] = v6.optional(v6.Vector2),
	["size"] = v6.optional(v6.UDim2)
})
function v8.updateCameraAndCharacterPose(p_u_9) -- name: updateCameraAndCharacterPose
	-- upvalues: (copy) v_u_4, (copy) v_u_3
	if p_u_9.character ~= nil then
		local v10 = p_u_9.props
		local v_u_11 = p_u_9.character
		local v12 = v10.animationClip
		local v_u_13 = v10.thumbnailParameters
		local v14 = v_u_13.thumbnailTime
		local v15 = v_u_13.thumbnailKeyframe
		local v16 = v_u_13.thumbnailCharacterRotation
		local v17 = nil
		if v12:IsA("CurveAnimation") then
			v17 = v_u_4.GetThumbnailKeyframeFromCurve(v14, v12, v16)
		elseif v12:IsA("KeyframeSequence") then
			v17 = v_u_4.GetThumbnailKeyframe(v15, v12, v16)
		else
			error("Unsupported Animation data:", v12.ClassName)
		end
		v_u_4.SetPlayerCharacterNeutralPose(v_u_11)
		v_u_4.ApplyKeyframe(v_u_11, v17)
		task.spawn(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_11, (ref) v_u_4, (copy) v_u_13, (copy) p_u_9
			v_u_3.PreAnimation:Wait()
			v_u_3.PostSimulation:Wait()
			local v18 = Instance.new("Folder")
			v18.Parent = v_u_11
			v18:Destroy()
			local v19 = v_u_11:GetModelCFrame()
			local v20 = v_u_4.ThumbnailZoomExtents(v_u_11, 20, v_u_13.thumbnailHorizontalOffset, v_u_13.thumbnailVerticalOffset, v_u_13.thumbnailZoom)
			p_u_9.updateCameraCFrameBinding(v20)
			p_u_9.updateCameraFocusBinding(v19)
		end)
	end
end
function v8.addCharacterToViewportIfNeeded(p21) -- name: addCharacterToViewportIfNeeded
	if p21.character == nil or p21.character.Parent == nil then
		if p21.worldModelRef:getValue() and p21.character ~= nil then
			p21.character.Parent = p21.worldModelRef:getValue()
			p21:updateCameraAndCharacterPose()
		end
	end
end
function v8.init(p_u_22) -- name: init
	-- upvalues: (copy) v_u_5, (copy) v_u_2
	p_u_22.cameraRef = v_u_5.createRef()
	p_u_22.worldModelRef = v_u_5.createRef()
	local v23, v24 = v_u_5.createBinding(CFrame.new())
	p_u_22.cameraCFrameBinding = v23
	p_u_22.updateCameraCFrameBinding = v24
	local v25, v26 = v_u_5.createBinding(CFrame.new())
	p_u_22.cameraFocusBinding = v25
	p_u_22.updateCameraFocusBinding = v26
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (copy) p_u_22
		local function v27()
			-- upvalues: (ref) v_u_2
			return v_u_2:GetHumanoidDescriptionFromOutfitIdAsync(1342485078)
		end
		local v28, v29 = pcall(v27)
		if not v28 then
			v29 = Instance.new("HumanoidDescription")
		end
		p_u_22.character = v_u_2:CreateHumanoidModelFromDescriptionAsync(v29, Enum.HumanoidRigType.R15)
		p_u_22:addCharacterToViewportIfNeeded()
	end)
end
function v8.render(p30) -- name: render
	-- upvalues: (copy) v_u_5
	return v_u_5.createElement("Frame", {
		["BackgroundTransparency"] = 0,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["BackgroundColor3"] = nil,
		["Position"] = p30.props.position or UDim2.fromScale(0, 0),
		["AnchorPoint"] = p30.props.anchorPoint or Vector2.new(0, 0),
		["Size"] = p30.props.size or UDim2.fromScale(1, 1),
		["BackgroundColor3"] = Color3.fromRGB(200, 200, 200)
	}, {
		["UICorner"] = v_u_5.createElement("UICorner", {
			["CornerRadius"] = UDim.new(0, 8)
		}),
		["AspectRatioConstraint"] = v_u_5.createElement("UIAspectRatioConstraint", {
			["AspectRatio"] = 1,
			["AspectType"] = nil,
			["DominantAxis"] = nil,
			["AspectType"] = Enum.AspectType.FitWithinMaxSize,
			["DominantAxis"] = Enum.DominantAxis.Width
		}),
		["ViewportFrame"] = v_u_5.createElement("ViewportFrame", {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ImageColor3"] = nil,
			["ImageTransparency"] = 0,
			["BackgroundTransparency"] = 1,
			["CurrentCamera"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["ImageColor3"] = Color3.new(0, 0, 0),
			["CurrentCamera"] = p30.cameraRef
		}, {
			["Camera"] = v_u_5.createElement("Camera", {
				["CameraType"] = Enum.CameraType.Scriptable,
				["FieldOfView"] = 20,
				["CFrame"] = p30.cameraCFrameBinding,
				["Focus"] = p30.cameraFocusBinding,
				[v_u_5.Ref] = p30.cameraRef
			}),
			["WorldModel"] = v_u_5.createElement("WorldModel", {
				[v_u_5.Ref] = p30.worldModelRef
			})
		})
	})
end
function v8.didMount(p31) -- name: didMount
	p31:addCharacterToViewportIfNeeded()
end
function v8.didUpdate(p32, _) -- name: didUpdate
	p32:updateCameraAndCharacterPose()
end
return v8