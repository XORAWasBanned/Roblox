-- Path: CoreGui.RobloxGui.Modules.Shell.Components.Overscan10ft.Edges
local v1 = game:GetService("CorePackages")
local v_u_2 = UserSettings():GetService("UserGameSettings")
local v_u_3 = settings():FindFirstChild("Game Options")
local v_u_4 = game:GetService("UserInputService")
local v_u_5 = nil
local function v6()
	-- upvalues: (ref) v_u_5
	v_u_5 = game:GetService("PlatformService")
end
pcall(v6)
local v7 = game:GetService("CoreGui").RobloxGui.Modules
local v_u_8 = require(v1.Packages.React)
local v_u_9 = require(v7.Shell.Utility)
local v_u_10 = require(v7.Shell.Components.ContextActionEvent)
local v_u_11 = require(v1.Workspace.Packages.RoactUtils).ExternalEventConnection
local v_u_12 = require(v7.Shell.Components.RenderStep)
local v_u_13 = game:GetEngineFeature("MigrateOverscanToGameBasicSettings")
local v_u_14 = Vector2.new(0.85, 0.85)
local v_u_15 = Vector2.new(0.9, 0.9)
local v_u_16 = Vector2.new(1920, 1080)
local v_u_17 = Vector2.new(0, 0)
local function v_u_19(p18) -- name: EdgeImage
	-- upvalues: (copy) v_u_8
	return v_u_8.createElement("ImageLabel", {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Rotation"] = nil,
		["Image"] = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenAdjustmentArrow.png",
		["Size"] = UDim2.new(0, 95, 0, 95),
		["Position"] = p18.Position,
		["AnchorPoint"] = p18.AnchorPoint,
		["Rotation"] = p18.Rotation
	})
end
local v20 = v_u_8.Component:extend("Edges")
function v20.init(p_u_21) -- name: init
	-- upvalues: (copy) v_u_9, (copy) v_u_14, (copy) v_u_16, (copy) v_u_17, (copy) v_u_13, (copy) v_u_2, (copy) v_u_3, (copy) v_u_15, (copy) v_u_4
	function p_u_21.onAdjustThumbstick(_, _, p22)
		-- upvalues: (copy) p_u_21, (ref) v_u_9
		p_u_21._stickPosition = v_u_9.GamepadLinearToCurve(Vector2.new(p22.Position.X, -p22.Position.Y), 0.2)
	end
	function p_u_21.onAccept()
		-- upvalues: (ref) v_u_13, (ref) v_u_2, (copy) p_u_21, (ref) v_u_3
		local function v32()
			-- upvalues: (ref) v_u_13, (ref) v_u_2, (ref) p_u_21, (ref) v_u_3
			if v_u_13 then
				local v23 = v_u_2
				local v24 = Vector2.new
				local v25 = p_u_21._edgePercent.X
				local v26 = math.min(1, v25)
				local v27 = p_u_21._edgePercent.Y
				v23.Overscan = v24(v26, (math.min(1, v27)))
			else
				local v28 = v_u_3
				local v29 = p_u_21._edgePercent.X
				v28.OverscanPX = math.min(1, v29)
				local v30 = v_u_3
				local v31 = p_u_21._edgePercent.Y
				v30.OverscanPY = math.min(1, v31)
			end
		end
		local _, _ = pcall(v32)
		if p_u_21.props.onSetEdges then
			p_u_21.props.onSetEdges()
		end
	end
	function p_u_21.onRenderStep()
		-- upvalues: (copy) p_u_21, (ref) v_u_17, (ref) v_u_9, (ref) v_u_14, (ref) v_u_16
		local v33 = tick()
		if p_u_21._lastUpdate then
			if p_u_21._stickPosition == v_u_17 then
				p_u_21._acceleration = 1
			else
				local v34 = v33 - p_u_21._lastUpdate
				local v35 = p_u_21
				local v36 = p_u_21._stickPosition * p_u_21._acceleration * v34 * 0.05 + p_u_21._edgePercent
				v35._edgePercent = v_u_9.ClampVector2(v_u_14, Vector2.new(1, 1), v36)
				local v37 = p_u_21
				local v38 = p_u_21._acceleration + v34 * 1
				v37._acceleration = math.min(v38, 3)
				local v39 = p_u_21
				local v40 = {}
				local v41 = p_u_21._edgePercent * v_u_16
				local v42 = Vector2.new(v_u_9.Round(v41.X / 2), v_u_9.Round(v41.Y / 2)) * 2
				v40.currentSize = v_u_9.ClampVector2(v_u_17, v_u_16, v42)
				v39:setState(v40)
			end
		end
		p_u_21._lastUpdate = v33
	end
	function p_u_21.onSuspended()
		-- upvalues: (ref) v_u_13, (ref) v_u_2, (copy) p_u_21, (ref) v_u_3
		local function v43()
			-- upvalues: (ref) v_u_13, (ref) v_u_2, (ref) p_u_21, (ref) v_u_3
			if v_u_13 then
				v_u_2.Overscan = Vector2.new(p_u_21._lastSavedOverscan.X, p_u_21._lastSavedOverscan.Y)
			else
				v_u_3.OverscanPX = p_u_21._lastSavedOverscan.X
				v_u_3.OverscanPY = p_u_21._lastSavedOverscan.Y
			end
		end
		pcall(v43)
	end
	local v44 = v_u_15
	local v_u_45 = v_u_9.ClampVector2(v_u_14, Vector2.new(1, 1), v44)
	local v46 = v_u_45 * v_u_16
	local v47 = Vector2.new(v_u_9.Round(v46.X / 2), v_u_9.Round(v46.Y / 2)) * 2
	local v_u_48 = v_u_9.ClampVector2(v_u_17, v_u_16, v47)
	if v_u_4:GetPlatform() == Enum.Platform.XBoxOne then
		local function v55()
			-- upvalues: (ref) v_u_13, (ref) v_u_2, (ref) v_u_45, (ref) v_u_9, (ref) v_u_14, (ref) v_u_48, (ref) v_u_16, (ref) v_u_17, (copy) p_u_21, (ref) v_u_3
			if v_u_13 then
				if v_u_2.Overscan.x > 0 and v_u_2.Overscan.y > 0 then
					v_u_45 = Vector2.new(v_u_2.Overscan.x, v_u_2.Overscan.y)
					local v49 = v_u_45
					v_u_45 = v_u_9.ClampVector2(v_u_14, Vector2.new(1, 1), v49)
					local v50 = v_u_45 * v_u_16
					local v51 = Vector2.new(v_u_9.Round(v50.X / 2), v_u_9.Round(v50.Y / 2)) * 2
					v_u_48 = v_u_9.ClampVector2(v_u_17, v_u_16, v51)
					p_u_21._lastSavedOverscan = Vector2.new(v_u_2.Overscan.x, v_u_2.Overscan.y)
					v_u_2.Overscan = Vector2.new(1, 1)
					return
				end
			elseif v_u_3.OverscanPX > 0 and v_u_3.OverscanPY > 0 then
				v_u_45 = Vector2.new(v_u_3.OverscanPX, v_u_3.OverscanPY)
				local v52 = v_u_45
				v_u_45 = v_u_9.ClampVector2(v_u_14, Vector2.new(1, 1), v52)
				local v53 = v_u_45 * v_u_16
				local v54 = Vector2.new(v_u_9.Round(v53.X / 2), v_u_9.Round(v53.Y / 2)) * 2
				v_u_48 = v_u_9.ClampVector2(v_u_17, v_u_16, v54)
				p_u_21._lastSavedOverscan = Vector2.new(v_u_3.OverscanPX, v_u_3.OverscanPY)
				v_u_3.OverscanPX = 1
				v_u_3.OverscanPY = 1
			end
		end
		pcall(v55)
	end
	p_u_21._stickPosition = v_u_17
	p_u_21._edgePercent = v_u_45
	p_u_21._lastUpdate = nil
	p_u_21._acceleration = 1
	p_u_21._seenAPressed = false
	p_u_21.state = {
		["currentSize"] = v_u_48
	}
end
function v20.render(p56) -- name: render
	-- upvalues: (copy) v_u_8, (copy) v_u_19, (copy) v_u_12, (copy) v_u_10, (ref) v_u_5, (copy) v_u_11
	local v57 = v_u_8.createElement
	local v58 = "Frame"
	local v59 = {
		["Size"] = nil,
		["Position"] = nil,
		["AnchorPoint"] = nil,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(0, p56.state.currentSize.X, 0, p56.state.currentSize.Y),
		["Position"] = UDim2.new(0.5, 0, 0.5, 0),
		["AnchorPoint"] = Vector2.new(0.5, 0.5)
	}
	local v60 = {
		["SelectionImage"] = v_u_8.createElement("ImageLabel", {
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["ScaleType"] = nil,
			["SliceCenter"] = nil,
			["Image"] = "rbxasset://textures/ui/Shell/ScreenAdjustment/ScreenRangeOverlay.png",
			["Size"] = UDim2.new(1, 2, 1, 2),
			["Position"] = UDim2.new(0, -1, 0, -1),
			["ScaleType"] = Enum.ScaleType.Slice,
			["SliceCenter"] = Rect.new(21, 21, 41, 41)
		}),
		["TopLeft"] = v_u_8.createElement(v_u_19, {
			["Rotation"] = 0,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = UDim2.new(0, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(0, 0)
		}),
		["TopRight"] = v_u_8.createElement(v_u_19, {
			["Rotation"] = 90,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = UDim2.new(1, 0, 0, 0),
			["AnchorPoint"] = Vector2.new(1, 0)
		}),
		["BottomRight"] = v_u_8.createElement(v_u_19, {
			["Rotation"] = 180,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = UDim2.new(1, 0, 1, 0),
			["AnchorPoint"] = Vector2.new(1, 1)
		}),
		["BottomLeft"] = v_u_8.createElement(v_u_19, {
			["Rotation"] = 270,
			["Position"] = nil,
			["AnchorPoint"] = nil,
			["Position"] = UDim2.new(0, 0, 1, 0),
			["AnchorPoint"] = Vector2.new(0, 1)
		}),
		["Render"] = v_u_8.createElement(v_u_12, {
			["name"] = "UpdateAdjustmentScreen",
			["priority"] = nil,
			["callback"] = nil,
			["priority"] = Enum.RenderPriority.Input.Value,
			["callback"] = p56.onRenderStep
		}),
		["AdjustConnectorThumbstick"] = v_u_8.createElement(v_u_10, {
			["name"] = "ThumbstickAdjustmentScreen",
			["callback"] = nil,
			["binds"] = nil,
			["callback"] = p56.onAdjustThumbstick,
			["binds"] = { Enum.KeyCode.Thumbstick2 }
		})
	}
	local v61 = v_u_5
	if v61 then
		v61 = v_u_8.createElement(v_u_11, {
			["event"] = v_u_5.Suspended,
			["callback"] = p56.onSuspended
		})
	end
	v60.SuspendedCn = v61
	return v57(v58, v59, v60)
end
return v20