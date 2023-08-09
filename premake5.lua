-- premake5.lua

-- Define your project information
workspace "Arkanoid"
    configurations { "Debug", "Release" }
    platforms { "x86", "x64" }

project "Arkanoid"
    kind "ConsoleApp"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "obj/%{cfg.buildcfg}"

    files { "src/**.cpp", "src/**.h" }

    includedirs { "src", "sfml/include", "dummy" } -- Add the src directory, SFML include, and dummy directories to the include path

    libdirs { "sfml/lib" }
    links { "sfml-system", "sfml-window", "sfml-graphics", "sfml-audio", "sfml-network" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    filter "platforms:x64"
        architecture "x64"

    -- Additional configurations for macOS to resolve SFML header include issue
    filter { "system:macosx" }
        xcodebuildsettings { ["CLANG_CXX_LANGUAGE_STANDARD"] = "c++14" }
        buildoptions { "-Fsfml/lib" }
        linkoptions { "-Fsfml/lib" }
