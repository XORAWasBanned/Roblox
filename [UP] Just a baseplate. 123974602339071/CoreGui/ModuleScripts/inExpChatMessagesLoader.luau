-- Path: CoreGui.RobloxGui.Modules.AbuseReportMenu.V2.inExpChatMessagesLoader
local v1 = game:GetService("CorePackages")
local v2 = game:GetService("LocalizationService")
local v_u_3 = game:GetService("Players")
local v4 = require(v1.Workspace.Packages.ExpChat)
local v_u_5 = require(v1.Workspace.Packages.ExpChatShared)
local v6 = require(v1.Workspace.Packages.InExperienceLocales).Localization
local v_u_7 = require(v1.Packages.Promise)
local v8 = require(v1.Workspace.Packages.SharedFlags)
local v_u_9 = require(script.Parent.ExpChatMessageHelpers)
local v_u_10 = require(script.Parent.inExpChatMessagesLoaderUsernameEnrichment).enrichMissingUsernames
local v_u_11 = v_u_5.ChannelTabDisplayLabel
local v_u_12 = v4.Stores.GetChannelTabsStore
local v_u_13 = v8.FFlagExpChatUseChannelTabsStore
local v_u_14 = v8.FFlagExpChatUseSharedChannelTabDisplayLabel
local v_u_15 = v6.new(v2.RobloxLocaleId)
local function v_u_17() -- name: getLocalizedChannelTabLabels
	-- upvalues: (copy) v_u_11, (copy) v_u_15
	local v16 = v_u_11.LocalizationKeys
	return {
		["yourServer"] = v_u_15:Format(v16.yourServer),
		["moreServers"] = v_u_15:Format(v16.moreServers),
		["friends"] = v_u_15:Format(v16.friends),
		["system"] = v_u_15:Format(v16.system),
		["team"] = v_u_15:Format(v16.team)
	}
end
return {
	["type"] = "groupedListItem",
	["fetch"] = nil,
	["fetch"] = function(_) -- name: fetch
		-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_9, (copy) v_u_15, (copy) v_u_14, (copy) v_u_11, (copy) v_u_10, (copy) v_u_12, (copy) v_u_17, (copy) v_u_13, (copy) v_u_3
		local v18 = v_u_5.context.store
		if v18 then
			local v19 = v18:getState()
			local v20 = v_u_5.context.messagesStore
			if v20 then
				local v21 = v20.getByMessageId(false) or {}
				local v22 = v20.getWindowMessagesInOrder(false) or {}
				local v23 = v20.getWindowMessagesInOrderByTabId(false) or {}
				local v24 = v_u_5.context.translator
				if v_u_9.areChannelTabsEnabled() then
					local v25 = v19.TextChannels and (v19.TextChannels.allTextChannels or {}) or {}
					local v_u_26 = v_u_12(false).getChannelTabsState(false).allChannelTabs
					local v27
					if v_u_14 then
						v27 = v_u_17()
					else
						v27 = nil
					end
					local v28 = {}
					local v29 = {}
					for v30, v31 in pairs(v23) do
						local v32 = v_u_9.collectItems(v21, v31)
						if #v32 <= 0 then
							continue
						end
						local v33
						if v_u_14 then
							local v34
							if v_u_13 then
								local v35 = v_u_26[v30]
								if v35 then
									v34 = v35.type
								else
									v34 = nil
								end
							else
								local v36 = v19.ChannelTabs
								if v36 then
									v36 = v19.ChannelTabs.allChannelTabs
								end
								if v36 then
									v36 = v36[v30]
								end
								if v36 then
									v34 = v36.Type
								else
									v34 = nil
								end
							end
							if v34 then
								v33 = v_u_11.getDisplayLabel(v34, v30, v25[v30], v_u_3.LocalPlayer, v27)
							else
								v33 = v30
							end
						else
							v33 = v_u_9.localizeString(v24, v_u_9.formatChannelLabel(v30, v25[v30]))
						end
						table.insert(v28, v30)
						v29[v30] = {
							["id"] = v30,
							["label"] = v33,
							["items"] = v32
						}
					end
					table.sort(v28, function(p37, p38)
						-- upvalues: (copy) v_u_26, (ref) v_u_9
						local v39 = v_u_26[p37]
						local v40 = v_u_26[p38]
						if v39 and v40 then
							return v39.tabIndex < v40.tabIndex
						elseif v39 then
							return true
						elseif v40 then
							return false
						elseif p37 == v_u_9.CHANNEL_GENERAL then
							return true
						elseif p38 == v_u_9.CHANNEL_GENERAL then
							return false
						else
							return p37 < p38
						end
					end)
					local v41 = {}
					for _, v42 in ipairs(v28) do
						local v43 = v29[v42]
						table.insert(v41, v43)
					end
					return v_u_10(v41)
				else
					local v44 = {}
					local v45 = {}
					for _, v46 in ipairs(v22) do
						local v47 = v21[v46]
						if not v47 then
							continue
						end
						if v47.textChannel then
							table.insert(v44, v46)
						else
							table.insert(v45, v46)
						end
					end
					local v48 = {}
					local v49 = v_u_9.collectItems(v21, v44)
					v_u_9.annotateWhisperItems(v49, v21, v_u_15:Format("Feature.ReportAbuse.Label.SentPrivately"))
					if #v49 > 0 then
						local v50 = {
							["id"] = v_u_9.CHANNEL_GENERAL,
							["label"] = v_u_15:Format(not v_u_14 and "CoreScripts.TextChat.ChannelTabs.Here" or v_u_11.LocalizationKeys.yourServer),
							["items"] = v49
						}
						table.insert(v48, v50)
					end
					local v51 = v_u_9.collectItems(v21, v45)
					if #v51 > 0 then
						local v52 = {
							["id"] = v_u_9.CHANNEL_GLOBAL,
							["label"] = v_u_15:Format("CoreScripts.TextChat.ChannelTabs.Global2"),
							["items"] = v51
						}
						table.insert(v48, v52)
					end
					return v_u_10(v48)
				end
			else
				return v_u_7.resolve({})
			end
		else
			return v_u_7.resolve({})
		end
	end
}