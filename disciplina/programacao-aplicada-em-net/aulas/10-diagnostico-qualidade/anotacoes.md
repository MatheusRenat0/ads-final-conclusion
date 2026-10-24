# Minhas anotações: Diagnóstico e qualidade

Medir é parte do desenvolvimento porque impressões não mostram com precisão onde o programa gasta tempo, memória ou recursos. Antes de mudar código, descrevo o cenário e escolho indicadores que ajudem a comparar o comportamento.

## Latência e profiling

Latência média pode esconder requisições muito lentas. Percentis como p95 e p99 mostram quanto tempo as requisições mais demoradas levam. `dotnet-counters` ajuda a observar contadores do runtime; `dotnet-trace` coleta rastros para investigação; o profiler do Visual Studio ajuda a encontrar gargalos. BenchmarkDotNet é voltado a microbenchmarks controlados, que não substituem testes de carga da aplicação completa.

Para comparar resultados, mantenho entradas e ambiente consistentes e repito as medições. Testes de carga ajudam a observar latência, erros e consumo sob concorrência. Não otimizo uma função isolada se o problema real está em uma chamada externa.

## Testes de integração

`WebApplicationFactory` pode iniciar uma aplicação ASP.NET Core em testes e permite verificar o comportamento por HTTP. Um banco temporário ou isolado deixa os testes repetíveis e evita depender de dados pessoais ou do ambiente de produção. Os testes devem conferir o resultado observável, incluindo códigos HTTP, contrato e efeitos persistidos relevantes.

## Analisadores Roslyn

Analisadores examinam o código e apontam padrões que podem gerar erros ou violar convenções. Regras de estilo e análise estática podem ser executadas no editor e na integração contínua. É melhor configurar regras compreensíveis e aplicáveis do que acumular avisos ignorados.

## Revisão contínua

Qualidade não é uma etapa no fim do projeto. Testes, análise estática, revisão de código e observação de métricas ajudam a detectar problemas ao longo das mudanças. Cada ferramenta responde a perguntas diferentes: testes verificam comportamento esperado; analisadores identificam padrões; profiling investiga desempenho.

**Apresentação usada em sala de aula:** conteúdo programático da disciplina.
