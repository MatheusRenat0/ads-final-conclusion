# Resumo: Atributos, reflexão e geração de código

Atributos guardam metadados no código; frameworks ou ferramentas podem consultá-los. Reflexão permite descobrir tipos e membros durante a execução, o que é flexível, mas pode adicionar custo e dificultar trimming ou AOT se dependências dinâmicas não forem conhecidas pela ferramenta.

Source generators criam código durante a compilação e podem substituir descoberta dinâmica em casos adequados. A decisão entre chamadas estáticas, reflexão e geração depende do cenário e precisa ser validada na forma real de publicação.

As [anotações](./anotacoes.md) incluem um exemplo de atributo e uma leitura simples com reflection.
