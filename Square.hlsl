
[[vk::binding(0, 0)]] RWStructuredBuffer<int> InBuffer;
[[vk::binding(1, 0)]] RWStructuredBuffer<int> OutBuffer;

[numthreads(1, 1, 1)]
void Main(uint3 DTid : SV_DispatchThreadID)
{
	OutBuffer[DTid.x] = InBuffer[DTid.x] * InBuffer[DTid.x];
}
