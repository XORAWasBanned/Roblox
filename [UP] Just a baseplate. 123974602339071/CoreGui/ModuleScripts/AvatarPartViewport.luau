-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.PublishAvatarPrompt.AvatarParts.AvatarPartViewport
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.t)
local v_u_4 = require(v1.Packages.UIBlox).Style.withStyle
local v_u_5 = require(v1.Packages.Thumbnailing).CameraUtility
local v_u_6 = require(v1.Packages.Thumbnailing).MannequinUtility
local v_u_7 = require(script.Parent.Parent.Parent.Parent.Constants)
local v_u_8 = require(script.Parent.Parent.Parent.Parent.MakeupPreviewUtils)
local v_u_9 = require(script.Parent.Parent.Parent.Parent.Flags.GetFFlagSingleUploadMakeupSupport)
local v10 = v_u_2.PureComponent:extend("AvatarPartViewport")
v10.validateProps = v3.strictInterface({
	["LayoutOrder"] = v3.optional(v3.number),
	["asset"] = v3.union(v3.table, v3.instanceOf("MeshPart"), v3.instanceOf("Accessory"), v3.instanceIsA("Decal")),
	["assetType"] = v3.optional(v3.EnumItem),
	["viewportSize"] = v3.optional(v3.Vector2)
})
function v10.init(p11) -- name: init
	-- upvalues: (copy) v_u_2
	p11.camera = nil
	p11.modelRef = v_u_2.createRef()
	local v12, v13 = v_u_2.createBinding(nil)
	p11.camera = v12
	p11.updateCamera = v13
end
function v10.createViewportCamera(p14) -- name: createViewportCamera
	local v15 = Instance.new("Camera")
	v15.Parent = p14.modelRef:getValue()
	v15.CameraType = Enum.CameraType.Scriptable
	v15.HeadLocked = true
	v15.VRTiltAndRollEnabled = true
	return v15
end
function v10.addBodyPartMannequinToViewport(p16) -- name: addBodyPartMannequinToViewport
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v17, v18, v19 = v_u_6.CreateBodyPartMannequin(p16.props.asset, false)
	local v20, v21 = v_u_6.SetupBodyPartMannequin(v17, v18, v19, p16.props.asset)
	v19.Parent = p16.modelRef:getValue()
	local v22 = p16:createViewportCamera()
	v_u_5.SetupBodyPartCamera(v19, v20, v21, v22)
	p16.updateCamera(v22)
end
function v10.addHeadModelToViewport(p23) -- name: addHeadModelToViewport
	-- upvalues: (copy) v_u_6, (copy) v_u_5
	local v24 = v_u_6.CreateHeadModel(p23.props.asset)
	v24.Parent = p23.modelRef:getValue()
	local v25 = p23:createViewportCamera()
	v_u_5.SetupHeadCamera(v24, v25)
	p23.updateCamera(v25)
end
function v10.addAccessoryToViewport(p26) -- name: addAccessoryToViewport
	-- upvalues: (copy) v_u_5
	local v27 = p26.props.asset
	local v28 = Instance.new("Model")
	v27.Parent = v28
	v28.Parent = p26.modelRef:getValue()
	local v29 = p26:createViewportCamera()
	v_u_5.SetupAccessoryCamera(v28, v29)
	p26.updateCamera(v29)
end
function v10.addMakeupDecalToViewport(p30) -- name: addMakeupDecalToViewport
	-- upvalues: (copy) v_u_8
	local v31 = v_u_8.createMakeupThumbnailPreview(p30.props.asset, p30.props.assetType)
	if v31 then
		v31.Parent = p30.modelRef:getValue()
		local v32 = p30:createViewportCamera()
		if v_u_8.setupMakeupThumbnailCamera(v31, v32, p30.props.assetType) then
			p30.updateCamera(v32)
		end
	end
end
function v10.didMount(p33) -- name: didMount
	-- upvalues: (copy) v_u_9, (copy) v_u_8
	local v34 = p33.props.asset
	if typeof(v34) == "Instance" then
		if v34:IsA("MeshPart") then
			p33:addHeadModelToViewport()
			return
		elseif v_u_9() and (v34:IsA("Decal") or p33.props.assetType and v_u_8.isMakeupAssetType(p33.props.assetType)) then
			p33:addMakeupDecalToViewport()
		else
			p33:addAccessoryToViewport()
		end
	else
		p33:addBodyPartMannequinToViewport()
		return
	end
end
function v10.render(p_u_35) -- name: render
	-- upvalues: (copy) v_u_4, (copy) v_u_7, (copy) v_u_2
	return v_u_4(function(p36)
		-- upvalues: (copy) p_u_35, (ref) v_u_7, (ref) v_u_2
		local v37 = p36.Theme
		local v38
		if p_u_35.props.viewportSize then
			v38 = p_u_35.props.viewportSize
		else
			v38 = v_u_7.ItemCardWidthLandscape
		end
		local v39 = v_u_2.createElement
		local v40 = {
			["LayoutOrder"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = nil,
			["ZIndex"] = 0,
			["LayoutOrder"] = p_u_35.props.LayoutOrder,
			["BackgroundColor3"] = v37.PlaceHolder.Color,
			["BackgroundTransparency"] = v37.PlaceHolder.Transparency,
			["Size"] = UDim2.fromOffset(v38, v38)
		}
		local v41 = {
			["UICorner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 10)
			}),
			["AspectRatioConstraint"] = v_u_2.createElement("UIAspectRatioConstraint", {
				["AspectRatio"] = 1,
				["AspectType"] = nil,
				["DominantAxis"] = nil,
				["AspectType"] = Enum.AspectType.FitWithinMaxSize,
				["DominantAxis"] = Enum.DominantAxis.Width
			})
		}
		local v42 = v_u_2.createElement
		local v43 = {
			["Size"] = nil,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["ImageTransparency"] = 0,
			["BackgroundTransparency"] = 1,
			["LightColor"] = nil,
			["Ambient"] = nil,
			["LightDirection"] = nil,
			["CurrentCamera"] = nil,
			["Size"] = UDim2.fromScale(1, 1),
			["Position"] = UDim2.fromScale(0.5, 0.5),
			["AnchorPoint"] = Vector2.new(0.5, 0.5),
			["LightColor"] = v_u_7.ViewportLightColor,
			["Ambient"] = v_u_7.ViewportLightAmbient,
			["LightDirection"] = v_u_7.ViewportLightDirection,
			["CurrentCamera"] = p_u_35.camera
		}
		local v44 = {
			["UICorner"] = v_u_2.createElement("UICorner", {
				["CornerRadius"] = UDim.new(0, 10)
			}),
			["WorldModel"] = v_u_2.createElement("WorldModel", {
				[v_u_2.Ref] = p_u_35.modelRef
			})
		}
		v41.ViewportFrame = v42("ViewportFrame", v43, v44)
		return v39("Frame", v40, v41)
	end)
end
return v10