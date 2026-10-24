# Resumo — Navegação entre telas

Aprendi a pensar na navegação como o fluxo que conecta uma tela à outra e mantém o histórico necessário para voltar. Num fluxo de catálogo, por exemplo, a pessoa sai da lista, abre os detalhes de um item e pode retornar à lista sem perder a referência do caminho.

Cada destino deve receber apenas os dados de que precisa. Em geral, é melhor passar um identificador e buscar o restante na camada de dados do que enviar um objeto grande pela navegação. Também preciso tratar argumento ausente ou inválido e considerar links que abrem uma tela diretamente.

O exemplo nas [anotações](./anotacoes.md) usa Navigation Compose e é apenas ilustrativo: requer biblioteca, configuração e tratamento de erros compatíveis com o projeto. Vale desenhar o fluxo antes de codificar e conferir o que acontece ao usar o botão Voltar.
