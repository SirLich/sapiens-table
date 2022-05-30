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

local function registerTable()


	gameObject.gameObjectsTable.build_aspenTable = {
		modelName = "aspenTable",
		scale = 1.0,
		hasPhysics = true,
		isInProgressBuildObject = true,
		preventShiftOnTerrainSurfaceModification = true,
		preventGrassAndSnow = true,
		--isPathFindingCollider = true,
		femaleSnapPoints = snapGroup.femalePoints.roofFemaleSnapPoints,
		objectViewRotationFunction = function(object) 
			return mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))
		end,
		objectViewOffsetFunction = function(object)
			return vec3(0.5,-1.5,1.0)--vec3xMat3(vec3(-0.5,-1.5,1.0), mat3Inverse(mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))))
		end,
		markerPositions = {
			{ 
				localOffset = vec3(0.0, mj:mToP(0.8), 0.0)
			},
			{ 
				localOffset = vec3(0.0, mj:mToP(-0.8), 0.0)
			}
		},
	}

	gameObject.gameObjectsTable.aspenTable = {
		modelName = "aspenTable",
		scale = 1.0,
		hasPhysics = true,
		isBuiltObject = true,
		preventShiftOnTerrainSurfaceModification = true,
		preventGrassAndSnow = true,
		isPathFindingCollider = true,
		blocksRain = false,
		femaleSnapPoints = snapGroup.femalePoints.roofFemaleSnapPoints,

		objectViewRotationFunction = function(object) 
			return mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))
		end,
		objectViewOffsetFunction = function(object)
			return vec3(0.5,-1.5,1.0)--vec3xMat3(vec3(-0.5,-1.5,1.0), mat3Inverse(mat3Rotate(mat3Identity, 0.5, normalize(vec3(0.0, 1.0, 0.0)))))
		end,
		markerPositions = {
			{ 
				localOffset = vec3(0.0, mj:mToP(0.8), 0.0)
			},
			{ 
				localOffset = vec3(0.0, mj:mToP(-0.8), 0.0)
			}
		},
	}

	buildable:addBuildable("aspenTable", {
		modelName = "aspenTable",
		inProgressGameObjectTypeKey = "build_aspenTable",
		finalGameObjectTypeKey = "aspenTable",
		name = "Aspen Table",
		plural = "Aspen Tables",
		summary = "A woody sticky two leggy table.",
		
		classification = constructable.classifications.build.index,
		
		skills = {
			required = skill.types.thatchBuilding.index,
		},
		
		allowYTranslation = true,
		allowXZRotation = true,
	
		buildSequence = clearObjectsAndTerrainSequence,
		
		maleSnapPoints = snapGroup.malePoints.roofMaleSnapPoints,
	
		requiredResources = {
			{
				type = resource.types.log.index,
				count = 2,
				afterAction = {
					actionTypeIndex = action.types.inspect.index,
					durationWithoutSkill = 10.0,
				}
			},
			{
				type = resource.types.splitLog.index,
				count = 1,
				afterAction = {
					actionTypeIndex = action.types.inspect.index,
					durationWithoutSkill = 10.0,
				}
			},
		}
	})
end

function mod:onload(controller)
	logger:log("Table Mod Initialized")

	registerTable()
end



return mod