# Resumo: Concorrência e pipelines

Código assíncrono permite aguardar operações sem bloquear a thread durante a espera. `SemaphoreSlim` limita o acesso simultâneo a recursos, e Channels podem organizar produtores e consumidores. Filas precisam de limites e política de falhas; backpressure protege o sistema quando chega mais trabalho do que ele consegue processar.

Concorrência sem limites pode esgotar conexões, memória e capacidade do serviço. Consulte as [anotações](./anotacoes.md) para exemplos e cuidados.
