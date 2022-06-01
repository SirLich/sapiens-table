--- Entrypoint for the Table Mod..
-- @author SirLich

local mod = {
	loadOrder = 1,
}

-- Requires
local logger = mjrequire "hammerstone/logging"
local buildable = mjrequire "common/buildable"

local resource = mjrequire "common/resource"
--local order = mjrequire "common/order"
local snapGroup = mjrequire "common/snapGroup"
local skill = mjrequire "common/skill"
local plan = mjrequire "common/plan"
local tool = mjrequire "common/tool"
local action = mjrequire "common/action"
local actionSequence = mjrequire "common/actionSequence"

local constructable = mjrequire "common/constructable"

local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local vec2 = mjm.vec2
local normalize = mjm.normalize
local vec3xMat3 = mjm.vec3xMat3
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate
local mat3Inverse = mjm.mat3Inverse


local gameObject = mjrequire "common/gameObject"


function mod:onload(controller)
	logger:log("Table Mod Initialized")
end



return mod