# Resumo: Desempenho e memória

Melhorias de desempenho devem partir de medição e identificação do gargalo. `Span<T>` permite trabalhar com regiões de memória sem cópias em cenários síncronos; `Memory<T>` atende usos que precisam atravessar operações assíncronas. Pools reduzem alocações repetidas, mas exigem devolução correta dos recursos e cuidado com dados residuais.

Operações I/O-bound e CPU-bound têm comportamentos diferentes e pedem estratégias distintas. Veja exemplos e cuidados nas [anotações](./anotacoes.md).
