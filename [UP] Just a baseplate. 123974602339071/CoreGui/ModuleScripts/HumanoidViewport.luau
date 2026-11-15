-- Path: CoreGui.RobloxGui.Modules.AvatarEditorPrompts.Components.HumanoidViewport
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("CoreGui")
local v_u_3 = game:GetService("Players")
local v_u_4 = require(v1.Packages.Roact)
local v5 = require(v1.Packages.t)
local v6 = require(v1.Packages.UIBlox)
local v_u_7 = require(v1.Packages.Foundation).Skeleton
local v_u_8 = require(v1.Packages.Promise)
local v_u_9 = v6.App.Indicator.EmptyState
v2:WaitForChild("RobloxGui")
local v_u_10 = require(v1.Workspace.Packages.RobloxTranslator)
local v_u_11 = CFrame.fromEulerAnglesXYZ(0.3490658503988659, 0.2617993877991494, 0.6981317007977318)
local v_u_12 = game:DefineFastInt("AXClusterCompositionTimeoutMs", 3000)
local v13 = v_u_4.PureComponent:extend("HumanoidViewport")
v13.validateProps = v5.strictInterface({
	["humanoidDescription"] = v5.optional(v5.instanceOf("HumanoidDescription")),
	["loadingFailed"] = v5.boolean,
	["retryLoadDescription"] = v5.callback,
	["rigType"] = v5.optional(v5.enum(Enum.HumanoidRigType))
})
function v13.init(p_u_14) -- name: init
	-- upvalues: (copy) v_u_4
	p_u_14:setState({
		["loading"] = true,
		["loadingFailed"] = false
	})
	p_u_14.cameraRef = v_u_4.createRef()
	p_u_14.worldModelRef = v_u_4.createRef()
	local v15, v16 = v_u_4.createBinding(CFrame.new())
	p_u_14.cameraCFrameBinding = v15
	p_u_14.updateCameraCFrameBinding = v16
	local v17, v18 = v_u_4.createBinding(CFrame.new())
	p_u_14.cameraFocusBinding = v17
	p_u_14.updateCameraFocusBinding = v18
	p_u_14.humanoidModel = nil
	p_u_14.mounted = false
	function p_u_14.onRetryLoading()
		-- upvalues: (copy) p_u_14
		p_u_14:setState({
			["loading"] = true,
			["loadingFailed"] = false
		})
		if p_u_14.props.humanoidDescription then
			p_u_14:loadHumanoidModel()
		else
			p_u_14.props.retryLoadDescription()
		end
	end
end
function v13.positionCamera(p19) -- name: positionCamera
	-- upvalues: (copy) v_u_11
	local v20 = p19.humanoidModel
	local v21 = v20:GetModelCFrame()
	local v22 = v21.lookVector
	local v23 = v20:FindFirstChild("HumanoidRootPart")
	if v23 then
		v22 = v23.CFrame.lookVector
	end
	local v24 = v22.Y
	local v25
	if math.abs(v24) > 0.95 then
		v25 = Vector3.new(0, 0, -1)
	else
		local v26 = v22.X
		local v27 = v22.Z
		v25 = Vector3.new(v26, 0, v27).unit
	end
	local v28 = (CFrame.new(Vector3.new(0, 0, 0), v25) * v_u_11).lookVector
	local v29 = CFrame.new(v21.p + v28 * 5, v21.p)
	local v30 = v20:GetModelCFrame().p
	local v31 = v20:GetExtentsSize()
	local v32 = v31.X
	local v33 = v31.Y
	local v34 = v31.Z
	local v35 = (math.max(v32, v33) / 2 * 1.4281480067421146 + v34 / 2) * 1
	local v36 = v29 - v29.p + v30 + v28 * v35
	p19.updateCameraCFrameBinding(v36)
	p19.updateCameraFocusBinding(v21)
end
function v13.loadIdleAnimation(_, p37) -- name: loadIdleAnimation
	local v38 = p37:FindFirstChildOfClass("Humanoid")
	if v38.HumanoidDescription.IdleAnimation == 0 then
		return
	else
		local v39 = p37:FindFirstChild("Animate")
		if v39 then
			local v40 = v39:FindFirstChild("idle")
			if v40 then
				local v41 = v40:FindFirstChildOfClass("Animation")
				if v41 then
					local v42 = v38:LoadAnimation(v41)
					v42.Looped = true
					v42:Play()
				end
			else
				return
			end
		else
			return
		end
	end
end
function v13.loadHumanoidModel(p_u_43) -- name: loadHumanoidModel
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_12
	local v_u_44 = p_u_43.props.humanoidDescription
	local v_u_45 = p_u_43.props.rigType
	coroutine.wrap(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_44, (copy) v_u_45, (copy) p_u_43, (ref) v_u_8, (ref) v_u_12
		local v_u_46 = nil
		local function v47()
			-- upvalues: (ref) v_u_46, (ref) v_u_3, (ref) v_u_44, (ref) v_u_45
			v_u_46 = v_u_3:CreateHumanoidModelFromDescriptionAsync(v_u_44, v_u_45)
		end
		pcall(v47)
		if p_u_43.mounted then
			if p_u_43.props.humanoidDescription == v_u_44 then
				if p_u_43.props.rigType == v_u_45 then
					if v_u_46 == nil then
						p_u_43:setState({
							["loadingFailed"] = true
						})
						return
					else
						p_u_43.humanoidModel = v_u_46
						if p_u_43.worldModelRef:getValue() then
							p_u_43.humanoidModel.Parent = p_u_43.worldModelRef:getValue()
						end
						if #v_u_44:GetAccessories(false) > 0 then
							v_u_8.race({ v_u_8.fromEvent(v_u_46.Humanoid.ClusterCompositionFinished), v_u_8.delay(v_u_12 * 0.001) }):await()
						end
						if p_u_43.mounted then
							p_u_43:positionCamera()
							p_u_43:loadIdleAnimation(v_u_46)
							p_u_43:setState({
								["loading"] = false,
								["loadingFailed"] = false
							})
						end
					end
				else
					return
				end
			else
				return
			end
		else
			return
		end
	end)()
end
function v13.render(p48) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_9, (copy) v_u_10
	local v49 = p48.props.loadingFailed or p48.state.loadingFailed
	local v50 = not v49
	if v50 then
		v50 = p48.state.loading
	end
	local v51 = not (v49 or p48.state.loading)
	local v52 = v_u_4.createElement
	local v53 = "Frame"
	local v54 = {
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5)
	}
	local v55 = {
		["AspectRatioConstraint"] = v_u_4.createElement("UIAspectRatioConstraint", {
			["AspectRatio"] = 1,
			["AspectType"] = nil,
			["DominantAxis"] = nil,
			["AspectType"] = Enum.AspectType.FitWithinMaxSize,
			["DominantAxis"] = Enum.DominantAxis.Width
		})
	}
	if v50 then
		v50 = v_u_4.createElement(v_u_7, {
			["Size"] = UDim2.fromScale(1, 1),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5)
		})
	end
	v55.ShimmerFrame = v50
	if v49 then
		v49 = v_u_4.createElement(v_u_9, {
			["text"] = v_u_10:FormatByKey("CoreScripts.AvatarEditorPrompts.ItemsListLoadingFailed"),
			["size"] = UDim2.fromScale(1, 1),
			["onActivated"] = p48.onRetryLoading
		})
	end
	v55.LoadingFailed = v49
	v55.ViewportFrame = v_u_4.createElement("ViewportFrame", {
		["Visible"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["LightColor"] = nil,
		["Ambient"] = nil,
		["CurrentCamera"] = nil,
		["Visible"] = v51,
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["LightColor"] = Color3.fromRGB(240, 240, 240),
		["Ambient"] = Color3.fromRGB(240, 240, 240),
		["CurrentCamera"] = p48.cameraRef
	}, {
		["Camera"] = v_u_4.createElement("Camera", {
			["CameraType"] = Enum.CameraType.Scriptable,
			["FieldOfView"] = 70,
			["CFrame"] = p48.cameraCFrameBinding,
			["Focus"] = p48.cameraFocusBinding,
			[v_u_4.Ref] = p48.cameraRef
		}),
		["WorldModel"] = v_u_4.createElement("WorldModel", {
			[v_u_4.Ref] = p48.worldModelRef
		})
	})
	return v52(v53, v54, v55)
end
function v13.didMount(p56) -- name: didMount
	p56.mounted = true
	if p56.props.humanoidDescription then
		p56:loadHumanoidModel()
	end
end
function v13.didUpdate(p57, p58) -- name: didUpdate
	if p57.worldModelRef:getValue() and p57.humanoidModel then
		p57.humanoidModel.Parent = p57.worldModelRef:getValue()
	end
	local v59 = p57.props.humanoidDescription ~= p58.humanoidDescription
	local v60 = p57.props.rigType ~= p58.rigType
	local v61
	if p57.props.rigType == nil or p57.props.humanoidDescription == nil then
		v61 = false
	else
		v61 = v59 or v60
	end
	if v61 then
		p57:setState({
			["loading"] = true
		})
		if p57.props.humanoidDescription ~= nil then
			p57:loadHumanoidModel()
		end
	end
end
function v13.willUnmount(p62) -- name: willUnmount
	p62.mounted = false
end
return v13