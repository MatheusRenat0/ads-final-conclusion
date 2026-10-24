# Resumo: DTOs e mapeamento

DTOs definem os dados que atravessam uma fronteira, como a API. Separá-los das entidades permite controlar o contrato, ocultar campos internos e reduzir dependência entre a persistência e os clientes.

Mapeamento explícito facilita a revisão dos campos expostos. Em consultas com EF Core, projeções podem buscar só as colunas necessárias; é preciso validar o SQL produzido. Bibliotecas de mapeamento ajudam a reduzir repetição, mas não substituem a conferência das regras.

Consulte as [anotações](./anotacoes.md) para exemplos de entrada, saída e projeção.
