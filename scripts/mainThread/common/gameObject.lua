local mod = {
	onload = 1
}

local snapGroup = mjrequire "common/snapGroup"


local mjm = mjrequire "common/mjm"
local vec3 = mjm.vec3
local normalize = mjm.normalize
local mat3Identity = mjm.mat3Identity
local mat3Rotate = mjm.mat3Rotate

function mod:onLoad(gameObject)
	gameObject:addGameObject("build_aspenTable", {
		{
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
	})

	gameObject:addGameObject("aspenTable",
	{
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
	})
end

return mod