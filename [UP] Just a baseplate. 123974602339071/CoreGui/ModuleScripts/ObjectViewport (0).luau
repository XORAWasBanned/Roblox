-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.ObjectViewport
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v_u_4 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_5 = game:GetService("RunService")
local v6 = v_u_2.PureComponent:extend("ObjectViewport")
v6.validateProps = v3.strictInterface({
	["model"] = v3.instanceOf("Model")
})
function v6.init(p7) -- name: init
	-- upvalues: (copy) v_u_2
	p7.cameraRef = v_u_2.createRef()
	p7.worldModelRef = v_u_2.createRef()
	local v8, v9 = v_u_2.createBinding(CFrame.new())
	p7.cameraCFrameBinding = v8
	p7.updateCameraCFrameBinding = v9
	local v10, v11 = v_u_2.createBinding(0)
	p7.cameraRotationBinding = v10
	p7.updateCameraRotationBinding = v11
	local v12, v13 = v_u_2.createBinding(CFrame.new())
	p7.cameraFocusBinding = v12
	p7.updateCameraFocusBinding = v13
	p7:OnModelChanged()
end
function v6.OnModelChanged(p14) -- name: OnModelChanged
	if p14.props.model ~= nil then
		p14.modelCFrame = p14.props.model:GetModelCFrame()
		p14.initialLookVector = p14.modelCFrame.lookVector
		p14.modelExtentsSize = p14.props.model:GetExtentsSize()
		local v15 = p14.modelExtentsSize
		local v16 = v15.X
		local v17 = v15.Y
		local v18 = v15.Z
		p14.cameraDistance = math.max(v16, v17, v18) / 2 * 1.4281480067421146 + v18 / 2
	end
end
function v6.render(p_u_19) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
	local v20 = v_u_2.createElement
	local v21 = {
		["BackgroundTransparency"] = 1,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["Size"] = nil,
		["Position"] = UDim2.fromScale(0, 0),
		["AnchorPoint"] = Vector2.new(0, 0),
		["Size"] = UDim2.fromScale(1, 1)
	}
	local v22 = {
		["AspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
			["AspectRatio"] = 1,
			["AspectType"] = nil,
			["DominantAxis"] = nil,
			["AspectType"] = Enum.AspectType.FitWithinMaxSize,
			["DominantAxis"] = Enum.DominantAxis.Width
		})
	}
	local v23 = v_u_2.createElement
	local v24 = {
		["BackgroundTransparency"] = 0,
		["BackgroundColor3"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["LightColor"] = nil,
		["LightDirection"] = Vector3.new(1, 1, 1),
		["Ambient"] = nil,
		["CurrentCamera"] = nil,
		["BackgroundColor3"] = Color3.new(0, 0, 0),
		["Size"] = UDim2.fromScale(1, 1),
		["Position"] = UDim2.fromScale(0.5, 0.5),
		["AnchorPoint"] = Vector2.new(0.5, 0.5),
		["LightColor"] = Color3.fromRGB(240, 240, 240),
		["Ambient"] = Color3.fromRGB(240, 240, 240),
		["CurrentCamera"] = p_u_19.cameraRef
	}
	local v29 = {
		["Camera"] = v_u_2.createElement("Camera", {
			["CameraType"] = Enum.CameraType.Scriptable,
			["FieldOfView"] = 70,
			["CFrame"] = p_u_19.cameraCFrameBinding,
			["Focus"] = p_u_19.cameraFocusBinding,
			[v_u_2.Ref] = p_u_19.cameraRef
		}),
		["WorldModel"] = v_u_2.createElement("WorldModel", {
			[v_u_2.Ref] = p_u_19.worldModelRef
		}),
		["RenderSteppedConnection"] = v_u_2.createElement(v_u_4, {
			["event"] = v_u_5.RenderStepped,
			["callback"] = function() -- name: callback
				-- upvalues: (copy) p_u_19
				p_u_19.updateCameraRotationBinding(p_u_19.cameraRotationBinding:getValue() + 0.01)
				local v25 = p_u_19.initialLookVector
				local v26 = p_u_19.cameraRotationBinding:getValue()
				local v27 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0), v26):VectorToWorldSpace(v25)
				local v28 = CFrame.new(p_u_19.modelCFrame.p + v27 * p_u_19.cameraDistance, p_u_19.modelCFrame.p)
				p_u_19.updateCameraCFrameBinding(v28)
			end
		})
	}
	v22.ViewportFrame = v23("ViewportFrame", v24, v29)
	return v20("Frame", v21, v22)
end
function v6.didMount(p30) -- name: didMount
	if p30.worldModelRef:getValue() and p30.props.model ~= nil then
		p30.props.model.Parent = p30.worldModelRef:getValue()
	end
end
function v6.willUnmount(p31) -- name: willUnmount
	if p31.props.model then
		p31.props.model.Parent = nil
	end
end
function v6.didUpdate(p32, p33) -- name: didUpdate
	if p32.props.model ~= p33.model then
		if p33.model ~= nil then
			p33.model.Parent = nil
		end
		if p32.props.model ~= nil then
			p32.props.model.Parent = p32.worldModelRef:getValue()
		end
		p32:OnModelChanged()
	end
end
return v6