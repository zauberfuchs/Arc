#pragma once

#include <iostream>
#include <memory>
#include <utility>
#include <algorithm>
#include <functional>

#include <array>
#include <string>
#include <sstream>
#include <vector>
#include <unordered_map>
#include <unordered_set>

#include "Arc/Core/Core.h"
#include "Arc/Core/Log.h"
#include "Arc/Debug/Instrumentor.h"

#ifdef ARC_PLATFORM_WINDOWS
	#include <Windows.h>	
#endif