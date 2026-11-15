-- Path: CoreGui.RobloxGui.Modules.EmotesMenu.Utility.CanPlayEmotes
local v1 = game:GetService("Players")
local v_u_2 = v1.LocalPlayer
if not v_u_2 then
	v1:GetPropertyChangedSignal("LocalPlayer"):Wait()
	v_u_2 = v1.LocalPlayer
end
local v_u_3 = {
	["Value"] = false,
	["ChangedEvent"] = nil,
	["ChangedEvent"] = Instance.new("BindableEvent")
}
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
v_u_7 = function(p8, p_u_9)
	-- upvalues: (ref) v_u_4, (ref) v_u_5, (ref) v_u_6, (copy) v_u_3, (ref) v_u_7
	if v_u_4 then
		v_u_4:Disconnect()
		v_u_4 = nil
	end
	if v_u_5 then
		v_u_5:Disconnect()
		v_u_5 = nil
	end
	if v_u_6 then
		v_u_6:Disconnect()
		v_u_6 = nil
	end
	if p_u_9 then
		if p8 then
			local v10
			if p_u_9 then
				v10 = p_u_9:FindFirstChild("Animate")
				if not (v10 and v10:IsA("LocalScript")) then
					if not v10 or (not v10:IsA("Script") or v10.RunContext ~= Enum.RunContext.Client) then
						v10 = nil
					end
				end
			else
				v10 = nil
			end
			local v_u_11
			if v10 then
				v_u_11 = v10:FindFirstChild("PlayEmote")
				if not (v_u_11 and v_u_11:IsA("BindableFunction")) then
					v_u_11 = nil
				end
			else
				v_u_11 = nil
			end
			if v_u_11 then
				v_u_6 = v_u_11.AncestryChanged:Connect(function(_, p12)
					-- upvalues: (copy) v_u_11, (copy) p_u_9, (ref) v_u_3, (ref) v_u_7
					if not (p12 and v_u_11:IsDescendantOf(p_u_9)) then
						local v13 = p_u_9
						local v14
						if v13 then
							v14 = v13:FindFirstChild("Animate")
							if not (v14 and v14:IsA("LocalScript")) then
								if not v14 or (not v14:IsA("Script") or v14.RunContext ~= Enum.RunContext.Client) then
									v14 = nil
								end
							end
						else
							v14 = nil
						end
						local v15
						if v14 then
							v15 = v14:FindFirstChild("PlayEmote")
							if not (v15 and v15:IsA("BindableFunction")) then
								v15 = nil
							end
						else
							v15 = nil
						end
						local v16 = v15 ~= nil
						if v_u_3.Value ~= v16 then
							v_u_3.Value = v16
							v_u_3.ChangedEvent:Fire(v16)
						end
						v_u_7(v16, v13)
					end
				end)
			else
				local v17
				if p_u_9 then
					v17 = p_u_9:FindFirstChild("Animate")
					if not (v17 and v17:IsA("LocalScript")) then
						if not v17 or (not v17:IsA("Script") or v17.RunContext ~= Enum.RunContext.Client) then
							v17 = nil
						end
					end
				else
					v17 = nil
				end
				local v18
				if v17 then
					v18 = v17:FindFirstChild("PlayEmote")
					if not (v18 and v18:IsA("BindableFunction")) then
						v18 = nil
					end
				else
					v18 = nil
				end
				local v19 = v18 ~= nil
				if v_u_3.Value ~= v19 then
					v_u_3.Value = v19
					v_u_3.ChangedEvent:Fire(v19)
				end
				v_u_7(v19, p_u_9)
			end
		else
			local v20
			if p_u_9 then
				v20 = p_u_9:FindFirstChild("Animate")
				if not (v20 and v20:IsA("LocalScript")) then
					if not v20 or (not v20:IsA("Script") or v20.RunContext ~= Enum.RunContext.Client) then
						v20 = nil
					end
				end
			else
				v20 = nil
			end
			if v20 then
				local v21
				if p_u_9 then
					v21 = p_u_9:FindFirstChild("Animate")
					if not (v21 and v21:IsA("LocalScript")) then
						if not v21 or (not v21:IsA("Script") or v21.RunContext ~= Enum.RunContext.Client) then
							v21 = nil
						end
					end
				else
					v21 = nil
				end
				local v22
				if v21 then
					v22 = v21:FindFirstChild("PlayEmote")
					if not (v22 and v22:IsA("BindableFunction")) then
						v22 = nil
					end
				else
					v22 = nil
				end
				if v22 then
					local v23
					if p_u_9 then
						v23 = p_u_9:FindFirstChild("Animate")
						if not (v23 and v23:IsA("LocalScript")) then
							if not v23 or (not v23:IsA("Script") or v23.RunContext ~= Enum.RunContext.Client) then
								v23 = nil
							end
						end
					else
						v23 = nil
					end
					local v24
					if v23 then
						v24 = v23:FindFirstChild("PlayEmote")
						if not (v24 and v24:IsA("BindableFunction")) then
							v24 = nil
						end
					else
						v24 = nil
					end
					local v25 = v24 ~= nil
					if v_u_3.Value ~= v25 then
						v_u_3.Value = v25
						v_u_3.ChangedEvent:Fire(v25)
					end
					v_u_7(v25, p_u_9)
				else
					v_u_5 = v20.ChildAdded:Connect(function(p26)
						-- upvalues: (copy) p_u_9, (ref) v_u_3, (ref) v_u_7
						if p26:IsA("BindableFunction") and p26.Name == "PlayEmote" then
							local v27 = p_u_9
							local v28
							if v27 then
								v28 = v27:FindFirstChild("Animate")
								if not (v28 and v28:IsA("LocalScript")) then
									if not v28 or (not v28:IsA("Script") or v28.RunContext ~= Enum.RunContext.Client) then
										v28 = nil
									end
								end
							else
								v28 = nil
							end
							local v29
							if v28 then
								v29 = v28:FindFirstChild("PlayEmote")
								if not (v29 and v29:IsA("BindableFunction")) then
									v29 = nil
								end
							else
								v29 = nil
							end
							local v30 = v29 ~= nil
							if v_u_3.Value ~= v30 then
								v_u_3.Value = v30
								v_u_3.ChangedEvent:Fire(v30)
							end
							v_u_7(v30, v27)
						end
					end)
				end
			else
				local v31
				if p_u_9 then
					v31 = p_u_9:FindFirstChild("Animate")
					if not (v31 and v31:IsA("LocalScript")) then
						if not v31 or (not v31:IsA("Script") or v31.RunContext ~= Enum.RunContext.Client) then
							v31 = nil
						end
					end
				else
					v31 = nil
				end
				if v31 then
					local v32
					if p_u_9 then
						v32 = p_u_9:FindFirstChild("Animate")
						if not (v32 and v32:IsA("LocalScript")) then
							if not v32 or (not v32:IsA("Script") or v32.RunContext ~= Enum.RunContext.Client) then
								v32 = nil
							end
						end
					else
						v32 = nil
					end
					local v33
					if v32 then
						v33 = v32:FindFirstChild("PlayEmote")
						if not (v33 and v33:IsA("BindableFunction")) then
							v33 = nil
						end
					else
						v33 = nil
					end
					local v34 = v33 ~= nil
					if v_u_3.Value ~= v34 then
						v_u_3.Value = v34
						v_u_3.ChangedEvent:Fire(v34)
					end
					v_u_7(v34, p_u_9)
				else
					v_u_4 = p_u_9.ChildAdded:Connect(function(p35)
						-- upvalues: (copy) p_u_9, (ref) v_u_3, (ref) v_u_7
						local v36 = not p35:IsA("LocalScript") and p35:IsA("Script")
						if v36 then
							v36 = p35.RunContext == Enum.RunContext.Client
						end
						if v36 and p35.Name == "Animate" then
							local v37 = p_u_9
							local v38
							if v37 then
								v38 = v37:FindFirstChild("Animate")
								if not (v38 and v38:IsA("LocalScript")) then
									if not v38 or (not v38:IsA("Script") or v38.RunContext ~= Enum.RunContext.Client) then
										v38 = nil
									end
								end
							else
								v38 = nil
							end
							local v39
							if v38 then
								v39 = v38:FindFirstChild("PlayEmote")
								if not (v39 and v39:IsA("BindableFunction")) then
									v39 = nil
								end
							else
								v39 = nil
							end
							local v40 = v39 ~= nil
							if v_u_3.Value ~= v40 then
								v_u_3.Value = v40
								v_u_3.ChangedEvent:Fire(v40)
							end
							v_u_7(v40, v37)
						end
					end)
				end
			end
		end
	else
		return
	end
end
v_u_2:GetPropertyChangedSignal("Character"):Connect(function()
	-- upvalues: (ref) v_u_2, (ref) v_u_4, (ref) v_u_5, (ref) v_u_6, (copy) v_u_3, (ref) v_u_7
	local v41 = v_u_2.Character
	if v_u_4 then
		v_u_4:Disconnect()
		v_u_4 = nil
	end
	if v_u_5 then
		v_u_5:Disconnect()
		v_u_5 = nil
	end
	if v_u_6 then
		v_u_6:Disconnect()
		v_u_6 = nil
	end
	local v42
	if v41 then
		v42 = v41:FindFirstChild("Animate")
		if not (v42 and v42:IsA("LocalScript")) then
			if not v42 or (not v42:IsA("Script") or v42.RunContext ~= Enum.RunContext.Client) then
				v42 = nil
			end
		end
	else
		v42 = nil
	end
	local v43
	if v42 then
		v43 = v42:FindFirstChild("PlayEmote")
		if not (v43 and v43:IsA("BindableFunction")) then
			v43 = nil
		end
	else
		v43 = nil
	end
	local v44 = v43 ~= nil
	if v_u_3.Value ~= v44 then
		v_u_3.Value = v44
		v_u_3.ChangedEvent:Fire(v44)
	end
	v_u_7(v44, v41)
end)
local v45 = v_u_2.Character
if v_u_4 then
	v_u_4:Disconnect()
	v_u_4 = nil
end
if v_u_5 then
	v_u_5:Disconnect()
	v_u_5 = nil
end
if v_u_6 then
	v_u_6:Disconnect()
	v_u_6 = nil
end
local v46
if v45 then
	v46 = v45:FindFirstChild("Animate")
	if not (v46 and v46:IsA("LocalScript")) then
		if not v46 or (not v46:IsA("Script") or v46.RunContext ~= Enum.RunContext.Client) then
			v46 = nil
		end
	end
else
	v46 = nil
end
local v47
if v46 then
	v47 = v46:FindFirstChild("PlayEmote")
	if not (v47 and v47:IsA("BindableFunction")) then
		v47 = nil
	end
else
	v47 = nil
end
local v48 = v47 ~= nil
if v_u_3.Value ~= v48 then
	v_u_3.Value = v48
	v_u_3.ChangedEvent:Fire(v48)
end
v_u_7(v48, v45)
return v_u_3