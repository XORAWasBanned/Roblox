-- Path: CoreGui.RobloxGui.Modules.PublishAssetPrompt.Components.ImagePreview
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.React)
local v3 = require(v1.Packages.Foundation)
local v_u_4 = v3.Image
local v_u_5 = v3.View
local v_u_6 = v3.Hooks.useTokens
return function(p7) -- name: ImagePreview
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_5, (copy) v_u_4
	local v_u_8 = v_u_6()
	local v_u_9 = v_u_2.useMemo(function()
		-- upvalues: (copy) v_u_8
		return {
			{
				["id"] = "Black",
				["style"] = nil,
				["style"] = v_u_8.Color.Extended.Black.Black_100
			},
			{
				["id"] = "White",
				["style"] = nil,
				["style"] = v_u_8.Color.Extended.White.White_100
			},
			{
				["id"] = "Checkerboard",
				["style"] = nil,
				["image"] = "rbxassetid://6372755229",
				["style"] = v_u_8.Color.Extended.White.White_0
			}
		}
	end, { v_u_8 })
	local v_u_10, v_u_11 = v_u_2.useState(1)
	local v_u_12 = v_u_2.useRef(false)
	local v_u_13 = not p7.autoRotateSeconds and 0 or p7.autoRotateSeconds / #v_u_9
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_13, (copy) v_u_9, (copy) v_u_12, (copy) v_u_11
		if v_u_13 <= 0 then
			return function() end
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_13, (ref) v_u_12, (ref) v_u_11
			for _ = 2, #v_u_9 do
				task.wait(v_u_13)
				if v_u_12.current then
					return
				end
				v_u_11(function(p14)
					-- upvalues: (ref) v_u_9
					return p14 % #v_u_9 + 1
				end)
			end
		end)
		return function()
			-- upvalues: (ref) v_u_12
			v_u_12.current = true
		end
	end, { v_u_13, v_u_9 })
	local v_u_15, v_u_16 = v_u_2.useBinding(v_u_9[1].style)
	local v_u_17 = v_u_8.Time.Time_300
	v_u_2.useEffect(function()
		-- upvalues: (copy) v_u_15, (copy) v_u_9, (copy) v_u_10, (copy) v_u_17, (copy) v_u_16
		local v_u_18 = v_u_15:getValue()
		local v_u_19 = v_u_9[v_u_10].style
		local v_u_20 = false
		task.spawn(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_20, (ref) v_u_16, (copy) v_u_18, (copy) v_u_19
			local v21 = 0
			while v21 < v_u_17 do
				v21 = v21 + task.wait()
				if v_u_20 then
					return
				end
				local v22 = v21 / v_u_17
				local v23 = math.min(v22, 1)
				v_u_16({
					["Color3"] = v_u_18.Color3:Lerp(v_u_19.Color3, v23),
					["Transparency"] = v_u_18.Transparency + (v_u_19.Transparency - v_u_18.Transparency) * v23
				})
			end
		end)
		return function()
			-- upvalues: (ref) v_u_20
			v_u_20 = true
		end
	end, {
		v_u_10,
		v_u_9,
		v_u_17,
		v_u_15,
		v_u_16
	})
	local v24 = {}
	for v_u_25, v26 in v_u_9 do
		local v27 = v26.id
		local v28 = v_u_2.createElement
		local v29 = v_u_5
		local v30 = {
			["LayoutOrder"] = v_u_25,
			["tag"] = {
				["size-350 radius-small"] = true,
				["stroke-thick stroke-emphasis"] = v_u_25 == v_u_10,
				["stroke-standard stroke-default"] = v_u_25 ~= v_u_10
			},
			["backgroundStyle"] = v26.style,
			["onActivated"] = function() -- name: onActivated
				-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_25
				v_u_12.current = true
				v_u_11(v_u_25)
			end,
			["testId"] = ("ImagePreviewBackgroundSwatch%*"):format(v26.id)
		}
		local v31 = {}
		local v32
		if v26.image then
			v32 = v_u_2.createElement(v_u_4, {
				["tag"] = "size-full radius-small",
				["Image"] = nil,
				["ScaleType"] = nil,
				["TileSize"] = nil,
				["Image"] = v26.image,
				["ScaleType"] = Enum.ScaleType.Tile,
				["TileSize"] = UDim2.fromOffset(v_u_8.Size.Size_150, v_u_8.Size.Size_150)
			}) or nil
		else
			v32 = nil
		end
		v31.Checkerboard = v32
		v24[v27] = v28(v29, v30, v31)
	end
	return v_u_2.createElement(v_u_5, {
		["tag"] = "col align-x-center gap-xsmall size-full"
	}, {
		["Preview"] = v_u_2.createElement(v_u_4, {
			["LayoutOrder"] = 1,
			["tag"] = "size-full aspect-1-1 radius-small clip",
			["backgroundStyle"] = nil,
			["imageStyle"] = nil,
			["Image"] = "rbxassetid://6372755229",
			["ScaleType"] = nil,
			["TileSize"] = nil,
			["testId"] = "ImagePreviewBackground",
			["backgroundStyle"] = v_u_15,
			["imageStyle"] = v_u_15:map(function(p33)
				-- upvalues: (copy) v_u_8
				return {
					["Color3"] = v_u_8.Color.Extended.White.White_100.Color3,
					["Transparency"] = 1 - p33.Transparency
				}
			end),
			["ScaleType"] = Enum.ScaleType.Tile,
			["TileSize"] = UDim2.fromOffset(v_u_8.Size.Size_400, v_u_8.Size.Size_400)
		}, {
			["Asset"] = v_u_2.createElement(v_u_4, {
				["tag"] = "size-full",
				["ImageContent"] = nil,
				["ScaleType"] = nil,
				["ZIndex"] = 2,
				["testId"] = "ImagePreviewAsset",
				["ImageContent"] = p7.imageContent,
				["ScaleType"] = Enum.ScaleType.Fit
			})
		}),
		["Swatches"] = v_u_2.createElement(v_u_5, {
			["tag"] = "row gap-xsmall auto-xy",
			["LayoutOrder"] = 2,
			["testId"] = "ImagePreviewSwatches"
		}, v24)
	})
end