# Minhas anotações: Recursos do dispositivo e segurança

Câmera, localização e notificações dão mais possibilidades ao aplicativo, mas também envolvem dados e decisões da pessoa. Não faz sentido pedir todas as permissões logo na primeira abertura. O pedido deve aparecer quando o recurso for usado e explicar para que o acesso é necessário.

## Permissões e alternativas

Antes de usar um recurso, o app precisa conferir se a permissão foi concedida e se o aparelho consegue fornecer o recurso. Se o acesso for negado ou revogado depois, devo tratar a situação sem fechar o aplicativo de forma inesperada. Também posso oferecer uma alternativa quando ela fizer sentido.

## Proteção de dados

Anotei alguns cuidados: coletar apenas os dados necessários; usar conexões seguras; não escrever tokens, senhas ou informações pessoais em logs; e armazenar credenciais com recursos adequados à plataforma. O servidor também precisa validar os dados recebidos e decidir se a pessoa pode executar determinada ação.

Esconder um botão na interface não protege a operação por trás dele. Se existe um endpoint remoto, a autorização precisa ser verificada no servidor. Segurança também envolve componentes exportados, intents, backup e dependências do projeto.

## Exercícios para pensar

1. Para um aplicativo de câmera, indicar em que momento pedir a permissão e o que fazer se ela for negada.
2. Identificar quais informações não devem aparecer nos logs.
3. Explicar por que ocultar um botão administrativo não substitui uma verificação no servidor.
4. Rever cada permissão do projeto e perguntar se ela é realmente necessária.
