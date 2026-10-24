# Resumo — Testes e publicação

Testar ajuda a encontrar problemas antes que cheguem a quem usa o aplicativo. Testes unitários verificam regras isoladas; testes instrumentados executam código Android no dispositivo ou emulador; testes de interface conferem os fluxos que a pessoa consegue observar. Bons testes cobrem também entradas inválidas e situações de erro.

Antes de distribuir o aplicativo, preciso conferir a versão de release, assinatura, permissões, compatibilidade, nome e ícone, além das informações e políticas exigidas pelo canal de distribuição. A chave de assinatura e suas senhas devem ficar protegidas e fora do repositório. Também é importante instalar e testar o artefato de release, pois ele pode se comportar de forma diferente do build de desenvolvimento.

O exemplo de teste e o checklist estão nas [anotações](./anotacoes.md). Requisitos de lojas e ferramentas podem mudar, então precisam ser conferidos quando o app for publicado.
