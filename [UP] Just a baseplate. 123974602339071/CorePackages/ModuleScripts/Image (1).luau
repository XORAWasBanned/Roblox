-- Path: CorePackages.Packages._Index.Foundation.Foundation.Components.Image.Image
local v1 = script:FindFirstAncestor("Foundation")
local v2 = v1.Parent
local v3 = require(v2.FoundationCloudAssets)
local v4 = require(v2.FoundationImages)
local v_u_5 = require(v2.React)
local v_u_6 = require(v2.ReactIs)
local v_u_7 = require(script.Parent.useOnLoaded)
local v_u_8 = v3.Assets
local v_u_9 = require(v1.Components.Interactable)
local v_u_10 = v4.Images
local v_u_11 = v4.IconImages_DEPRECATED
local v_u_12 = require(script.Parent.ImageSet.getScaledSlice)
local v_u_13 = require(script.Parent.CloudAsset.isCloudAsset)
local v_u_14 = require(script.Parent.ImageSet.isFoundationImage)
local v_u_15 = require(v1.Utility.GuiObjectChildren)
require(v1.Components.Types)
local v_u_16 = require(v1.Utility.indexBindable)
local v_u_17 = require(v1.Utility.useDefaultTags)
local v_u_18 = require(v1.Utility.withDefaults)
local v_u_19 = require(v1.Utility.withGuiObjectProps)
local v_u_20 = require(v1.Providers.Style.useStyleTags)
local v_u_21 = {
	["AutoLocalize"] = false,
	["AutoButtonColor"] = false,
	["BorderSizePixel"] = 0,
	["isDisabled"] = false
}
local v_u_22 = _G.__DEV__ == true
return v_u_5.memo(v_u_5.forwardRef(function(p23, p24) -- name: Image
	-- upvalues: (copy) v_u_18, (copy) v_u_21, (copy) v_u_5, (copy) v_u_6, (copy) v_u_13, (copy) v_u_14, (copy) v_u_8, (copy) v_u_11, (copy) v_u_22, (copy) v_u_10, (copy) v_u_12, (copy) v_u_17, (copy) v_u_20, (copy) v_u_7, (copy) v_u_19, (copy) v_u_16, (copy) v_u_9, (copy) v_u_15
	local v_u_25 = v_u_18(p23, v_u_21)
	local v26 = (v_u_25.onStateChanged ~= nil or v_u_25.onActivated ~= nil) and true or v_u_25.onSecondaryActivated ~= nil
	local v_u_27 = v_u_25.aspectRatio
	local v_u_28, v_u_29 = v_u_5.useState(false)
	v_u_5.useEffect(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_25, (copy) v_u_29, (ref) v_u_13, (ref) v_u_5
		if v_u_6.isBinding(v_u_25.Image) then
			local v30 = v_u_25.Image
			v_u_29(v_u_13(v30:getValue()))
			local v_u_32 = v_u_5.__subscribeToBinding(v30, function(p31)
				-- upvalues: (ref) v_u_29, (ref) v_u_13
				v_u_29(v_u_13(p31))
			end)
			return function()
				-- upvalues: (copy) v_u_32
				v_u_32()
			end
		end
	end, { v_u_25.Image, v_u_27 })
	local v71, v72, v73, v74 = v_u_5.useMemo(function()
		-- upvalues: (copy) v_u_25, (copy) v_u_27, (ref) v_u_6, (ref) v_u_14, (ref) v_u_13, (ref) v_u_8, (ref) v_u_11, (ref) v_u_22, (ref) v_u_10, (copy) v_u_28
		local v33 = v_u_25.Image
		local v34
		if v_u_25.imageRect then
			v34 = v_u_25.imageRect.offset
		else
			v34 = nil
		end
		local v35
		if v_u_25.imageRect then
			v35 = v_u_25.imageRect.size
		else
			v35 = nil
		end
		local v36 = v_u_27
		if not v_u_6.isBinding(v_u_25.Image) then
			local v37 = v_u_25.Image
			if typeof(v37) == "string" and v_u_14(v_u_25.Image) then
				if v_u_13(v_u_25.Image) then
					local v38 = v_u_8[v_u_25.Image]
					local v39 = v38.assetId
					local v40 = v38.size
					return v39, v34, v35, v40.X / v40.Y
				end
				local v41 = v_u_25.Image
				local v42 = v_u_11[v41]
				if not v42 then
					if v_u_22 then
						v42 = v_u_10[v41]
					else
						local v43 = v_u_10
						v42 = rawget(v43, v41)
					end
				end
				if v42 then
					v33 = v42.Image
					v34 = v42.ImageRectOffset
					v35 = v42.ImageRectSize
				end
			end
			return v33, v34, v35, v36
		end
		local v44
		if v_u_28 then
			local v_u_45 = "AspectRatio"
			v44 = v_u_25.Image:map(function(p46)
				-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_8, (copy) v_u_45, (ref) v_u_11, (ref) v_u_22, (ref) v_u_10, (ref) v_u_27, (ref) v_u_25
				if v_u_14(p46) then
					if v_u_13(p46) then
						local v47 = v_u_8[p46]
						if v_u_45 == "Image" then
							return v47.assetId
						end
						if v_u_45 ~= "AspectRatio" then
							return nil
						end
						local v48 = v47.size
						return v48.X / v48.Y
					else
						local v49 = v_u_11[p46]
						if not v49 then
							if v_u_22 then
								v49 = v_u_10[p46]
							else
								local v50 = v_u_10
								v49 = rawget(v50, p46)
							end
						end
						if v_u_45 == "AspectRatio" then
							return v_u_27
						elseif v49 then
							return v49[v_u_45]
						elseif v_u_45 == "Image" then
							return p46
						else
							return nil
						end
					end
				elseif v_u_45 == "Image" then
					return p46
				elseif v_u_45 == "ImageRectOffset" and v_u_25.imageRect then
					return v_u_25.imageRect.offset
				elseif v_u_45 == "ImageRectSize" and v_u_25.imageRect then
					return v_u_25.imageRect.size
				else
					return nil
				end
			end)
		else
			v44 = v_u_27
		end
		local v_u_51 = "Image"
		local v57 = v_u_25.Image:map(function(p52)
			-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_8, (copy) v_u_51, (ref) v_u_11, (ref) v_u_22, (ref) v_u_10, (ref) v_u_27, (ref) v_u_25
			if v_u_14(p52) then
				if v_u_13(p52) then
					local v53 = v_u_8[p52]
					if v_u_51 == "Image" then
						return v53.assetId
					end
					if v_u_51 ~= "AspectRatio" then
						return nil
					end
					local v54 = v53.size
					return v54.X / v54.Y
				else
					local v55 = v_u_11[p52]
					if not v55 then
						if v_u_22 then
							v55 = v_u_10[p52]
						else
							local v56 = v_u_10
							v55 = rawget(v56, p52)
						end
					end
					if v_u_51 == "AspectRatio" then
						return v_u_27
					elseif v55 then
						return v55[v_u_51]
					elseif v_u_51 == "Image" then
						return p52
					else
						return nil
					end
				end
			elseif v_u_51 == "Image" then
				return p52
			elseif v_u_51 == "ImageRectOffset" and v_u_25.imageRect then
				return v_u_25.imageRect.offset
			elseif v_u_51 == "ImageRectSize" and v_u_25.imageRect then
				return v_u_25.imageRect.size
			else
				return nil
			end
		end)
		local v_u_58 = "ImageRectOffset"
		local v64 = v_u_25.Image:map(function(p59)
			-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_8, (copy) v_u_58, (ref) v_u_11, (ref) v_u_22, (ref) v_u_10, (ref) v_u_27, (ref) v_u_25
			if v_u_14(p59) then
				if v_u_13(p59) then
					local v60 = v_u_8[p59]
					if v_u_58 == "Image" then
						return v60.assetId
					end
					if v_u_58 ~= "AspectRatio" then
						return nil
					end
					local v61 = v60.size
					return v61.X / v61.Y
				else
					local v62 = v_u_11[p59]
					if not v62 then
						if v_u_22 then
							v62 = v_u_10[p59]
						else
							local v63 = v_u_10
							v62 = rawget(v63, p59)
						end
					end
					if v_u_58 == "AspectRatio" then
						return v_u_27
					elseif v62 then
						return v62[v_u_58]
					elseif v_u_58 == "Image" then
						return p59
					else
						return nil
					end
				end
			elseif v_u_58 == "Image" then
				return p59
			elseif v_u_58 == "ImageRectOffset" and v_u_25.imageRect then
				return v_u_25.imageRect.offset
			elseif v_u_58 == "ImageRectSize" and v_u_25.imageRect then
				return v_u_25.imageRect.size
			else
				return nil
			end
		end)
		local v_u_65 = "ImageRectSize"
		return v57, v64, v_u_25.Image:map(function(p66)
			-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_8, (copy) v_u_65, (ref) v_u_11, (ref) v_u_22, (ref) v_u_10, (ref) v_u_27, (ref) v_u_25
			if v_u_14(p66) then
				if v_u_13(p66) then
					local v67 = v_u_8[p66]
					if v_u_65 == "Image" then
						return v67.assetId
					end
					if v_u_65 ~= "AspectRatio" then
						return nil
					end
					local v68 = v67.size
					return v68.X / v68.Y
				else
					local v69 = v_u_11[p66]
					if not v69 then
						if v_u_22 then
							v69 = v_u_10[p66]
						else
							local v70 = v_u_10
							v69 = rawget(v70, p66)
						end
					end
					if v_u_65 == "AspectRatio" then
						return v_u_27
					elseif v69 then
						return v69[v_u_65]
					elseif v_u_65 == "Image" then
						return p66
					else
						return nil
					end
				end
			elseif v_u_65 == "Image" then
				return p66
			elseif v_u_65 == "ImageRectOffset" and v_u_25.imageRect then
				return v_u_25.imageRect.offset
			elseif v_u_65 == "ImageRectSize" and v_u_25.imageRect then
				return v_u_25.imageRect.size
			else
				return nil
			end
		end), v44
	end, {
		v_u_25.Image,
		v_u_25.imageRect,
		v_u_28,
		v_u_27,
		v_u_10
	})
	local v75 = nil
	local v76 = nil
	local v77 = v_u_25.ScaleType
	if v_u_25.slice then
		if v_u_6.isBinding(v_u_25.Image) then
			local v82 = v_u_25.Image:map(function(p78)
				-- upvalues: (ref) v_u_14, (ref) v_u_13, (ref) v_u_11, (ref) v_u_22, (ref) v_u_10, (ref) v_u_12, (copy) v_u_25
				local v79 = not v_u_14(p78) or v_u_13(p78)
				if not v79 then
					local v80 = v_u_11[p78]
					if not v80 then
						if v_u_22 then
							v80 = v_u_10[p78]
						else
							local v81 = v_u_10
							v80 = rawget(v81, p78)
						end
					end
					v79 = v80 ~= nil
				end
				if v79 then
					return v_u_12(v_u_25.slice.center, v_u_25.slice.scale)
				else
					return v_u_25.slice
				end
			end)
			v75 = v82:map(function(p83)
				return p83.center
			end)
			v76 = v82:map(function(p84)
				return p84.scale
			end)
		else
			local v85 = v_u_25.Image
			if typeof(v85) == "string" then
				local v86 = v_u_25.Image
				local v87 = not v_u_14(v86) or v_u_13(v86)
				if not v87 then
					local v88 = v_u_11[v86]
					if not v88 then
						if v_u_22 then
							v88 = v_u_10[v86]
						else
							local v89 = v_u_10
							v88 = rawget(v89, v86)
						end
					end
					v87 = v88 ~= nil
				end
				if v87 then
					local v90 = v_u_12(v_u_25.slice.center, v_u_25.slice.scale)
					v75 = v90.center
					v76 = v90.scale
				else
					v75 = v_u_25.slice.center
					v76 = v_u_25.slice.scale
				end
			end
		end
		v77 = Enum.ScaleType.Slice
	end
	v_u_25.aspectRatio = v74
	local v91 = v_u_25.backgroundStyle == nil and "gui-object-defaults" or "gui-object-defaults x-default-transparency"
	local v92 = v_u_20((v_u_17(v_u_25.tag, v91)))
	v_u_7(v71, v_u_25.onLoaded)
	local v95 = v_u_5.useMemo(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_25
		if v_u_6.isBinding(v_u_25.ImageContent) then
			return v_u_25.ImageContent:map(function(p93)
				if typeof(p93) == "string" then
					return Content.fromUri(p93)
				else
					return p93
				end
			end)
		else
			local v94 = v_u_25.ImageContent
			if typeof(v94) == "string" then
				return Content.fromUri(v_u_25.ImageContent)
			else
				return v_u_25.ImageContent
			end
		end
	end, { v_u_25.ImageContent })
	local v96 = v26 and "ImageButton" or "ImageLabel"
	local v97 = v_u_19
	local v98 = {}
	local v99
	if v96 == "ImageButton" then
		v99 = v_u_25.AutoButtonColor
	else
		v99 = nil
	end
	v98.AutoButtonColor = v99
	v98.Image = v71
	v98.ImageContent = v95
	local v100
	if v_u_25.imageStyle then
		v100 = v_u_16(v_u_25.imageStyle, "Color3")
	else
		v100 = nil
	end
	v98.ImageColor3 = v100
	local v101
	if v_u_25.imageStyle then
		v101 = v_u_16(v_u_25.imageStyle, "Transparency")
	else
		v101 = nil
	end
	v98.ImageTransparency = v101
	v98.ImageRectOffset = v72
	v98.ImageRectSize = v73
	v98.ResampleMode = v_u_25.ResampleMode
	v98.ScaleType = v77
	v98.SliceCenter = v75
	v98.SliceScale = v76
	v98.TileSize = v_u_25.TileSize
	v98.ref = p24
	v98[v_u_5.Tag] = v92
	local v102 = v97(v_u_25, v98)
	local v103
	if v26 then
		v103 = v_u_9
		v102.component = v96
		v102.onActivated = v_u_25.onActivated
		v102.onSecondaryActivated = v_u_25.onSecondaryActivated
		v102.onStateChanged = v_u_25.onStateChanged
		v102.stateLayer = v_u_25.stateLayer
		v102.isDisabled = v_u_25.isDisabled
		v102.cursor = v_u_25.cursor
	else
		v103 = v96
	end
	return v_u_5.createElement(v103, v102, v_u_15(v_u_25))
end))