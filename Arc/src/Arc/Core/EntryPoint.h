#pragma once

#ifdef ARC_PLATFORM_WINDOWS

extern ArcEngine::Application* ArcEngine::CreateApplication();

int main(int argc, char** argv)
{
	ArcEngine::Log::Init();

	ARC_PROFILE_BEGIN_SESSION("Startup", "ArcProfile-Startup.json");
	auto app = ArcEngine::CreateApplication();
	ARC_PROFILE_END_SESSION();

	ARC_PROFILE_BEGIN_SESSION("Runtime", "ArcProfile-Runtime.json");
	app->Run();
	ARC_PROFILE_END_SESSION();

	ARC_PROFILE_BEGIN_SESSION("Shutdown", "ArcProfile-Shutdown.json");
	delete app;
	ARC_PROFILE_END_SESSION();
}
#endif