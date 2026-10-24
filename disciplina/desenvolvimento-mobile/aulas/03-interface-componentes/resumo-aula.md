# Resumo: Interfaces e componentes Android

A interface apresenta informações e permite interagir com o aplicativo. Para montar uma tela, organizamos componentes como texto, imagens, campos e botões. Além de mostrar o caminho normal, preciso prever como a tela fica enquanto carrega, quando não encontra dados e quando ocorre um erro.

No Android posso encontrar telas implementadas com XML e Views ou com Jetpack Compose. Em Compose, funções composable descrevem a interface a partir do estado. Quando o estado muda, a tela é atualizada; por isso, os valores que precisam continuar disponíveis devem ser mantidos no lugar certo.

A parte visual deve ser separada das regras do aplicativo. Também preciso pensar em acessibilidade: rótulos claros, descrições para imagens informativas e mensagens úteis nos formulários. O exemplo de Compose nas [anotações](./anotacoes.md) é ilustrativo e precisa de um projeto configurado com as dependências correspondentes.
