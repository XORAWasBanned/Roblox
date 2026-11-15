-- Path: CoreGui.RobloxGui.Modules.DevConsole.Components.VoiceDebug.VoiceDebugFieldMeta
-- https://lua.expert

local t1 = {
    warn = 150,
    error = 300
}
local t2 = {
    warn = 30,
    error = 50
}
local t3 = {
    warn = 60,
    error = 150
}
local t4 = {
    warn = 3,
    error = 1e999
}
local t5

local function getFieldSeverity(p1, p2) -- line: 32
    -- upvalues: t5 (ref)
    local v1 = t5[p1]
    local v2 = v1 and v1.thresholds

    if not v2 or type(p2) ~= "number" then
        return nil
    end

    if v2.error <= p2 then
        return "error"
    end

    if v2.warn <= p2 then
        return "warn"
    end

    return "ok"
end

t5 = {
    rttMs = {
        label = "Round-trip time",
        unit = "ms",
        plottable = true,
        group = "Connection",
        thresholds = t1
    },
    incomingStreams = {
        label = "Incoming streams",
        group = "Connection"
    },
    outgoingStreams = {
        label = "Outgoing streams",
        group = "Connection"
    },
    incomingJitterMs = {
        label = "Incoming jitter",
        unit = "ms",
        plottable = true,
        group = "Incoming",
        thresholds = t2
    },
    outgoingJitterMs = {
        label = "Outgoing jitter",
        unit = "ms",
        plottable = true,
        group = "Outgoing",
        thresholds = t2
    },
    incomingPackets = {
        label = "Incoming packets",
        group = "Incoming"
    },
    outgoingPackets = {
        label = "Outgoing packets",
        group = "Outgoing"
    },
    incomingPacketsLost = {
        label = "Incoming packets lost",
        group = "Incoming"
    },
    outgoingPacketsLost = {
        label = "Outgoing packets lost",
        group = "Outgoing"
    },
    incomingPacketsDiscarded = {
        label = "Incoming packets discarded",
        group = "Incoming"
    },
    outgoingPacketsDiscarded = {
        label = "Outgoing packets discarded",
        group = "Outgoing"
    },
    jitterBufferDelayMs = {
        label = "Jitter buffer delay",
        unit = "ms",
        group = "Incoming",
        thresholds = t3
    },
    incomingFecPackets = {
        label = "Incoming FEC packets",
        group = "Incoming"
    },
    incomingFecPacketsDiscarded = {
        label = "Incoming FEC packets discarded",
        group = "Incoming"
    },
    totalConcealmentEvents = {
        label = "Concealment events",
        group = "Incoming"
    },
    incomingBytes = {
        label = "Incoming bytes",
        group = "Incoming"
    },
    outgoingBytes = {
        label = "Outgoing bytes",
        group = "Outgoing"
    },
    lastPublisherAudioLevelDbov = {
        label = "Publisher audio level",
        unit = "dBov",
        group = "Outgoing"
    },
    lastSubscriberAudioLevelDbov = {
        label = "Subscriber audio level",
        unit = "dBov",
        group = "Incoming"
    },
    incomingBitrateKbps = {
        label = "Incoming bitrate",
        unit = "kbps",
        plottable = true,
        group = "Incoming"
    },
    outgoingBitrateKbps = {
        label = "Outgoing bitrate",
        unit = "kbps",
        plottable = true,
        group = "Outgoing"
    },
    outgoingCodec = {
        label = "Outgoing codec",
        group = "Outgoing"
    },
    incomingLossPercent = {
        label = "Incoming loss",
        unit = "%",
        plottable = true,
        group = "Incoming",
        thresholds = t4
    },
    getFieldSeverity = getFieldSeverity
}

return t5
