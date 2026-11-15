-- Path: CoreGui.RobloxGui.Modules.PlayerList.Components.Connection.ScreenSizeConnector
local v1 = game:GetService("CorePackages")
local v_u_2 = require(v1.Packages.Roact)
local v3 = require(v1.Packages.RoactRodux)
local v4 = script.Parent.Parent.Parent
local v_u_5 = require(v4.Actions.SetScreenSize)
local v_u_6 = require(script.Parent.EventConnection)
local v7 = v_u_2.PureComponent:extend("ScreenSizeConnector")
function v7.init(p8) -- name: init
	-- upvalues: (copy) v_u_2
	p8.state = {
		["layerCollector"] = nil
	}
	p8.folderRef = v_u_2.createRef()
end
function v7.render(p_u_9) -- name: render
	-- upvalues: (copy) v_u_2, (copy) v_u_6
	if not p_u_9.state.layerCollector then
		return v_u_2.createElement("Folder", {
			[v_u_2.Ref] = p_u_9.folderRef
		})
	end
	local v_u_10 = p_u_9.state.layerCollector.AbsoluteSize
	p_u_9.props.setScreenSize(v_u_10.X, v_u_10.Y)
	return v_u_2.createElement(v_u_6, {
		["event"] = p_u_9.state.layerCollector:GetPropertyChangedSignal("AbsoluteSize"),
		["callback"] = function() -- name: callback
			-- upvalues: (ref) v_u_10, (copy) p_u_9
			v_u_10 = p_u_9.state.layerCollector.AbsoluteSize
			p_u_9.props.setScreenSize(v_u_10.X, v_u_10.Y)
		end
	})
end
function v7.watchFolderAncestery(p_u_11) -- name: watchFolderAncestery
	if p_u_11.folderRef.current and p_u_11.ancesteryConnection == nil then
		local v_u_12 = p_u_11.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
		if v_u_12 then
			p_u_11:setState({
				["layerCollector"] = v_u_12
			})
		else
			p_u_11.ancesteryConnection = p_u_11.folderRef.current.AncestryChanged:Connect(function()
				-- upvalues: (copy) p_u_11, (ref) v_u_12
				v_u_12 = p_u_11.folderRef.current and p_u_11.folderRef.current:FindFirstAncestorWhichIsA("LayerCollector")
				if v_u_12 then
					p_u_11:setState({
						["layerCollector"] = v_u_12
					})
				end
			end)
		end
	end
end
function v7.didMount(p13) -- name: didMount
	p13:watchFolderAncestery()
end
function v7.didUpdate(p14) -- name: didUpdate
	if p14.state.layerCollector then
		if p14.ancesteryConnection then
			p14.ancesteryConnection:Disconnect()
			p14.ancesteryConnection = nil
		end
	else
		p14:watchFolderAncestery()
	end
end
function v7.willUnmount(p15) -- name: willUnmount
	if p15.ancesteryConnection then
		p15.ancesteryConnection:Disconnect()
		p15.ancesteryConnection = nil
	end
end
return v3.connect(nil, function(p_u_16) -- name: mapDispatchToProps
	-- upvalues: (copy) v_u_5
	return {
		["setScreenSize"] = function(p17, p18) -- name: setScreenSize
			-- upvalues: (copy) p_u_16, (ref) v_u_5
			return p_u_16(v_u_5(p17, p18))
		end
	}
end)(v7)