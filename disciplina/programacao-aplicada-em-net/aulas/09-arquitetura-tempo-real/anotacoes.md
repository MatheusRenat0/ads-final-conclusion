# Minhas anotações: Arquitetura, APIs e tempo real

Arquitetura ajuda a dividir responsabilidades e controlar dependências. Em uma aplicação modular, cada parte tem um propósito claro e conversa com as outras por contratos conhecidos. A injeção de dependência permite fornecer implementações sem deixar cada classe criar diretamente tudo de que precisa.

## Limites de domínio

Regras de negócio devem ficar onde possam ser entendidas e protegidas. Uma API pode validar formato da requisição, mas regras que mantêm o domínio consistente não devem depender apenas do endpoint. A persistência também não deve definir sozinha o desenho do contrato público.

## Evolução e versionamento de APIs

Uma API é usada por clientes que podem atualizar em ritmos diferentes. Remover campos, mudar significado ou alterar formatos pode quebrar integrações. Versionamento, compatibilidade retroativa, documentação e período de transição ajudam a evoluir o contrato. Nem toda mudança exige uma nova versão: adicionar um campo opcional pode ser compatível dependendo do cliente e do contrato.

## SignalR

SignalR facilita comunicação em tempo real entre servidor e clientes, por exemplo notificações de atualização. Conexões podem cair, reconectar e ser atendidas por diferentes instâncias do serviço, então aplicações precisam pensar em autenticação, grupos, escala e mensagens que o cliente pode perder.

## Cache e validação condicional

Cache evita refazer trabalho quando o dado continua válido. Respostas HTTP podem usar cabeçalhos de cache e ETags para que o cliente consulte se o conteúdo mudou. Cache incorreto pode entregar dado desatualizado ou de outro usuário; política, privacidade e invalidação precisam fazer parte do desenho.

## Escolha com contexto

Não escolho arquitetura distribuída ou tempo real só por serem recursos modernos. Primeiro verifico o problema: frequência de atualização, latência, quantidade de clientes, requisitos de consistência e capacidade de operação. Uma solução mais simples costuma ser mais fácil de manter quando atende o requisito.

**Apresentação usada em sala de aula:** conteúdo programático da disciplina.
