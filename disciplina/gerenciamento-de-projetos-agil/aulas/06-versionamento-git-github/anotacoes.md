# Minhas anotações — Versionamento com Git e GitHub

**Aula do professor André Muniz — 23/10/2026**

O que entendi é que versionar um projeto significa registrar suas mudanças de forma organizada para conseguir acompanhar como ele evoluiu e colaborar sem depender de cópias como “trabalho-final-agora-vai”. O Git é o sistema de controle de versão; GitHub é uma plataforma onde podemos hospedar repositórios Git e colaborar por meio de branches, pull requests e revisão.

## Como o Git organiza o trabalho

No computador, trabalho dentro de um repositório local. O Git compara os arquivos e guarda snapshots chamados **commits**, que têm uma mensagem e um identificador. Antes de criar um commit, escolho quais mudanças quero incluir na área de preparação (staging/index). Assim posso revisar o que será registrado.

Em um projeto compartilhado também pode haver um repositório remoto, por exemplo no GitHub. **origin** costuma ser o apelido usado para esse remoto, mas o nome pode variar. Git é distribuído: o repositório local tem histórico e posso fazer commits sem conexão; para compartilhar alterações com o remoto, preciso sincronizar.

## Configuração inicial

Instalo o Git e confiro que está disponível:

    git --version
    git config --global user.name "Seu Nome"
    git config --global user.email "seu-email@example.com"

Essas opções identificam o autor dos próximos commits feitos com essa configuração global. Posso ver as configurações com **git config --list**; configurações locais do repositório podem ser usadas quando preciso de outra identidade.

## Criar ou obter um repositório

- **git init** começa um repositório Git na pasta atual.
- **git clone <url>** baixa uma cópia do repositório remoto com seu histórico.
- **git status** mostra em qual branch estou e quais arquivos foram alterados, preparados ou ainda não são acompanhados.

Se o projeto já existe no GitHub, normalmente começo com **clone**. Uso **init** quando quero passar a versionar uma pasta que ainda não tem repositório.

## Registrar alterações

Um fluxo que estou aprendendo é:

    git status
    git diff
    git add caminho/do/arquivo
    git diff --staged
    git commit -m "Describe the change"
    git log --oneline

- **git diff** mostra alterações ainda não preparadas.
- **git add <arquivo>** coloca a alteração escolhida na área de preparação. **git add .** pode incluir várias alterações da pasta atual; por isso, confiro status antes de usar.
- **git diff --staged** mostra o que será incluído no próximo commit.
- **git commit -m "..."** cria um registro local das mudanças preparadas. Uma boa mensagem explica a mudança de forma curta.
- **git log --oneline** mostra um histórico compacto dos commits.

Um commit é um ponto do histórico do projeto, não uma cópia do projeto no GitHub. Ainda preciso enviar o commit para um remoto se quiser compartilhá-lo com a equipe.

## Branches e integração

Uma **branch** é uma linha de trabalho com um nome. Posso criar uma branch para desenvolver uma mudança sem mexer diretamente na branch principal:

    git branch
    git switch -c feature/nome-da-mudanca
    # faço a alteração, reviso e crio commits
    git switch main
    git merge feature/nome-da-mudanca

**git branch** lista branches locais; **git switch -c** cria e muda para uma branch; **git switch** troca de branch; **git merge** integra o histórico da branch indicada à branch atual. Antes de integrar, verifico o estado do repositório e se a equipe definiu outra convenção de nomes ou fluxo.

Se duas alterações editarem a mesma parte de um arquivo, pode ocorrer um conflito. O Git marca as partes que precisam de decisão. Resolvo o conteúdo, retiro os marcadores, testo o resultado, preparo o arquivo com **git add** e concluo a integração conforme o estado do merge.

## Compartilhar com GitHub

**git remote -v** mostra os endereços remotos configurados. Para ligar um repositório local a um remoto novo, posso usar **git remote add origin <url>**.

- **git push -u origin nome-da-branch** envia os commits da branch para o remoto e configura o rastreamento inicial.
- **git fetch** baixa informações e commits do remoto sem integrar automaticamente ao meu trabalho atual.
- **git pull** busca alterações do remoto e tenta integrá-las à branch atual; na prática, combina busca e integração.
- **git clone <url>** cria a cópia local de um repositório remoto.

No GitHub, uma **pull request** propõe integrar uma branch a outra. Ela oferece um lugar para explicar a mudança, revisar o diff, conversar, pedir ajustes e executar verificações automatizadas antes da integração. Uma pull request não é um comando Git; é um recurso de colaboração da plataforma.

## Arquivos que não devem entrar no repositório

Um arquivo **.gitignore** lista arquivos e pastas que o Git deve ignorar, como saídas de build, configurações locais e arquivos com credenciais. Isso ajuda a evitar que dados privados ou arquivos desnecessários sejam enviados. Se um segredo já foi commitado ou publicado, apenas adicioná-lo ao .gitignore não apaga o histórico nem invalida a credencial.

## Por que isso importa

O versionamento ajuda a:

- saber quem mudou o quê e quando;
- comparar versões e investigar quando um problema apareceu;
- trabalhar em mudanças separadas usando branches;
- revisar alterações antes de juntá-las ao projeto principal;
- compartilhar o histórico com a equipe;
- recuperar ou reverter uma mudança com mais segurança.

Git e GitHub não substituem comunicação, testes ou revisão. Commits pequenos e claros, branches para mudanças com propósito definido e pull requests revisadas tornam o histórico mais fácil de acompanhar.

## Exercício

Crie um repositório de estudo com um README, registre a versão inicial, crie uma branch para acrescentar uma seção, faça um commit e compare o histórico. Se houver acesso a um repositório GitHub de exercícios, envie a branch e abra uma pull request. Antes de cada commit, confira **git status** e o diff.

## Referências

- [Git — documentação oficial](https://git-scm.com/docs)
- [GitHub — sobre Git](https://docs.github.com/en/get-started/using-git/about-git)
- [GitHub — obtendo alterações de um repositório remoto](https://docs.github.com/en/get-started/using-git/getting-changes-from-a-remote-repository)
- [GitHub — início rápido de pull requests](https://docs.github.com/en/pull-requests/get-started/pull-request-quickstart)
