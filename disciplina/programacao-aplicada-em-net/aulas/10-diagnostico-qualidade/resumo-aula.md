# Resumo: Diagnóstico e qualidade contínua

Profiling e métricas ajudam a encontrar gargalos com base em evidências. Percentis p95 e p99 mostram a experiência das requisições mais lentas; `dotnet-counters`, `dotnet-trace`, Visual Studio Profiler e BenchmarkDotNet atendem tipos diferentes de investigação.

Testes de integração podem exercitar a aplicação por HTTP com `WebApplicationFactory` e dados isolados. Analisadores Roslyn verificam padrões de código. Testes, análise estática e profiling se complementam e ajudam durante todo o desenvolvimento.

As [anotações](./anotacoes.md) explicam o papel de cada ferramenta.
