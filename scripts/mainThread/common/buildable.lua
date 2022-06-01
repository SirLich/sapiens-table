local resource = mjrequire "common/resource"
local snapGroup = mjrequire "common/snapGroup"
local skill = mjrequire "common/skill"
local action = mjrequire "common/action"
local constructable = mjrequire "common/constructable"


local mod = {
	loadOrder = 1
}

function mod:onload(buildable)


	-- Equivalent to 'buildable:addBuildable("aspenTable", ...)'
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


return mod
