# Anotações de estudo — Recursos do Dispositivo e Segurança

## Conceitos

Acesso a câmera, localização e notificações depende de permissões e contexto de uso. Solicite acesso no momento em que o recurso é necessário, explique a finalidade e ofereça alternativa se recusado.

## Desenvolvimento e prática

Use APIs Android apropriadas e verifique disponibilidade/permissão antes de acessar recurso. Trate negação e revogação. Colete apenas dados necessários. Use HTTPS, valide dados no servidor e armazene credenciais com mecanismos adequados à plataforma; não grave tokens em logs.

Segurança também envolve componentes exportados, intents, backup e dependências. A autorização real deve ser verificada no servidor; esconder botão não protege endpoint.

**Exercícios:** mapeie permissões de um app de câmera; defina fallback após recusa; identifique dados que não devem aparecer em log.
