-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.MainViewSubscriptionsPanel
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = script.Parent.Parent.Parent.Components
local v_u_4 = require(v3.CellLabel)
local v_u_5 = require(script.Parent.Parent.Parent.Constants)
local v_u_6 = require(script.Parent.CollapsibleSection)
require(script.Parent.VoiceDebugData)
local v_u_7 = UDim.new(0.13, 0)
local v_u_8 = UDim.new(0.11, 0)
local v_u_9 = UDim.new(0.11, 0)
local v_u_10 = UDim.new(0.12, 0)
local v_u_11 = UDim.new(0.11, 0)
local v_u_12 = UDim.new(0.14, 0)
local v_u_13 = UDim.new(0.1, 0)
local v_u_14 = UDim.new(0.09, 0)
local v_u_15 = UDim.new(0.09, 0)
local v_u_16 = v_u_7 + v_u_8
local v_u_17 = v_u_16 + v_u_9
local v_u_18 = v_u_17 + v_u_10
local v_u_19 = v_u_18 + v_u_11
local v_u_20 = v_u_19 + v_u_12
local v_u_21 = v_u_20 + v_u_13
local v_u_22 = v_u_21 + v_u_14
local v_u_23 = v_u_5.Color.TextBoxGray
local function v_u_25(p24) -- name: HeaderCell
	-- upvalues: (copy) v_u_2, (copy) v_u_5
	return v_u_2.createElement("TextLabel", {
		["Text"] = nil,
		["Size"] = nil,
		["Position"] = nil,
		["Font"] = nil,
		["TextSize"] = nil,
		["TextColor3"] = nil,
		["TextXAlignment"] = nil,
		["BackgroundTransparency"] = 1,
		["Text"] = string.upper(p24.text),
		["Size"] = p24.size,
		["Position"] = p24.pos,
		["Font"] = v_u_5.Font.MainWindowHeader,
		["TextSize"] = v_u_5.DefaultFontSize.MainWindowHeader,
		["TextColor3"] = v_u_5.Color.BorderGray,
		["TextXAlignment"] = Enum.TextXAlignment.Left
	})
end
local function v_u_77(p26) -- name: SubscriptionsTable
	-- upvalues: (copy) v_u_2, (copy) v_u_23, (copy) v_u_4, (copy) v_u_7, (copy) v_u_8, (copy) v_u_7, (copy) v_u_9, (copy) v_u_16, (copy) v_u_10, (copy) v_u_17, (copy) v_u_11, (copy) v_u_18, (copy) v_u_12, (copy) v_u_19, (copy) v_u_13, (copy) v_u_20, (copy) v_u_14, (copy) v_u_21, (copy) v_u_15, (copy) v_u_22, (copy) v_u_25
	local v27 = p26.subscriptions or {}
	local v28 = p26.layoutOrder
	local v29 = {}
	for v30, v31 in v27 do
		local v32 = v31.culled == true
		local v33 = "subscription" .. v30
		local v34 = v_u_2.createElement
		local v35 = "Frame"
		local v36 = {
			["Size"] = nil,
			["LayoutOrder"] = nil,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = nil,
			["BorderSizePixel"] = 0,
			["Size"] = UDim2.new(1, 0, 0, 20),
			["LayoutOrder"] = v30,
			["BackgroundColor3"] = v_u_23,
			["BackgroundTransparency"] = v32 and 0.6 or 1
		}
		local v37 = {}
		local v38 = v_u_2.createElement
		local v39 = v_u_4
		local v40 = {}
		local v41 = v31.audioSsrc
		v40.text = (type(v41) ~= "number" or (v41 ~= v41 or v41 % 1 ~= 0)) and "\226\128\148" or string.format("0x%08X", v41)
		v40.size = UDim2.new(v_u_7, UDim.new(1, 0))
		v40.pos = UDim2.new(0, 0, 0, 0)
		v37.AudioSsrc = v38(v39, v40)
		local v42 = v_u_2.createElement
		local v43 = v_u_4
		local v44 = {}
		local v45 = v31.feedReferenceId
		v44.text = (v45 == nil or v45 == "") and "\226\128\148" or tostring(v45)
		v44.size = UDim2.new(v_u_8, UDim.new(1, 0))
		v44.pos = UDim2.new(v_u_7, UDim.new(0, 0))
		v37.FeedId = v42(v43, v44)
		local v46 = v_u_2.createElement
		local v47 = v_u_4
		local v48 = {}
		local v49 = v31.userId
		v48.text = (v49 == nil or v49 == "") and "\226\128\148" or tostring(v49)
		v48.size = UDim2.new(v_u_9, UDim.new(1, 0))
		v48.pos = UDim2.new(v_u_16, UDim.new(0, 0))
		v37.UserId = v46(v47, v48)
		local v50 = v_u_2.createElement
		local v51 = v_u_4
		local v52 = {}
		local v53 = v31.audioMid
		v52.text = (v53 == nil or v53 == "") and "\226\128\148" or tostring(v53)
		v52.size = UDim2.new(v_u_10, UDim.new(1, 0))
		v52.pos = UDim2.new(v_u_17, UDim.new(0, 0))
		v52.textTruncate = Enum.TextTruncate.AtEnd
		v37.AudioMid = v50(v51, v52)
		local v54 = v_u_2.createElement
		local v55 = v_u_4
		local v56 = {}
		local v57
		if v31.culled == true then
			v57 = "\226\128\148"
		else
			local v58 = v31.incomingBitrateKbps
			v57 = type(v58) ~= "number" and "\226\128\148" or string.format("%.2f kbps", v58)
		end
		v56.text = v57
		v56.size = UDim2.new(v_u_11, UDim.new(1, 0))
		v56.pos = UDim2.new(v_u_18, UDim.new(0, 0))
		v37.Bitrate = v54(v55, v56)
		local v59 = v_u_2.createElement
		local v60 = v_u_4
		local v61 = {}
		local v62
		if v31.culled == true then
			v62 = "\226\128\148"
		else
			local v63 = v31.codecName
			v62 = (v63 == nil or v63 == "") and "\226\128\148" or tostring(v63)
		end
		v61.text = v62
		v61.size = UDim2.new(v_u_12, UDim.new(1, 0))
		v61.pos = UDim2.new(v_u_19, UDim.new(0, 0))
		v61.textTruncate = Enum.TextTruncate.AtEnd
		v37.Codec = v59(v60, v61)
		local v64 = v_u_2.createElement
		local v65 = v_u_4
		local v66 = {}
		local v67 = v31.culled
		v66.text = type(v67) == "boolean" and (v67 and "Yes" or "No") or "\226\128\148"
		v66.size = UDim2.new(v_u_13, UDim.new(1, 0))
		v66.pos = UDim2.new(v_u_20, UDim.new(0, 0))
		v37.Culled = v64(v65, v66)
		local v68 = v_u_2.createElement
		local v69 = v_u_4
		local v70 = {}
		local v71 = v31.isMuted
		v70.text = type(v71) == "boolean" and (v71 and "Yes" or "No") or "\226\128\148"
		v70.size = UDim2.new(v_u_14, UDim.new(1, 0))
		v70.pos = UDim2.new(v_u_21, UDim.new(0, 0))
		v37.Muted = v68(v69, v70)
		local v72 = v_u_2.createElement
		local v73 = v_u_4
		local v74 = {}
		local v75 = v31.isMutedLocally
		v74.text = type(v75) == "boolean" and (v75 and "Yes" or "No") or "\226\128\148"
		v74.size = UDim2.new(v_u_15, UDim.new(1, 0))
		v74.pos = UDim2.new(v_u_22, UDim.new(0, 0))
		v37.MutedLocally = v72(v73, v74)
		v29[v33] = v34(v35, v36, v37)
	end
	if next(v29) == nil then
		v29.placeholder = v_u_2.createElement(v_u_4, {
			["text"] = "\226\128\148",
			["layoutOrder"] = 1,
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(1, 0, 0, 20),
			["pos"] = UDim2.new()
		})
	end
	local v76 = v_u_2.createElement("Frame", {
		["Size"] = nil,
		["LayoutOrder"] = 1,
		["BackgroundTransparency"] = 1,
		["Size"] = UDim2.new(1, 0, 0, 20)
	}, {
		["AudioSsrc"] = v_u_2.createElement(v_u_25, {
			["text"] = "Audio Ssrc",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_7, UDim.new(1, 0)),
			["pos"] = UDim2.new(0, 0, 0, 0)
		}),
		["FeedId"] = v_u_2.createElement(v_u_25, {
			["text"] = "Feed ID",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_8, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_7, UDim.new(0, 0))
		}),
		["UserId"] = v_u_2.createElement(v_u_25, {
			["text"] = "User ID",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_9, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_16, UDim.new(0, 0))
		}),
		["AudioMid"] = v_u_2.createElement(v_u_25, {
			["text"] = "Audio Mid",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_10, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_17, UDim.new(0, 0))
		}),
		["Bitrate"] = v_u_2.createElement(v_u_25, {
			["text"] = "Bitrate",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_11, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_18, UDim.new(0, 0))
		}),
		["Codec"] = v_u_2.createElement(v_u_25, {
			["text"] = "Codec",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_12, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_19, UDim.new(0, 0))
		}),
		["Culled"] = v_u_2.createElement(v_u_25, {
			["text"] = "Culled",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_13, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_20, UDim.new(0, 0))
		}),
		["Muted"] = v_u_2.createElement(v_u_25, {
			["text"] = "Muted",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_14, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_21, UDim.new(0, 0))
		}),
		["MutedLocally"] = v_u_2.createElement(v_u_25, {
			["text"] = "Muted Locally",
			["size"] = nil,
			["pos"] = nil,
			["size"] = UDim2.new(v_u_15, UDim.new(1, 0)),
			["pos"] = UDim2.new(v_u_22, UDim.new(0, 0))
		})
	})
	return v_u_2.createElement("Frame", {
		["Size"] = nil,
		["AutomaticSize"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = nil,
		["Size"] = UDim2.new(1, 0, 0, 0),
		["AutomaticSize"] = Enum.AutomaticSize.Y,
		["LayoutOrder"] = v28
	}, {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Header"] = v76,
		["Rows"] = v_u_2.createElement("Frame", {
			["Size"] = nil,
			["AutomaticSize"] = nil,
			["LayoutOrder"] = 2,
			["BackgroundTransparency"] = 1,
			["Size"] = UDim2.new(1, 0, 0, 0),
			["AutomaticSize"] = Enum.AutomaticSize.Y
		}, {
			["UIListLayout"] = v_u_2.createElement("UIListLayout", {
				["SortOrder"] = Enum.SortOrder.LayoutOrder
			}),
			["Rows"] = v_u_2.createFragment(v29)
		})
	})
end
return function(p78) -- name: SubscriptionsPanel
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_77
	local v79 = p78.subscriptions
	local v80 = p78.layoutOrder
	local v81 = v_u_2.createElement
	local v82 = v_u_6
	local v83 = {
		["Table"] = v_u_2.createElement(v_u_77, {
			["subscriptions"] = nil,
			["layoutOrder"] = 1,
			["subscriptions"] = v79
		})
	}
	return v81(v82, {
		["title"] = "Subscriptions",
		["layoutOrder"] = nil,
		["layoutOrder"] = v80
	}, v83)
end