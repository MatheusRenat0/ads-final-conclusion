# Resumo: Records e imutabilidade

Records representam dados e oferecem igualdade baseada nos valores dos membros. O modificador `init` permite definir propriedades na criação, e `with` produz uma nova instância com valores atualizados sem alterar a original. A cópia feita por `with` é superficial, então referências a objetos mutáveis podem continuar compartilhadas.

Records combinam bem com valores, eventos e resultados. Classes são úteis quando identidade e comportamento são centrais. Veja exemplos nas [anotações](./anotacoes.md).
