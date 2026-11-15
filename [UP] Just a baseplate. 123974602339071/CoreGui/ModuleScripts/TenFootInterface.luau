-- Path: CoreGui.RobloxGui.Modules.TenFootInterface
local v_u_1 = Color3.new(0.10588235294117647, 0.9882352941176471, 0.4196078431372549)
local v_u_2 = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local v_u_3 = game:GetService("Players")
local v4 = game:GetService("CorePackages")
local v_u_5 = require(v4.Workspace.Packages.AppCommonLib).Create
local v_u_6 = require(v4.Workspace.Packages.AppCommonLib).isTenFootInterface()
local v7 = {}
local v_u_63 = (function() -- name: CreateModule
	-- upvalues: (copy) v_u_5, (copy) v_u_2, (copy) v_u_1, (copy) v_u_3
	local v_u_8 = {
		["Container"] = nil
	}
	local v_u_9 = {}
	local v_u_10 = Instance.new("BindableEvent")
	local v_u_11 = Instance.new("BindableEvent")
	local function v_u_12() -- name: createContainer
		-- upvalues: (copy) v_u_8, (ref) v_u_5, (ref) v_u_2
		if not v_u_8.Container then
			v_u_8.Container = v_u_5("ImageButton")({
				["Name"] = "TopRightContainer",
				["Size"] = nil,
				["Position"] = nil,
				["AutoButtonColor"] = false,
				["Image"] = "",
				["Active"] = false,
				["BackgroundTransparency"] = 1,
				["Parent"] = nil,
				["Size"] = UDim2.new(0, 350, 0, 100),
				["Position"] = UDim2.new(1, -415, 0, 10),
				["Parent"] = v_u_2
			})
		end
	end
	function removeFromDisplayStack(p13) -- name: removeFromDisplayStack
		-- upvalues: (copy) v_u_9, (copy) v_u_10
		local v14 = nil
		for v15 = 1, #v_u_9 do
			if v_u_9[v15] ~= p13 then
				continue
			end
			v14 = v15 + 1
		end
		for v16 = v14, #v_u_9 do
			local v17 = v_u_9[v16]
			v17.Position = UDim2.new(v17.Position.X.Scale, v17.Position.X.Offset, v17.Position.Y.Scale, p13.AbsolutePosition.Y)
			p13 = v17
		end
		v_u_10:Fire()
	end
	function addBackToDisplayStack(p18) -- name: addBackToDisplayStack
		-- upvalues: (copy) v_u_9, (copy) v_u_10
		local v19 = 0
		for v20 = 1, #v_u_9 do
			if v_u_9[v20] ~= p18 then
				continue
			end
			v19 = v20 + 1
		end
		for v21 = v19, #v_u_9 do
			local v22 = v_u_9[v21]
			local v23 = p18.AbsolutePosition.Y + p18.AbsoluteSize.Y + 4
			v22.Position = UDim2.new(v22.Position.X.Scale, v22.Position.X.Offset, v22.Position.Y.Scale, v23)
			p18 = v22
		end
		v_u_10:Fire()
	end
	function addToDisplayStack(p_u_24) -- name: addToDisplayStack
		-- upvalues: (copy) v_u_9, (copy) v_u_12, (copy) v_u_8, (copy) v_u_10
		local v25
		if #v_u_9 > 0 then
			v25 = v_u_9[#v_u_9]
		else
			v25 = nil
		end
		v_u_9[#v_u_9 + 1] = p_u_24
		local v26 = not v25 and 0 or v25.AbsolutePosition.Y + v25.AbsoluteSize.Y + 4
		p_u_24.Position = UDim2.new(p_u_24.Position.X.Scale, p_u_24.Position.X.Offset, p_u_24.Position.Y.Scale, v26)
		v_u_12()
		p_u_24.Parent = v_u_8.Container
		p_u_24.Changed:connect(function(p27)
			-- upvalues: (copy) p_u_24
			if p27 == "Visible" then
				if not p_u_24.Visible then
					removeFromDisplayStack(p_u_24)
					return
				end
				addBackToDisplayStack(p_u_24)
			end
		end)
		v_u_10:Fire()
	end
	function v_u_8.CreateHealthBar(_) -- name: CreateHealthBar
		-- upvalues: (copy) v_u_8, (ref) v_u_5, (ref) v_u_1, (copy) v_u_12, (copy) v_u_11
		v_u_8.HealthContainer = v_u_5("Frame")({
			["Name"] = "HealthContainer",
			["Size"] = nil,
			["Position"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.5,
			["Size"] = UDim2.new(1, -86, 0, 50),
			["Position"] = UDim2.new(0, 92, 0, 0),
			["BackgroundColor3"] = Color3.new(0, 0, 0)
		})
		local v28 = v_u_5("Frame")({
			["Name"] = "HealthFillHolder",
			["Size"] = nil,
			["Position"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 1,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, -10, 1, -10),
			["Position"] = UDim2.new(0, 5, 0, 5),
			["BackgroundColor3"] = Color3.new(1, 1, 1),
			["Parent"] = v_u_8.HealthContainer
		})
		local v29 = v_u_5("Frame")({
			["Name"] = "HealthFill",
			["Size"] = nil,
			["Position"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundTransparency"] = 0,
			["BackgroundColor3"] = nil,
			["Parent"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["BackgroundColor3"] = v_u_1,
			["Parent"] = v28
		})
		v_u_5("TextLabel")({
			["Name"] = "HealthText",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 0.5,
			["BackgroundColor3"] = nil,
			["Font"] = nil,
			["FontSize"] = nil,
			["Text"] = "Health",
			["TextColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 98, 0, 50),
			["Position"] = UDim2.new(0, -100, 0, 0),
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["Font"] = Enum.Font.SourceSans,
			["FontSize"] = Enum.FontSize.Size36,
			["TextColor3"] = Color3.new(1, 1, 1),
			["Parent"] = v_u_8.HealthContainer
		})
		local v30 = v_u_5("TextLabel")({
			["Visible"] = false
		})
		local v31 = v_u_5("TextLabel")({
			["Visible"] = false
		})
		addToDisplayStack(v_u_8.HealthContainer)
		v_u_12()
		v_u_8.HealthContainer.Changed:connect(function()
			-- upvalues: (ref) v_u_11
			v_u_11:Fire()
		end)
		return v_u_8.Container, v30, v_u_8.HealthContainer, v29, v31
	end
	function v_u_8.CreateAccountType(_, p32) -- name: CreateAccountType
		-- upvalues: (copy) v_u_8, (ref) v_u_5, (ref) v_u_2
		v_u_8.AccountTypeContainer = v_u_5("Frame")({
			["Name"] = "AccountTypeContainer",
			["Size"] = nil,
			["Position"] = nil,
			["BorderSizePixel"] = 0,
			["BackgroundColor3"] = nil,
			["BackgroundTransparency"] = 0.5,
			["Parent"] = nil,
			["Size"] = UDim2.new(0, 50, 0, 50),
			["Position"] = UDim2.new(1, -55, 0, 10),
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["Parent"] = v_u_2
		})
		v_u_5("TextLabel")({
			["Name"] = "AccountTypeText",
			["Size"] = nil,
			["Position"] = nil,
			["BackgroundTransparency"] = 1,
			["BackgroundColor3"] = nil,
			["Font"] = nil,
			["FontSize"] = nil,
			["Text"] = nil,
			["TextColor3"] = nil,
			["BorderSizePixel"] = 0,
			["Parent"] = nil,
			["TextXAlignment"] = nil,
			["TextYAlignment"] = nil,
			["Size"] = UDim2.new(1, 0, 1, 0),
			["Position"] = UDim2.new(0, 0, 0, 0),
			["BackgroundColor3"] = Color3.new(0, 0, 0),
			["Font"] = Enum.Font.SourceSans,
			["FontSize"] = Enum.FontSize.Size36,
			["Text"] = p32,
			["TextColor3"] = Color3.new(1, 1, 1),
			["Parent"] = v_u_8.AccountTypeContainer,
			["TextXAlignment"] = Enum.TextXAlignment.Center,
			["TextYAlignment"] = Enum.TextYAlignment.Center
		})
	end
	function v_u_8.SetupTopStat(_) -- name: SetupTopStat
		-- upvalues: (ref) v_u_5, (ref) v_u_3
		local v_u_33 = true
		local v_u_34 = nil
		local v_u_35 = nil
		local v_u_36 = nil
		local v_u_37 = nil
		local v_u_38 = nil
		local function v_u_40() -- name: makeTenFootInterfaceStat
			-- upvalues: (ref) v_u_38, (ref) v_u_5
			if not v_u_38 then
				v_u_38 = v_u_5("Frame")({
					["Name"] = "OneStatFrame",
					["Size"] = nil,
					["Position"] = nil,
					["BorderSizePixel"] = 0,
					["BackgroundTransparency"] = 1,
					["Size"] = UDim2.new(1, 0, 0, 36),
					["Position"] = UDim2.new(0, 0, 0, 0)
				})
				local v39 = v_u_5("TextLabel")({
					["Name"] = "StatName",
					["Size"] = nil,
					["BackgroundTransparency"] = 1,
					["Font"] = nil,
					["FontSize"] = nil,
					["TextStrokeColor3"] = nil,
					["TextStrokeTransparency"] = 0,
					["Text"] = " StatName:",
					["TextColor3"] = nil,
					["TextXAlignment"] = nil,
					["BorderSizePixel"] = 0,
					["ClipsDescendants"] = true,
					["Parent"] = nil,
					["Size"] = UDim2.new(0.5, 0, 0, 36),
					["Font"] = Enum.Font.SourceSans,
					["FontSize"] = Enum.FontSize.Size36,
					["TextStrokeColor3"] = Color3.new(0.40784313725490196, 0.40784313725490196, 0.40784313725490196),
					["TextColor3"] = Color3.new(1, 1, 1),
					["TextXAlignment"] = Enum.TextXAlignment.Left,
					["Parent"] = v_u_38
				}):clone()
				v39.Position = UDim2.new(0.5, 0, 0, 0)
				v39.Name = "StatValue"
				v39.Text = "123,643,231"
				v39.TextXAlignment = Enum.TextXAlignment.Right
				v39.Parent = v_u_38
				addToDisplayStack(v_u_38)
			end
		end
		local v_u_41 = nil
		local function v_u_44(p42) -- name: setDisplayedStat
			-- upvalues: (ref) v_u_35, (ref) v_u_36, (ref) v_u_34, (copy) v_u_40, (ref) v_u_41
			if v_u_35 then
				v_u_35:disconnect()
				v_u_35 = nil
			end
			if v_u_36 then
				v_u_36:disconnect()
				v_u_36 = nil
			end
			v_u_34 = p42
			if v_u_34 then
				v_u_40()
				v_u_41(v_u_34)
				v_u_36 = v_u_34.AncestryChanged:connect(function()
					-- upvalues: (ref) v_u_41, (ref) v_u_34
					v_u_41(v_u_34, "Parent")
				end)
				v_u_35 = v_u_34.Changed:connect(function(p43)
					-- upvalues: (ref) v_u_41, (ref) v_u_34
					v_u_41(v_u_34, p43)
				end)
			end
		end
		v_u_41 = function(p45, p46) -- name: updateTenFootStat
			-- upvalues: (ref) v_u_38, (copy) v_u_44, (ref) v_u_33
			if p46 and p46 == "Parent" then
				v_u_38.StatName.Text = ""
				v_u_38.StatValue.Text = ""
				v_u_44(nil)
				tenFootInterfaceChanged()
				return
			elseif v_u_33 then
				local v47 = v_u_38.StatName
				local v48 = p45.Name
				v47.Text = " " .. tostring(v48) .. ":"
				local v49 = v_u_38.StatValue
				local v50 = p45.Value
				v49.Text = tostring(v50)
			else
				v_u_38.StatName.Text = ""
				v_u_38.StatValue.Text = ""
			end
		end
		local v_u_51 = v_u_3.LocalPlayer
		local v_u_52 = v_u_41
		local v_u_53 = v_u_33
		local v_u_54 = v_u_34
		local function v_u_56(p55) -- name: isValidStat
			return p55:IsA("StringValue") or p55:IsA("IntValue") or (p55:IsA("BoolValue") or p55:IsA("NumberValue") or (p55:IsA("DoubleConstrainedValue") or p55:IsA("IntConstrainedValue")))
		end
		while not v_u_51 do
			v_u_3.PlayerAdded:wait()
			v_u_51 = v_u_3.LocalPlayer
		end
		function tenFootInterfaceChanged() -- name: tenFootInterfaceChanged
			-- upvalues: (ref) v_u_51, (ref) v_u_54, (copy) v_u_56, (copy) v_u_44, (ref) v_u_37
			local v57 = v_u_51:FindFirstChild("leaderstats")
			if v57 then
				local v58 = v57:GetChildren()
				for v59 = 1, #v58 do
					local v60 = v58[v59]
					if v_u_54 or not v_u_56(v60) then
						continue
					end
					v_u_44(v60)
				end
				if v_u_37 then
					v_u_37:disconnect()
				end
				v_u_37 = v57.ChildAdded:connect(function(p61)
					-- upvalues: (ref) v_u_54, (ref) v_u_56, (ref) v_u_44
					if not v_u_54 and v_u_56(p61) then
						v_u_44(p61)
					end
				end)
			end
		end
		if v_u_51:FindFirstChild("leaderstats") then
			tenFootInterfaceChanged()
		else
			v_u_51.ChildAdded:connect(tenFootInterfaceChanged)
		end
		return {
			["SetTopStatEnabled"] = function(_, p62) -- name: SetTopStatEnabled
				-- upvalues: (ref) v_u_53, (ref) v_u_54, (ref) v_u_52
				v_u_53 = p62
				if v_u_54 then
					v_u_52(v_u_54, "")
				end
			end
		}
	end
	return v_u_8
end)()
function v7.IsEnabled(_) -- name: IsEnabled
	-- upvalues: (copy) v_u_6
	return v_u_6
end
function v7.CreateHealthBar(_) -- name: CreateHealthBar
	-- upvalues: (copy) v_u_63
	return v_u_63:CreateHealthBar()
end
function v7.CreateAccountType(_, p64) -- name: CreateAccountType
	-- upvalues: (copy) v_u_63
	return v_u_63:CreateAccountType(p64)
end
function v7.SetupTopStat(_) -- name: SetupTopStat
	-- upvalues: (copy) v_u_63
	return v_u_63:SetupTopStat()
end
return v7