# Minhas anotações: Concorrência e pipelines

Concorrência significa lidar com várias operações em andamento; paralelismo significa executar mais de uma operação ao mesmo tempo. Uma aplicação pode ser concorrente sem usar vários núcleos. Em serviços web, o objetivo costuma ser atender trabalho de forma eficiente sem ultrapassar limites de banco, memória e rede.

## Código assíncrono

`async` e `await` ajudam a aguardar operações I/O sem bloquear a thread enquanto a resposta não chega. Isso não torna automaticamente o código mais rápido nem deve ser usado para mascarar trabalho intensivo de CPU.

## Limitar acesso com `SemaphoreSlim`

```csharp
var limite = new SemaphoreSlim(5);

await limite.WaitAsync();
try
{
    await ConsultarServicoAsync();
}
finally
{
    limite.Release();
}
```

O semáforo limita quantas operações entram na região ao mesmo tempo. O `finally` garante a liberação mesmo quando ocorre uma exceção. Em aplicações reais, o limite deve refletir a capacidade do recurso protegido.

## Canais e filas

`System.Threading.Channels` oferece uma estrutura assíncrona para produtores e consumidores. Uma fila desacopla quem cria trabalho de quem processa, mas precisa ter política de capacidade, cancelamento, tratamento de falhas e encerramento.

## Backpressure

Backpressure é a forma de impedir que a entrada de trabalho cresça sem controle quando consumidores não dão conta da demanda. Pode ser aplicada limitando a fila, desacelerando o produtor ou recusando trabalho temporariamente. Sem controle, a fila pode aumentar o uso de memória e piorar os tempos de resposta.

## Banco de dados e concorrência

Conexões de banco são recursos finitos. Abrir tarefas ilimitadas pode esgotar o pool de conexões e prejudicar todos os usuários. Coleções concorrentes protegem operações específicas sobre estruturas compartilhadas, mas não tornam segura qualquer sequência de operações; ainda é preciso definir a sincronização e a consistência desejadas.

**Apresentação usada em sala de aula:** conteúdo programático da disciplina.
