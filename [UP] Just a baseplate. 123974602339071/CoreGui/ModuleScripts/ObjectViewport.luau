-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.Common.ObjectViewport
local v1 = game:GetService("CorePackages")
local v_u_2 = game:GetService("RunService")
local v_u_3 = require(v1.Packages.Roact)
local v_u_4 = require(v1.Workspace.Packages.RobloxTranslator)
local v5 = require(v1.Packages.UIBlox)
local v6 = require(v1.Packages.Foundation)
local v_u_7 = v6.Progress
local v_u_8 = v6.Skeleton
local v_u_9 = v6.Text
local v_u_10 = v6.View
local v_u_11 = v6.Enums.ProgressShape
local v_u_12 = v6.Enums.ProgressSize
local v_u_13 = v5.Style.withStyle
local v_u_14 = v5.Core.ImageSet.ImageSetLabel
local v15 = require(v1.Packages.t)
local v16 = v5.App.ImageSet.Images
local v_u_17 = require(script.Parent.Parent.Parent.Constants)
local v_u_18 = require(script.Parent.Parent.Parent.MakeupPreviewUtils)
local v_u_19 = require(script.Parent.Parent.Parent.Flags.FFlagIECPublishValidationLoadingUI)
local v_u_20 = require(v1.Packages.Thumbnailing).CharacterUtility
local v_u_21 = require(v1.Packages.Thumbnailing).CameraUtility
local v_u_22 = require(v1.Packages.Thumbnailing).CFrameUtility
local v_u_23 = require(v1.Packages.Thumbnailing).EmoteUtility
local v_u_24 = v5.App.Button.IconButton
local v_u_25 = v5.App.ImageSet.Enum.IconSize
local v_u_26 = v16["icons/actions/previewExpand"]
local v_u_27 = v16["component_assets/dropshadow_25"]
local v_u_28 = UDim2.new(0.4, 50, 0.15, 10)
local v_u_29 = UDim2.new(0.5, 0, 1, 0)
local v30 = v_u_3.PureComponent:extend("ObjectViewport")
v30.validateProps = v15.strictInterface({
	["model"] = v15.optional(v15.instanceOf("Model")),
	["fieldOfView"] = v15.optional(v15.number),
	["isLoading"] = v15.optional(v15.boolean),
	["useFullBodyCameraSettings"] = v15.optional(v15.boolean),
	["openPreviewView"] = v15.optional(v15.callback),
	["LayoutOrder"] = v15.optional(v15.number),
	["isHumanoidModel"] = v15.optional(v15.boolean),
	["isMakeupPreview"] = v15.optional(v15.boolean)
})
function v30.createCamera(p31) -- name: createCamera
	local v32 = Instance.new("Camera")
	v32.CameraType = Enum.CameraType.Scriptable
	v32.Parent = p31.worldModelRef:getValue()
	v32.HeadLocked = true
	v32.VRTiltAndRollEnabled = true
	return v32
end
function v30.init(p33) -- name: init
	-- upvalues: (copy) v_u_3
	p33.worldModelRef = v_u_3.createRef()
	local v34, v35 = v_u_3.createBinding(nil)
	p33.camera = v34
	p33.updateCamera = v35
	p33.isMounted = false
end
function v30.setupViewportForAsset(p36) -- name: setupViewportForAsset
	-- upvalues: (copy) v_u_18
	if p36.props.model then
		local v37 = p36.props.model:Clone()
		v37.Parent = p36.worldModelRef:getValue()
		local v38, v39
		if v37:IsA("Model") then
			v37:MoveTo(Vector3.new(0, 0, 0))
			local v40, v41
			if p36.props.isMakeupPreview then
				v40, v41 = v_u_18.getHeadPreviewCameraData(v37)
			else
				v40 = nil
				v41 = nil
			end
			v38 = v40 or v37:GetModelCFrame()
			v39 = v41 or v37:GetExtentsSize()
		else
			local v42 = v37:FindFirstChildWhichIsA("MeshPart", true)
			if not v42 then
				return
			end
			v42.CFrame = CFrame.new(0, 0, 0)
			v38 = v42.CFrame
			v39 = v42.Size
		end
		local v43 = v38.lookVector
		local v44 = p36:createCamera()
		local v45 = not p36.props.fieldOfView and 30 or p36.props.fieldOfView
		local v46 = v39.X
		local v47 = v39.Y
		local v48 = v39.Z
		local v49 = math.max(v46, v47, v48)
		local v50 = math.rad(v45) / 2
		local v51 = 1 / math.tan(v50)
		local v52 = v49 / 2 * v51 + v48 / 2
		local v53 = Vector2.new(5, 20)
		local v54 = v53.X
		local v55 = math.rad(v54)
		local v56 = v53.Y
		local v57 = math.rad(v56)
		local v58 = CFrame.fromAxisAngle(Vector3.new(1, 0, 0), v55):VectorToWorldSpace(v43)
		local v59 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), v57):VectorToWorldSpace(v58)
		local v60 = v38.Position + v59 * v52
		v44.CFrame = CFrame.new(v60, v38.Position)
		v44.FieldOfView = v45
		p36.updateCamera(v44)
	end
end
function v30.setupViewport(p61) -- name: setupViewport
	-- upvalues: (copy) v_u_23, (copy) v_u_2, (copy) v_u_22, (copy) v_u_20, (copy) v_u_21
	local v62 = p61.props.model:Clone()
	local v63 = v62.PrimaryPart
	assert(v63, "The Model should have a PrimaryPart for setting up Camera")
	v62.Parent = p61.worldModelRef:getValue()
	v62:MoveTo(Vector3.new(0, 0, 0))
	local v64 = p61.props.useFullBodyCameraSettings
	if v64 then
		v_u_23.SetPlayerCharacterPoseWithMoodFallback(v62)
		v_u_2.PostSimulation:Wait()
		if not p61.isMounted then
			return
		end
	end
	local v65 = p61:createCamera()
	local v66
	if v64 then
		local v67 = v_u_22.CalculateTargetCFrame(v62.Head.CFrame)
		v66 = v67 - v67.Position + v62.PrimaryPart.CFrame.Position
	else
		v66 = v62.PrimaryPart.CFrame
	end
	local v68, v69 = v_u_20.CalculateModelExtents(v62, v66)
	local v70 = {
		["optFieldOfView"] = nil,
		["targetCFrame"] = nil,
		["minExtent"] = nil,
		["maxExtent"] = nil,
		["extentScale"] = 1,
		["optFieldOfView"] = not p61.props.fieldOfView and 30 or p61.props.fieldOfView,
		["targetCFrame"] = v66,
		["minExtent"] = v68,
		["maxExtent"] = v69
	}
	if v64 then
		v70.optCameraXRot = v_u_21.XRotForFullBody
		v70.optCameraDistanceScale = v_u_21.DistanceScaleForFullBody
		v70.extentScale = v_u_21.DefaultBodyMarginScale
	else
		v70.optCameraYRot = 25
	end
	v_u_21.SetupCamera(v65, v70)
	p61.updateCamera(v65)
end
function v30.didMount(p_u_71) -- name: didMount
	p_u_71.isMounted = true
	task.spawn(function()
		-- upvalues: (copy) p_u_71
		if not p_u_71.props.isLoading then
			if p_u_71.props.isHumanoidModel then
				p_u_71:setupViewport()
				return
			end
			p_u_71:setupViewportForAsset()
		end
	end)
end
function v30.didUpdate(p_u_72, p73) -- name: didUpdate
	local v74 = p73.isLoading
	if v74 then
		v74 = not p_u_72.props.isLoading
	end
	if v74 then
		task.spawn(function()
			-- upvalues: (copy) p_u_72
			if p_u_72.props.isHumanoidModel then
				p_u_72:setupViewport()
			else
				p_u_72:setupViewportForAsset()
			end
		end)
	end
end
function v30.render(p_u_75) -- name: render
	-- upvalues: (copy) v_u_13, (copy) v_u_3, (copy) v_u_17, (copy) v_u_24, (copy) v_u_26, (copy) v_u_25, (copy) v_u_14, (copy) v_u_29, (copy) v_u_27, (copy) v_u_28, (copy) v_u_19, (copy) v_u_10, (copy) v_u_7, (copy) v_u_11, (copy) v_u_12, (copy) v_u_9, (copy) v_u_4, (copy) v_u_8
	return v_u_13(function(p76)
		-- upvalues: (copy) p_u_75, (ref) v_u_3, (ref) v_u_17, (ref) v_u_24, (ref) v_u_26, (ref) v_u_25, (ref) v_u_14, (ref) v_u_29, (ref) v_u_27, (ref) v_u_28, (ref) v_u_19, (ref) v_u_10, (ref) v_u_7, (ref) v_u_11, (ref) v_u_12, (ref) v_u_9, (ref) v_u_4, (ref) v_u_8
		local v77 = p76.Theme
		if not p_u_75.props.isLoading then
			local v78 = v_u_3.createElement
			local v79 = "Frame"
			local v80 = {
				["BackgroundColor3"] = nil,
				["BackgroundTransparency"] = 0,
				["Size"] = nil,
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["LayoutOrder"] = nil,
				["BackgroundColor3"] = Color3.fromRGB(0, 0, 0),
				["Size"] = UDim2.new(1, v_u_17.PromptSidePadding * 2, 0, 240),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["LayoutOrder"] = p_u_75.props.LayoutOrder
			}
			local v81 = {
				["ViewportFrame"] = v_u_3.createElement("ViewportFrame", {
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
					["LightColor"] = v_u_17.ViewportLightColor,
					["Ambient"] = v_u_17.ViewportLightAmbient,
					["LightDirection"] = v_u_17.ViewportLightDirection,
					["CurrentCamera"] = p_u_75.camera
				}, {
					["WorldModel"] = v_u_3.createElement("WorldModel", {
						[v_u_3.Ref] = p_u_75.worldModelRef
					})
				})
			}
			local v82 = p_u_75.props.openPreviewView
			if v82 then
				v82 = v_u_3.createElement(v_u_24, {
					["position"] = UDim2.new(1, -v_u_17.PromptSidePadding, 1, 0),
					["anchorPoint"] = Vector2.new(1, 1),
					["icon"] = v_u_26,
					["iconSize"] = v_u_25.Medium,
					["onActivated"] = p_u_75.props.openPreviewView
				})
			end
			v81.ExpandPreviewButton = v82
			v81.Gradient = v_u_3.createElement("UIGradient", {
				["Rotation"] = 90,
				["Color"] = nil,
				["Transparency"] = nil,
				["Color"] = ColorSequence.new({ ColorSequenceKeypoint.new(0, v77.BackgroundMuted.Color), ColorSequenceKeypoint.new(1, v77.BackgroundMuted.Color) }),
				["Transparency"] = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.7, 0.75), NumberSequenceKeypoint.new(1, 1) })
			})
			v81.DropShadow = v_u_3.createElement(v_u_14, {
				["Position"] = nil,
				["AnchorPoint"] = nil,
				["Image"] = nil,
				["BackgroundTransparency"] = 1,
				["ImageTransparency"] = 0.5,
				["Size"] = nil,
				["ZIndex"] = 0,
				["Position"] = v_u_29,
				["AnchorPoint"] = Vector2.new(0.5, 1),
				["Image"] = v_u_27,
				["Size"] = v_u_28
			})
			return v78(v79, v80, v81)
		end
		if not v_u_19 then
			return v_u_3.createElement(v_u_8, {
				["Size"] = UDim2.new(1, v_u_17.PromptSidePadding * 2, 0, 240),
				["Position"] = UDim2.fromScale(0.5, 0.5),
				["AnchorPoint"] = Vector2.new(0.5, 0.5),
				["LayoutOrder"] = p_u_75.props.LayoutOrder
			})
		end
		local v83 = v_u_3.createElement
		local v84 = {
			["BackgroundTransparency"] = 1,
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["Size"] = UDim2.new(1, 0, 0, 240),
			["LayoutOrder"] = p_u_75.props.LayoutOrder
		}
		local v85 = {}
		local v86 = v_u_3.createElement
		local v87 = v_u_10
		local v88 = {
			["ProgressCircle"] = v_u_3.createElement(v_u_7, {
				["shape"] = v_u_11.Circle,
				["size"] = v_u_12.Large
			})
		}
		local v89 = v_u_3.createElement
		local v90 = v_u_10
		local v91 = {}
		local v92 = v_u_3.createElement
		local v93 = v_u_9
		local v94 = {
			["Text"] = nil,
			["tag"] = "shrink size-0-full auto-x padding-x-medium text-label-medium text-truncate-end content-action-utility"
		}
		local v95 = v_u_4.FormatByKey
		local v96 = v_u_4
		local v97, v98 = pcall(v95, v96, "CoreScripts.PublishCommon.ReviewingCreation")
		v94.Text = not v97 and "Reviewing your creation..." or v98
		v91.Text = v92(v93, v94)
		v88.Status = v89(v90, {
			["tag"] = "row align-x-center align-y-center size-0-800 auto-x radius-circle clip bg-action-utility",
			["testId"] = "reviewing-creation-status"
		}, v91)
		v85.Content = v86(v87, {
			["tag"] = "col align-x-center align-y-center gap-medium size-full"
		}, v88)
		return v83("CanvasGroup", v84, v85)
	end)
end
function v30.willUnmount(p99) -- name: willUnmount
	p99.isMounted = false
end
return v30