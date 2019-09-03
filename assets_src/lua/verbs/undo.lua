local Wargroove = require "wargroove/wargroove"
local Verb = require "wargroove/verb"
local saveState = require "saveState"

local Undo = Verb:new()
Undo.id = "undo"

function Undo:canExecuteAnywhere(unit)
    return saveState:canLoad(unit.playerId)
end

function Undo:execute(unit, targetPos, strParam, path)
    saveState:load(unit.playerId)
end

return Undo
