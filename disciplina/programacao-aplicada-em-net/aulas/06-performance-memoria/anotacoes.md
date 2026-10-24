# Minhas anotações: Desempenho e memória

Otimizar começa por entender o que está lento e medir o comportamento real. Uma implementação que parece mais rápida no papel pode não melhorar o sistema se o gargalo estiver em rede, banco de dados ou disco. Primeiro identifico o cenário, defino o que medir e só então comparo alternativas.

## Alocações

Criar muitos objetos temporários aumenta o trabalho do coletor de lixo. Em caminhos executados com frequência, posso reduzir alocações reutilizando buffers, evitando conversões repetidas ou processando dados sem criar cópias intermediárias. Isso não quer dizer que toda alocação seja ruim; clareza e correção vêm primeiro.

## `Span<T>` e `Memory<T>`

`Span<T>` representa uma região contígua de memória e permite trabalhar com partes de arrays ou strings sem copiar os dados. Ele é uma estrutura de uso limitado à stack e não pode ser armazenado em campos comuns de objetos ou atravessar `await`.

```csharp
ReadOnlySpan<char> trecho = "pedido-123".AsSpan(7);
Console.WriteLine(trecho); // 123
```

`Memory<T>` pode ser armazenado e usado em cenários assíncronos. Os dois tipos são úteis para processamento de buffers, mas é importante compreender o ciclo de vida da memória referenciada.

## Pooling

Pools reutilizam objetos ou buffers para evitar criar e descartar repetidamente estruturas caras. A reutilização precisa ter limites e garantir que os dados antigos não vazem para a próxima operação. `ArrayPool<T>.Shared` fornece um pool de arrays:

```csharp
var buffer = ArrayPool<byte>.Shared.Rent(4096);
try
{
    // Usar apenas o trecho preenchido do buffer.
}
finally
{
    ArrayPool<byte>.Shared.Return(buffer, clearArray: true);
}
```

Devolver o array no `finally` evita retenção por esquecimento. Limpar o conteúdo é importante quando os dados são sensíveis.

## Operações I/O-bound e CPU-bound

Uma operação I/O-bound passa tempo esperando rede, disco ou banco; operações assíncronas ajudam a liberar threads durante a espera. Uma operação CPU-bound consome processamento; paralelizar pode ajudar se houver capacidade, mas pode também aumentar contenção. Identificar o tipo de trabalho evita aplicar a ferramenta errada.

**Apresentação usada em sala de aula:** conteúdo programático da disciplina.
