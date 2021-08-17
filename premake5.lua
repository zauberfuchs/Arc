workspace "Arc"
	architecture "x64"
	startproject "Sandbox"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"


--Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "Arc/vendor/GLFW/include"
IncludeDir["Glad"] = "Arc/vendor/Glad/include"
IncludeDir["ImGui"] = "Arc/vendor/imgui"
IncludeDir["glm"] = "Arc/vendor/glm"

group "Dependencies"
include "Arc/vendor/GLFW"
include "Arc/vendor/Glad"
include "Arc/vendor/imgui"

group ""

project "Arc"
	location "Arc"
	kind "StaticLib"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	pchheader "apch.h"
	pchsource "Arc/src/apch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
	}

	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"ARC_PLATFORM_WINDOWS",
			"ARC_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}

		-- postbuildcommands
		-- {
		-- 	("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
		-- }

		
		filter "configurations:Debug"
			defines "ARC_DEBUG"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
			defines "ARC_RELEASE"
			runtime "Release"
			optimize "on"

		filter "configurations:Dist"
			defines "ARC_DIST"
			runtime "Release"
			optimize "on"

project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "on"


	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}

	includedirs
	{
		"Arc/vendor/spdlog/include",
		"Arc/src",
		"Arc/vendor",
		"%{IncludeDir.glm}"
	}

	links
	{
		"Arc"
	}

	filter "system:windows"
		systemversion "latest"

		defines
		{
			"ARC_PLATFORM_WINDOWS"
		}
		
		filter "configurations:Debug"
			defines "ARC_DEBUG"
			runtime "Debug"
			symbols "on"

		filter "configurations:Release"
			defines "ARC_RELEASE"
			runtime "Release"
			optimize "on"

		filter "configurations:Dist"
			defines "ARC_DIST"
			runtime "Release"
			optimize "on"