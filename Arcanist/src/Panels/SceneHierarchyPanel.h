#pragma once

#include "Arc/Core/Core.h"
#include "Arc/Core/Log.h"
#include "Arc/Scene/Scene.h"
#include "Arc/Scene/Entity.h"

namespace ArcEngine {

	class SceneHierarchyPanel
	{
	public:
		SceneHierarchyPanel() = default;
		SceneHierarchyPanel(const Ref<Scene>& scene);

		void SetContext(const Ref<Scene>& scene);

		void OnImGuiRender();
	private:
		void DrawEntityNode(Entity entity);
	private:
		Ref<Scene> m_Context;
		Entity m_SelectionContext;
	};

}
