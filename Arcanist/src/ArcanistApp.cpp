#include <Arc.h>
#include <Arc/Core/EntryPoint.h>

#include "Platform/OpenGL/OpenGLShader.h"
#include "EditorLayer.h"

namespace ArcEngine {



	class Arcanist : public Application
	{
	public:
		Arcanist()
			: Application("Arcanist")
		{
			//PushLayer(new ExampleLayer());
			PushLayer(new EditorLayer());
		}
		~Arcanist()
		{

		}
	};

	Application* CreateApplication()
	{
		return new Arcanist();
	}

}