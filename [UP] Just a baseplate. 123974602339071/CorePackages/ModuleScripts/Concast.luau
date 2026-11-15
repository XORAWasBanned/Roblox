-- Path: CorePackages.Packages._Index.ApolloClient.ApolloClient.utilities.observables.Concast
-- https://lua.expert

local t1 = {}
local ParentParent = script.Parent.Parent.Parent.Parent
local LuauPolyfill = require(ParentParent.LuauPolyfill)
local Boolean, Set, Array, Error = LuauPolyfill.Boolean, LuauPolyfill.Set, LuauPolyfill.Array, LuauPolyfill.Error
local Promise = require(ParentParent.Promise)
local t2 = {}
local Observable = require(script.Parent.Observable).Observable
local iterateObserversSafely = require(script.Parent.iteration).iterateObserversSafely
local fixObservableSubclass = require(script.Parent.subclassing).fixObservableSubclass

local function isPromiseLike(p1) -- line: 50
    -- upvalues: Boolean (copy)
    local v1 = Boolean.toJSBoolean(p1)

    v1 = v1 and typeof(p1.andThen) == "function"

    return v1
end

local self = setmetatable({}, {
    __index = Observable
})

self.__index = self

function self.new(p2) -- line: 125
    -- upvalues: Boolean (copy), Set (copy), Promise (copy), t2 (copy), Observable (copy), iterateObserversSafely (copy), self (copy)
    local v3

    v3 = setmetatable(Observable.new(function(p3) -- line: 129
        -- upvalues: v3 (ref)
        v3:addObserver(p3)

        return function() -- line: 131
            -- upvalues: p3 (copy), v3 (ref)
            return v3:removeObserver(p3)
        end
    end), self)

    local v5 = Set.new()

    v3.observers = v5
    v3.sub = t2
    v3.source = {}
    v3.latest = nil
    v3.addCount = 0
    v3.promise = Promise.new(function(p4, p5) -- line: 163
        -- upvalues: v3 (ref)
        local v6 = v3

        v6.resolve = function(_, ...) -- line: 164
            -- upvalues: p4 (copy)
            p4(...)
        end

        v6.reject = function(_, ...) -- line: 167
            -- upvalues: p5 (copy)
            p5(...)
        end
    end)
    v3.handlers = {
        next = function(_, p9) -- next | line: 175
            -- upvalues: v3 (ref), iterateObserversSafely (copy)
            if v3.sub == nil then
                return
            end

            local v7 = v3

            v7.latest = { "next", p9 }
            iterateObserversSafely(v3.observers, "next", p9)
        end,
        error = function(_, p11) -- error | line: 181
            -- upvalues: v3 (ref), Boolean (copy), Promise (copy), iterateObserversSafely (copy)
            local sub = v3.sub

            if sub == nil then
                return
            end

            if Boolean.toJSBoolean(sub) then
                Promise.delay(0):andThen(function() -- line: 188
                    -- upvalues: sub (copy)
                    return sub:unsubscribe()
                end)
            end

            local v8 = v3

            v8.sub = nil
            v8.latest = { "error", p11 }
            v8:reject(p11)
            iterateObserversSafely(v3.observers, "error", p11)
        end,
        complete = function(_) -- complete | line: 198
            -- upvalues: v3 (ref), Boolean (copy), iterateObserversSafely (copy)
            if v3.sub == nil then
                return
            end

            local v9 = table.remove(v3.sources, 1)

            if not Boolean.toJSBoolean(v9) then
                v3.sub = nil

                if v3.latest == nil or v3.latest[1] ~= "next" then
                    v3:resolve()
                else
                    local v10 = v3

                    v10:resolve(v3.latest[2])
                end

                iterateObserversSafely(v3.observers, "complete")
            else
                local v11 = Boolean.toJSBoolean(v9)

                v11 = v11 and typeof(v9.andThen) == "function"

                if v11 then
                    v9:andThen(function(p13) -- line: 216
                        -- upvalues: v3 (ref)
                        v3.sub = p13:subscribe(v3.handlers)
                    end)
                else
                    local v13 = v3

                    v13.sub = v9:subscribe(v3.handlers)
                end
            end
        end
    }

    v3.cancel = function(_, p15) -- line: 227
        -- upvalues: v3 (ref)
        local v14 = v3

        v14:reject(p15)
        v14.sources = {}
        v3.handlers:complete()
    end

    v3.promise:catch(function() -- line: 236
    end)

    local v15 = if typeof(p2) == "function" then { Observable.new(p2) } else p2
    local v16 = Boolean.toJSBoolean(v15)

    v16 = v16 and typeof(v15.andThen) == "function"

    if v16 then
        v15:andThen(function(p16) -- line: 246
            -- upvalues: v3 (ref)
            v3:start(p16)
        end, function(...) -- line: 248
            -- upvalues: v3 (ref)
            v3.handlers:error(...)
        end)
    else
        v3:start(v15)
    end

    return v3
end

function self.start(p17, p18) -- line: 261
    -- upvalues: Array (copy), t2 (copy)
    if p17.sub == t2 then
        p17.sources = Array.from(p18)
        p17.handlers:complete()
    end
end

function self.deliverLastMessage(p19, p20) -- line: 278
    -- upvalues: Boolean (copy)
    if Boolean.toJSBoolean(p19.latest) then
        local v17 = p19.latest[1]
        local v18 = p20[v17]

        if Boolean.toJSBoolean(v18) then
            v18(p20, p19.latest[2])
        end

        if p19.sub == nil and v17 == "next" and p20.complete ~= nil then
            p20.complete(p20)
        end
    end
end

function self.addObserver(p21, p22) -- line: 296
    if p21.observers:has(p22) then
        return
    end

    p21:deliverLastMessage(p22)
    p21.observers:add(p22)
    p21.addCount += 1
end

function self.removeObserver(p23, p24, p25) -- line: 306
    -- upvalues: Error (copy)
    if p23.observers:delete(p24) then
        p23.addCount -= 1

        if p23.addCount < 1 and not p25 then
            p23.handlers:error(Error.new("Observable cancelled prematurely"))
        end
    end
end

function self.cleanup(p26, p27) -- line: 322
    local v19 = false
    local t5

    local function once() -- line: 325
        -- upvalues: p26 (copy), p27 (copy), v19 (ref), t5 (ref)
        if v19 then
            return
        end

        v19 = true

        local observers = p26.observers

        observers:delete(t5)
        p27()
    end

    t5 = {
        next = once,
        error = once,
        complete = once
    }

    local addCount = p26.addCount

    p26:addObserver(t5)
    p26.addCount = addCount
end

function self.of(...) -- line: 345
    -- upvalues: Observable (copy), self (copy)
    return Observable.of(self, ...)
end

function self.from(...) -- line: 349
    -- upvalues: Observable (copy), self (copy)
    return Observable.from(self, ...)
end

t1.Concast = self
fixObservableSubclass(self)

return t1
