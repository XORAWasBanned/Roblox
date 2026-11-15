-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.Common.PreviewViewport
local v_u_1 = game:GetService("AnimationClipProvider")
local v2 = game:GetService("CorePackages")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("GuiService")
local v_u_5 = game:GetService("Players")
local v_u_6 = game:GetService("ContextActionService")
local v_u_7 = game:GetService("RunService")
local v_u_8 = require(v2.Packages.Roact)
local v9 = require(v2.Packages.t)
local v10 = require(v2.Packages.UIBlox)
local v_u_11 = require(v2.Packages.Foundation).Skeleton
local v_u_12 = v10.App.Indicator.EmptyState
local v_u_13 = v10.App.Button.Button
local v_u_14 = v10.App.Button.Enum.ButtonType
local v_u_15 = v10.App.Navigation.ShortcutBar
local v_u_16 = v10.Core.Enums.InputType
local v_u_17 = require(v2.Workspace.Packages.InputType).getInputGroup
local v_u_18 = require(v2.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_19 = require(v2.Workspace.Packages.InputType).InputTypeConstants
local v_u_20 = require(v2.Workspace.Packages.InputUi).Gamepad.GamepadUtils
local v_u_21 = require(v2.Workspace.Packages.RobloxTranslator)
local v_u_22 = require(script.Parent.InteractionFrame)
local v_u_23 = require(script.Parent.Parent.Parent.Constants)
local v_u_24 = require(script.Parent.Parent.Parent.MakeupPreviewUtils)
local v_u_25 = v10.App.ImageSet.Images
local v_u_26 = v_u_25["icons/actions/previewShrink"]
local v_u_27 = v_u_25["icons/actions/reset"]
local v28 = v_u_8.PureComponent:extend("PreviewViewport")
v28.validateProps = v9.strictInterface({
	["asset"] = v9.union(v9.instanceOf("Model"), v9.instanceIsA("AnimationClip")),
	["closePreviewView"] = v9.callback,
	["isMakeupPreview"] = v9.optional(v9.boolean)
})
function v28.init(p_u_29) -- name: init
	-- upvalues: (copy) v_u_3, (copy) v_u_17, (copy) v_u_19, (copy) v_u_8
	p_u_29:setState({
		["loadingState"] = "loading",
		["isGamepad"] = nil,
		["cameraMoved"] = false,
		["isGamepad"] = v_u_17((v_u_3:GetLastInputType())) == v_u_19.Gamepad
	})
	p_u_29.ref = v_u_8.createRef()
	p_u_29.zoomFactor = 0.8
	p_u_29.cameraDegreesAngle = Vector2.new(0, 0)
	p_u_29.cameraPanInPixels = Vector2.new(0, 0)
	p_u_29.cameraRef = v_u_8.createRef()
	p_u_29.worldModelRef = v_u_8.createRef()
	local v30, v31 = v_u_8.createBinding(CFrame.new())
	p_u_29.cameraCFrameBinding = v30
	p_u_29.updateCameraCFrameBinding = v31
	local v32, v33 = v_u_8.createBinding(CFrame.new())
	p_u_29.cameraFocusBinding = v32
	p_u_29.updateCameraFocusBinding = v33
	function p_u_29.panByPixels(p34)
		-- upvalues: (copy) p_u_29
		p_u_29.cameraPanInPixels = p_u_29.cameraPanInPixels + p34
		p_u_29:clampOffsets()
		p_u_29:updateCameraPosition()
		if not p_u_29.state.cameraMoved then
			p_u_29:setState({
				["cameraMoved"] = true
			})
		end
	end
	function p_u_29.rotateByPixels(p35)
		-- upvalues: (copy) p_u_29
		p_u_29.cameraDegreesAngle = Vector2.new(p_u_29.cameraDegreesAngle.X - p35.Y, p_u_29.cameraDegreesAngle.Y - p35.X)
		p_u_29:clampOffsets()
		p_u_29:updateCameraPosition()
		if not p_u_29.state.cameraMoved then
			p_u_29:setState({
				["cameraMoved"] = true
			})
		end
	end
	function p_u_29.storeInput(_, p36, p37)
		-- upvalues: (copy) p_u_29
		p_u_29.inputState = p36
		p_u_29.inputObject = p37
		return Enum.ContextActionResult.Sink
	end
	function p_u_29.rotateByRadians(p38)
		-- upvalues: (copy) p_u_29
		if p_u_29.model:FindFirstChild("HumanoidRootPart") then
			local v39 = -p38 * 180 / 3.141592653589793
			p_u_29.cameraDegreesAngle = Vector2.new(p_u_29.cameraDegreesAngle.X % 360, (p_u_29.cameraDegreesAngle.Y + v39) % 360)
			p_u_29:updateCameraPosition()
			if not p_u_29.state.cameraMoved then
				p_u_29:setState({
					["cameraMoved"] = true
				})
			end
		end
	end
	function p_u_29.setAngularVelocityByPixels(_) end
	function p_u_29.zoomToPoint(p40, p41)
		-- upvalues: (copy) p_u_29
		local v42 = 0.9 ^ p40
		local v43 = p_u_29.zoomFactor * v42
		if v43 == math.clamp(v43, 0.3, 10) then
			p_u_29.zoomFactor = v43
			if p41 then
				local v44 = (p41 - (p_u_29.absolutePosition + p_u_29.absoluteSize / 2)) * Vector2.new(1, -1) * -1
				p_u_29.cameraPanInPixels = v44 - (v44 - p_u_29.cameraPanInPixels) * v42
			end
			p_u_29:clampOffsets()
			p_u_29:updateCameraPosition()
			if not p_u_29.state.cameraMoved then
				p_u_29:setState({
					["cameraMoved"] = true
				})
			end
		end
	end
	function p_u_29.onRetryLoading()
		-- upvalues: (copy) p_u_29
		p_u_29:processAsset()
	end
	function p_u_29.onResetButtonPressed()
		-- upvalues: (copy) p_u_29
		p_u_29:resetCameraPosition()
	end
end
function v28.setLoadingState(p45, p46) -- name: setLoadingState
	p45:setState({
		["loadingState"] = p46
	})
end
function v28.clampOffsets(p47) -- name: clampOffsets
	local v48 = p47.zoomFactor
	p47.zoomFactor = math.clamp(v48, 0.3, 10)
	local v49 = not (p47.props.asset and p47.props.asset:IsA("AnimationClip")) and -80 or p47:angleToMakeBasePlateParallel()
	local v50 = Vector2.new
	local v51 = p47.cameraDegreesAngle.X
	p47.cameraDegreesAngle = v50(math.clamp(v51, v49, 80), p47.cameraDegreesAngle.Y)
	local v52 = p47.zoomFactor * p47.modelExtentsSize.X / 2 / p47:pointsToPixelsFactor()
	local v53 = p47.absoluteSize.X / 2
	local v54 = math.max(v52, v53)
	local v55 = p47.zoomFactor * p47.modelExtentsSize.Y / 2 / p47:pointsToPixelsFactor()
	local v56 = p47.absoluteSize.Y / 2
	local v57 = math.max(v55, v56)
	local v58 = Vector2.new
	local v59 = p47.cameraPanInPixels.X
	local v60 = -v54
	local v61 = math.clamp(v59, v60, v54)
	local v62 = p47.cameraPanInPixels.Y
	local v63 = -v57
	p47.cameraPanInPixels = v58(v61, (math.clamp(v62, v63, v57)))
end
function v28.angleToMakeBasePlateParallel(p64) -- name: angleToMakeBasePlateParallel
	local v65 = p64.cameraDistance / p64.zoomFactor
	local v66 = p64:pointsToPixelsFactor() / p64.zoomFactor * p64.cameraPanInPixels.Y
	local v67 = (p64.modelExtentsSize.Y / 2 + v66) / v65
	local v68 = math.clamp(v67, -0.99, 0.99)
	local v69 = math.asin(v68)
	return -math.deg(v69)
end
function v28.processAsset(p_u_70) -- name: processAsset
	-- upvalues: (copy) v_u_5, (copy) v_u_1
	local v_u_71 = p_u_70.props.asset
	if v_u_71 then
		if v_u_71:IsA("AnimationClip") then
			p_u_70:setLoadingState("loading")
			task.spawn(function()
				-- upvalues: (ref) v_u_5, (copy) p_u_70, (copy) v_u_71, (ref) v_u_1
				local function v72()
					-- upvalues: (ref) v_u_5
					return v_u_5:GetHumanoidDescriptionFromOutfitIdAsync(1342485078)
				end
				local v73, v74 = pcall(v72)
				local v75
				if v73 then
					v75 = v_u_5:CreateHumanoidModelFromDescriptionAsync(v74, Enum.HumanoidRigType.R15)
				else
					v75 = nil
				end
				if p_u_70.isMounted and v_u_71 == p_u_70.props.asset then
					if v75 then
						p_u_70.model = v75
						p_u_70:addModelToViewportIfNeeded()
						local v76 = v_u_1:RegisterActiveAnimationClip(v_u_71)
						p_u_70.animation = Instance.new("Animation")
						p_u_70.animation.AnimationId = v76
						local v77 = p_u_70.model:FindFirstChildWhichIsA("Humanoid")
						if v77 then
							v77:LoadAnimation(p_u_70.animation):Play()
						end
						p_u_70:setLoadingState("successfullyLoaded")
					else
						p_u_70:setLoadingState("failedToLoad")
					end
				else
					return
				end
			end)
		elseif v_u_71:IsA("Model") or v_u_71:IsA("Accessory") then
			if v_u_71:IsA("Accessory") then
				local v78 = Instance.new("Model")
				v_u_71:Clone().Parent = v78
				p_u_70.model = v78
			else
				p_u_70.model = v_u_71:Clone()
			end
			p_u_70.model.Parent = nil
			p_u_70:addModelToViewportIfNeeded()
			p_u_70:setLoadingState("successfullyLoaded")
		end
	else
		return
	end
end
function v28.addModelToViewportIfNeeded(p79) -- name: addModelToViewportIfNeeded
	if p79.model == nil or p79.model.Parent == nil then
		if p79.worldModelRef:getValue() and p79.model ~= nil then
			p79.model.Parent = p79.worldModelRef:getValue()
			p79:resetCameraPosition()
			if p79.props.asset and p79.props.asset:IsA("AnimationClip") then
				p79.baseplate = Instance.new("Part")
				p79.baseplate.Size = Vector3.new(8, 0.5, 8)
				p79.baseplate.Transparency = 0.6
				p79.baseplate.Parent = p79.worldModelRef:getValue()
				local v80 = p79.modelCFrame.Position
				local v81 = -p79.modelExtentsSize.Y / 2
				local v82 = v80 + Vector3.new(0, v81, 0)
				p79.baseplate.Position = v82 + Vector3.new(0, -0.25, 0)
			end
		end
	end
end
function v28.resetCameraPosition(p83) -- name: resetCameraPosition
	-- upvalues: (copy) v_u_24
	if p83.model then
		local v84, v85
		if p83.props.isMakeupPreview then
			v84, v85 = v_u_24.getHeadPreviewCameraData(p83.model)
		else
			v84 = nil
			v85 = nil
		end
		p83.modelCFrame = v84 or p83.model:GetModelCFrame()
		p83.initialLookVector = p83.modelCFrame.lookVector
		local v86 = p83.model:FindFirstChild("HumanoidRootPart")
		if v86 then
			p83.initialLookVector = v86.CFrame.lookVector
		end
		p83.modelExtentsSize = v85 or p83.model:GetExtentsSize()
		local v87 = p83.modelExtentsSize
		local v88 = v87.X
		local v89 = v87.Y
		local v90 = v87.Z
		p83.cameraDistance = math.max(v88, v89) / 2 * 3.7320508075688776 + v90 / 2
		if p83.props.asset and p83.props.asset:IsA("AnimationClip") then
			p83.cameraDegreesAngle = Vector2.new(0, 0)
			p83.zoomFactor = 0.75
		else
			p83.cameraDegreesAngle = Vector2.new(5, 20)
			p83.zoomFactor = 0.8
		end
		p83.cameraPanInPixels = Vector2.new(0, 0)
		p83:updateCameraPosition()
		if p83.state.cameraMoved then
			p83:setState({
				["cameraMoved"] = false
			})
		end
	end
end
function v28.pointsToPixelsFactor(p91) -- name: pointsToPixelsFactor
	if p91.absoluteSize == nil or (p91.modelExtentsSize == nil or (p91.absoluteSize.Y == 0 or (p91.modelExtentsSize.Y == 0 or p91.modelExtentsSize.X == 0))) then
		return 1
	end
	local v92 = p91.modelExtentsSize.X
	local v93 = p91.modelExtentsSize.Y
	return math.max(v92, v93) / p91.absoluteSize.Y
end
function v28.updateCameraPosition(p94) -- name: updateCameraPosition
	if p94.absoluteSize ~= nil and p94.cameraDistance ~= nil then
		local v95 = p94.cameraDistance / p94.zoomFactor
		local v96 = p94.initialLookVector
		local v97 = p94.cameraDegreesAngle.X
		local v98 = math.rad(v97)
		local v99 = p94.cameraDegreesAngle.Y
		local v100 = math.rad(v99)
		local v101 = CFrame.fromAxisAngle(Vector3.new(1, 0, 0), v98):VectorToWorldSpace(v96)
		local v102 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), v100):VectorToWorldSpace(v101)
		local v103 = CFrame.new(p94.modelCFrame.p + v102 * v95, p94.modelCFrame.p)
		local v104 = p94:pointsToPixelsFactor() / p94.zoomFactor
		local v105 = v103 + v103.UpVector * v104 * p94.cameraPanInPixels.Y + v103.RightVector * v104 * p94.cameraPanInPixels.X
		p94.updateCameraCFrameBinding(v105)
		p94.updateCameraFocusBinding(p94.modelCFrame)
	end
end
local v_u_106 = {
	["resetViewButtonText"] = v_u_21:FormatByKey("CoreScripts.AssetPreviewView.Action.ResetView"),
	["loadingFailedText"] = v_u_21:FormatByKey("CoreScripts.AssetPreviewView.Label.LoadingFailed")
}
function v28.render(p_u_107) -- name: render
	-- upvalues: (copy) v_u_16, (copy) v_u_25, (copy) v_u_21, (copy) v_u_8, (copy) v_u_4, (copy) v_u_18, (copy) v_u_3, (copy) v_u_17, (copy) v_u_19, (copy) v_u_13, (copy) v_u_14, (copy) v_u_27, (copy) v_u_26, (copy) v_u_15, (copy) v_u_11, (copy) v_u_12, (copy) v_u_106, (copy) v_u_22, (copy) v_u_23
	local v108 = p_u_107.state.loadingState
	local v109 = {
		{
			["icon"] = {
				[v_u_16.MouseAndKeyboard] = v_u_25["icons/controls/mouse/scroll"],
				[v_u_16.Gamepad] = v_u_25["icons/controls/keys/xboxRSVertical"]
			},
			["text"] = v_u_21:FormatByKey("CoreScripts.PublishAvatarPrompt.Zoom")
		},
		{
			["icon"] = {
				[v_u_16.MouseAndKeyboard] = v_u_25["icons/controls/mouse/clickLeft"],
				[v_u_16.Gamepad] = v_u_25["icons/controls/keys/xboxRSHorizontal"]
			},
			["text"] = v_u_21:FormatByKey("CoreScripts.PublishAvatarPrompt.Rotate")
		},
		{
			["icon"] = {
				[v_u_16.MouseAndKeyboard] = v_u_25["icons/controls/mouse/clickRight"]
			},
			["text"] = v_u_21:FormatByKey("CoreScripts.PublishAvatarPrompt.Pan")
		},
		{
			["icon"] = {
				[v_u_16.Gamepad] = v_u_25["icons/controls/keys/xboxY"]
			},
			["text"] = v_u_21:FormatByKey("CoreScripts.PublishAvatarPrompt.ResetView")
		},
		{
			["icon"] = {
				[v_u_16.Gamepad] = v_u_25["icons/controls/keys/xboxB"]
			},
			["text"] = v_u_21:FormatByKey("CoreScripts.PublishAvatarPrompt.Close")
		}
	}
	local v110 = p_u_107.state.cameraMoved
	if v110 then
		v110 = not p_u_107.state.isGamepad
	end
	local v111 = v_u_8.createElement
	local v112 = "Frame"
	local v116 = {
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		[v_u_8.Ref] = p_u_107.ref,
		[v_u_8.Change.AbsoluteSize] = function(p113)
			-- upvalues: (copy) p_u_107
			p_u_107.absoluteSize = p113.AbsoluteSize
			p_u_107:updateCameraPosition()
		end,
		[v_u_8.Change.AbsolutePosition] = function(p114)
			-- upvalues: (ref) v_u_4, (copy) p_u_107
			local v115 = v_u_4:GetGuiInset()
			p_u_107.absolutePosition = p114.absolutePosition + v115
		end
	}
	local v118 = {
		["LastInputTypeConnection"] = v_u_8.createElement(v_u_18, {
			["event"] = v_u_3.LastInputTypeChanged,
			["callback"] = function(p117) -- name: callback
				-- upvalues: (copy) p_u_107, (ref) v_u_17, (ref) v_u_19
				p_u_107:setState({
					["isGamepad"] = v_u_17(p117) == v_u_19.Gamepad
				})
			end
		}) or nil
	}
	local v119 = v_u_8.createElement
	local v120 = "Frame"
	local v121 = {
		["Size"] = nil,
		["Position"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.fromScale(0, 0)
	}
	local v122 = {
		["UIPadding"] = v_u_8.createElement("UIPadding", {
			["PaddingBottom"] = UDim.new(0, 24),
			["PaddingLeft"] = UDim.new(0, 24),
			["PaddingRight"] = UDim.new(0, 24)
		})
	}
	local v123
	if v110 then
		v123 = v_u_8.createElement(v_u_13, {
			["buttonType"] = v_u_14.Secondary,
			["size"] = UDim2.fromOffset(36, 36),
			["position"] = UDim2.fromScale(0, 1),
			["anchorPoint"] = Vector2.new(0, 1),
			["icon"] = v_u_27,
			["onActivated"] = p_u_107.onResetButtonPressed
		})
	else
		v123 = nil
	end
	v122.ResetViewButton = v123
	v122.ShrinkPreviewButton = v_u_8.createElement(v_u_13, {
		["buttonType"] = v_u_14.PrimarySystem,
		["size"] = UDim2.fromOffset(36, 36),
		["icon"] = v_u_26,
		["position"] = UDim2.fromScale(1, 1),
		["anchorPoint"] = Vector2.new(1, 1),
		["onActivated"] = p_u_107.props.closePreviewView
	})
	v118.ButtonFrame = v119(v120, v121, v122)
	local v124
	if p_u_107.props.asset:IsA("Model") then
		v124 = v_u_8.createElement(v_u_15, {
			["position"] = nil,
			["anchorPoint"] = nil,
			["transitionDelaySeconds"] = 2,
			["items"] = nil,
			["position"] = UDim2.fromScale(0.5, 0.9),
			["anchorPoint"] = Vector2.new(0.5, 1),
			["items"] = v109
		})
	else
		v124 = nil
	end
	v118.TooltipHint = v124
	local v125
	if v108 == "loading" then
		v125 = v_u_8.createElement(v_u_11, {
			["Size"] = UDim2.fromScale(1, 1),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5)
		})
	else
		v125 = false
	end
	v118.ShimmerFrame = v125
	local v126
	if v108 == "failedToLoad" then
		v126 = v_u_8.createElement(v_u_12, {
			["text"] = v_u_106.loadingFailedText,
			["size"] = UDim2.fromScale(1, 1),
			["onActivated"] = p_u_107.onRetryLoading
		})
	else
		v126 = false
	end
	v118.LoadingFailed = v126
	v118.InteractionFrame = v_u_8.createElement(v_u_22, {
		["ZIndex"] = -1,
		["Size"] = nil,
		["Visible"] = nil,
		["panByPixels"] = nil,
		["rotateByPixels"] = nil,
		["setAngularVelocityByPixels"] = nil,
		["zoomToPoint"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["Visible"] = v108 == "successfullyLoaded",
		["panByPixels"] = p_u_107.panByPixels,
		["rotateByPixels"] = p_u_107.rotateByPixels,
		["setAngularVelocityByPixels"] = p_u_107.setAngularVelocityByPixels,
		["zoomToPoint"] = p_u_107.zoomToPoint
	}, {
		["ViewportFrame"] = v_u_8.createElement("ViewportFrame", {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["LightColor"] = nil,
			["Ambient"] = nil,
			["LightDirection"] = nil,
			["CurrentCamera"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["LightColor"] = v_u_23.ViewportLightColor,
			["Ambient"] = v_u_23.ViewportLightAmbient,
			["LightDirection"] = v_u_23.ViewportLightDirection,
			["CurrentCamera"] = p_u_107.cameraRef
		}, {
			["Camera"] = v_u_8.createElement("Camera", {
				["CameraType"] = Enum.CameraType.Scriptable,
				["FieldOfView"] = 30,
				["HeadLocked"] = true,
				["VRTiltAndRollEnabled"] = true,
				["CFrame"] = p_u_107.cameraCFrameBinding,
				["Focus"] = p_u_107.cameraFocusBinding,
				[v_u_8.Ref] = p_u_107.cameraRef
			}),
			["WorldModel"] = v_u_8.createElement("WorldModel", {
				[v_u_8.Ref] = p_u_107.worldModelRef
			})
		})
	})
	return v111(v112, v116, v118)
end
function v28.setUpGamepad(p_u_127) -- name: setUpGamepad
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_20
	v_u_6:UnbindCoreAction("PreviewViewportClose")
	v_u_6:UnbindCoreAction("PreviewViewportReset")
	v_u_6:UnbindCoreAction("PreviewViewportRotateAndZoom")
	v_u_6:BindCoreAction("PreviewViewportClose", p_u_127.props.closePreviewView, false, Enum.KeyCode.ButtonB)
	v_u_6:BindCoreAction("PreviewViewportReset", function()
		-- upvalues: (copy) p_u_127
		p_u_127:resetCameraPosition()
	end, false, Enum.KeyCode.ButtonY)
	v_u_6:BindCoreAction("PreviewViewportRotateAndZoom", p_u_127.storeInput, false, Enum.KeyCode.Thumbstick2)
	p_u_127.gamePadConnection = v_u_7.RenderStepped:Connect(function(p128)
		-- upvalues: (copy) p_u_127, (ref) v_u_20
		if p_u_127.inputState == Enum.UserInputState.Change and p_u_127.inputObject then
			v_u_20.rotateAndZoom(p_u_127.inputObject, p128, p_u_127.setAngularVelocityByPixels, p_u_127.rotateByRadians, p_u_127.zoomToPoint)
		end
	end)
end
function v28.didMount(p129) -- name: didMount
	-- upvalues: (copy) v_u_4
	local v130 = v_u_4:GetGuiInset()
	p129.isMounted = true
	p129.absolutePosition = p129.ref.current.AbsolutePosition + v130
	p129:processAsset()
	p129:setUpGamepad()
end
function v28.cleanupGamepad(p131) -- name: cleanupGamepad
	-- upvalues: (copy) v_u_6
	v_u_6:UnbindCoreAction("PreviewViewportClose")
	v_u_6:UnbindCoreAction("PreviewViewportReset")
	v_u_6:UnbindCoreAction("PreviewViewportRotateAndZoom")
	if p131.gamePadConnection then
		p131.gamePadConnection:Disconnect()
	end
end
function v28.willUnmount(p132) -- name: willUnmount
	p132.isMounted = false
	p132:cleanupGamepad()
end
function v28.didUpdate(p133, p134) -- name: didUpdate
	if p133.props.asset ~= p134.asset then
		if p133.model ~= nil then
			p133.model.Parent = nil
			p133.model = nil
		end
		if p133.baseplate ~= nil then
			p133.baseplate.Parent = nil
			p133.baseplate:Destroy()
		end
		p133:processAsset()
	end
end
return v28