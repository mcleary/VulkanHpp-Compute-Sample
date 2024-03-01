cmake_minimum_required(VERSION 3.16)

project(VulkanCompute)

find_package(Vulkan REQUIRED)

add_custom_command(
	OUTPUT "${CMAKE_BINARY_DIR}/Square.spv"
	COMMAND dxc -T cs_6_0 -E "Main" -spirv -fvk-use-dx-layout -fspv-target-env=vulkan1.1 -Fo "${CMAKE_BINARY_DIR}/Square.spv" "Square.hlsl"
	DEPENDS "Square.hlsl"
	WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
	COMMENT "Buiding Shaders"
)
add_custom_target(ComputeShader DEPENDS "${CMAKE_BINARY_DIR}/Square.spv")

add_executable(VulkanCompute "main.cpp")
target_link_libraries(VulkanCompute PRIVATE Vulkan::Vulkan)
add_dependencies(VulkanCompute ComputeShader)

