-- Path: CorePackages.Packages._Index.MomentsCreationFlow.MomentsCreationFlow.Components.DragHandle
local v1 = script:FindFirstAncestor("MomentsCreationFlow").Parent
local v2 = require(v1.Foundation)
local v_u_3 = require(v1.React)
local v_u_4 = v2.View
local v_u_5 = v2.Hooks.useTokens
return function(p6)
	-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4
	local v7 = v_u_5()
	local v8 = v_u_3.createElement
	local v9 = v_u_4
	local v10 = {
		["AnchorPoint"] = nil,
		["tag"] = "bg-system-contrast radius-medium size-300-1000",
		["Position"] = nil,
		["AnchorPoint"] = p6.anchorPoint,
		["Position"] = p6.position
	}
	local v11 = {
		["OutlineStroke"] = v_u_3.createElement("UIStroke", {
			["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
			["Color"] = v7.Color.System.Contrast.Color3,
			["Transparency"] = v7.Color.System.Contrast.Transparency,
			["Thickness"] = v7.Stroke.Thicker
		}),
		["Line"] = v_u_3.createElement(v_u_4, {
			["tag"] = "anchor-center-center bg-surface-300 size-100-400 position-center-center radius-circle",
			["ZIndex"] = 2
		})
	}
	local v12 = v_u_3.createElement
	local v13 = v_u_4
	local v14 = {
		["Position"] = nil,
		["tag"] = "anchor-center-center bg-system-contrast size-100-1000"
	}
	local v15
	if p6.isFlipped then
		v15 = UDim2.new(0, v7.Size.Size_50, 0.5, 0)
	else
		v15 = UDim2.new(1, -v7.Size.Size_50, 0.5, 0)
	end
	v14.Position = v15
	local v16 = {
		["OutlineStroke"] = v_u_3.createElement("UIStroke", {
			["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border,
			["Color"] = v7.Color.System.Contrast.Color3,
			["LineJoinMode"] = Enum.LineJoinMode.Miter,
			["Transparency"] = v7.Color.System.Contrast.Transparency,
			["Thickness"] = v7.Stroke.Thicker
		})
	}
	v11.Box = v12(v13, v14, v16)
	v11.DragDetector = v_u_3.createElement("UIDragDetector", {
		["DragStyle"] = Enum.UIDragDetectorDragStyle.TranslateLine,
		["ref"] = p6.dragDetectorRef,
		["ResponseStyle"] = Enum.UIDragDetectorResponseStyle.CustomScale
	})
	return v8(v9, v10, v11)
end