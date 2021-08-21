--include "./vendor/premake/premake_customization/solution_items.lua"

workspace "Arc"
	architecture "x86_64"
	startproject "Arcanist"

	configurations
	{
		"Debug",
		"Release",
		"Dist"	
	}


	flags
	{
		"MultiProcessorCompile"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


--Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "%{wks.location}/Arc/vendor/GLFW/include"
IncludeDir["Glad"] = "%{wks.location}/Arc/vendor/Glad/include"
IncludeDir["ImGui"] = "%{wks.location}/Arc/vendor/imgui"
IncludeDir["glm"] = "%{wks.location}/Arc/vendor/glm"
IncludeDir["stb_image"] = "%{wks.location}/Arc/vendor/stb_image"
IncludeDir["entt"] = "%{wks.location}/Arc/vendor/entt/include"

group "Dependencies"
--include "vendor/premake"
include "Arc/vendor/GLFW"
include "Arc/vendor/Glad"
include "Arc/vendor/imgui"
group ""

include "Arc"
include "Sandbox"
include "Arcanist"