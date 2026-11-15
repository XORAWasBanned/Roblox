-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceChat.MainViewVoiceChat
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local _ = script.Parent.Parent.Parent.Actions
local v3 = script.Parent.Parent.Parent.Components
local v4 = require(v3.DataConsumer)
local v_u_5 = require(script.Parent.Parent.Parent.Constants)
local v_u_6 = v_u_5.GeneralFormatting.MainRowPadding
local v_u_7 = require(v3.UtilAndTab)
local v8 = v_u_2.PureComponent:extend("MainViewVoiceChat")
function v8.init(p_u_9) -- name: init
	-- upvalues: (copy) v_u_2
	function p_u_9.onUtilTabHeightChanged(p10)
		-- upvalues: (copy) p_u_9
		p_u_9:setState({
			["utilTabHeight"] = p10
		})
	end
	function p_u_9.onStatsUpdated(p11)
		-- upvalues: (copy) p_u_9
		p_u_9:setState({
			["stats"] = p11
		})
	end
	p_u_9._statsUpdatedConnection = p_u_9.props.VoiceChatData:Signal():Connect(p_u_9.onStatsUpdated)
	p_u_9.utilRef = v_u_2.createRef()
	p_u_9.state = {
		["utilTabHeight"] = 0,
		["stats"] = nil,
		["stats"] = {}
	}
end
function v8.didMount(p12) -- name: didMount
	p12:setState({
		["utilTabHeight"] = p12.utilRef.current.Size.Y.Offset
	})
end
function v8.didUpdate(p13) -- name: didUpdate
	local v14 = p13.utilRef.current.Size
	if v14.Y.Offset ~= p13.state.utilTabHeight then
		p13:setState({
			["utilTabHeight"] = v14.Y.Offset
		})
	end
end
function v8.willUnmount(p15) -- name: willUnmount
	if p15._statsUpdatedConnection then
		p15._statsUpdatedConnection:Disconnect()
		p15._statsUpdatedConnection = nil
	end
end
function v8.render(p_u_16) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7
	local v17 = p_u_16.props.size
	local v18 = p_u_16.props.formFactor
	local v19 = p_u_16.props.tabList
	local v_u_20 = {
		{
			["key"] = "rttMs",
			["format"] = "Round-trip time: %f",
			["defaultValue"] = 0
		},
		{
			["key"] = "incomingPackets",
			["format"] = "Incoming Packets: %d",
			["defaultValue"] = 0
		},
		{
			["key"] = "outgoingPackets",
			["format"] = "Outgoing Packets: %d",
			["defaultValue"] = 0
		},
		{
			["key"] = "incomingPacketsLost",
			["format"] = "Incoming Packets Lost: %d",
			["defaultValue"] = 0
		},
		{
			["key"] = "outgoingPacketsLost",
			["format"] = "Outgoing Packets Lost: %d",
			["defaultValue"] = 0
		}
	}
	local function v24() -- name: renderStatLabels
		-- upvalues: (copy) v_u_20, (ref) v_u_2, (copy) p_u_16, (ref) v_u_5
		local v21 = {}
		for v22, v23 in ipairs(v_u_20) do
			v21[v22] = v_u_2.createElement("TextLabel", {
				["LayoutOrder"] = nil,
				["Size"] = nil,
				["Text"] = nil,
				["TextColor3"] = nil,
				["TextXAlignment"] = nil,
				["BackgroundTransparency"] = 1,
				["LayoutOrder"] = v22,
				["Size"] = UDim2.fromOffset(200, 20),
				["Text"] = string.format(v23.format, p_u_16.state.stats[v23.key] or v23.defaultValue),
				["TextColor3"] = v_u_5.Color.Text,
				["TextXAlignment"] = Enum.TextXAlignment.Left
			})
		end
		return v_u_2.createFragment(v21)
	end
	local v25 = v_u_2.createElement
	local v26 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder,
			["FillDirection"] = Enum.FillDirection.Vertical,
			["HorizontalAlignment"] = Enum.HorizontalAlignment.Left,
			["VerticalAlignment"] = Enum.VerticalAlignment.Top,
			["Padding"] = UDim.new(0, v_u_6)
		}),
		["FramePadding"] = v_u_2.createElement("UIPadding", {
			["PaddingLeft"] = UDim.new(0, 16)
		}),
		["UtilAndTab"] = v_u_2.createElement(v_u_7, {
			["windowWidth"] = nil,
			["formFactor"] = nil,
			["tabList"] = nil,
			["layoutOrder"] = 1,
			["refForParent"] = nil,
			["windowWidth"] = v17.X.Offset,
			["formFactor"] = v18,
			["tabList"] = v19,
			["refForParent"] = p_u_16.utilRef
		})
	}
	local v27 = v_u_2.createElement
	local v28 = {
		["UIListLayout"] = v_u_2.createElement("UIListLayout", {
			["SortOrder"] = Enum.SortOrder.LayoutOrder
		}),
		["Labels"] = v24()
	}
	v26.StatsContainer = v27("Frame", {
		["LayoutOrder"] = 2,
		["BackgroundTransparency"] = 1
	}, v28)
	return v25("Frame", {
		["Size"] = nil,
		["BackgroundTransparency"] = 1,
		["LayoutOrder"] = 3,
		["Size"] = v17
	}, v26)
end
return v4(v8, "VoiceChatData")