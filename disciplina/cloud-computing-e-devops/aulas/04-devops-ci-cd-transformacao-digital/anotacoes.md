# Minhas anotações: DevOps, CI/CD e transformação digital

O ponto principal desta unidade é que DevOps aproxima desenvolvimento e operações para entregar valor com mais frequência e confiabilidade. Não entendi DevOps como uma ferramenta específica nem como a criação obrigatória de uma equipe única. É uma combinação de cultura, práticas e automação para melhorar o ciclo de vida do software.

## Cultura e princípios

No modelo tradicional, desenvolvimento pode priorizar novas funções e operações pode priorizar estabilidade. DevOps incentiva objetivos compartilhados, colaboração e feedback entre as áreas. Os princípios apresentados foram fluxo, feedback e aprendizado contínuo.

O modelo **CALMS** organiza cinco dimensões:

- **Culture:** colaboração e responsabilidade compartilhada.
- **Automation:** reduzir tarefas manuais repetitivas e variação.
- **Lean:** eliminar desperdício e melhorar o fluxo.
- **Measurement:** usar métricas para perceber gargalos e resultados.
- **Sharing:** compartilhar conhecimento e aprendizado.

Automatizar sem entender o processo pode apenas tornar um fluxo ruim mais rápido. Medir também não é uma meta em si: as métricas precisam ajudar a tomar decisões e melhorar o serviço.

## Ciclo de vida

Os slides apresentam um ciclo com planejamento (plan), codificação (code), construção (build), teste (test), lançamento (release), implantação (deploy), operação (operate) e monitoramento (monitor). O monitoramento devolve informação para planejar os próximos ajustes; por isso, o fluxo se repete.

Docker é citado para criar imagens de containers. Kubernetes orquestra containers em escala. Infraestrutura como código descreve recursos de infraestrutura em arquivos versionáveis e automatizáveis. Gestão de configuração ajuda a manter parâmetros e dependências consistentes entre ambientes.

Essas ferramentas resolvem problemas diferentes e não são pré-requisitos para todo projeto DevOps. A escolha depende da arquitetura, do volume, da equipe e da necessidade operacional.

## Integração e entrega contínuas

**Integração contínua (CI)** significa integrar alterações com frequência e executar verificações automatizadas, como build e testes. Isso ajuda a identificar problemas enquanto as mudanças ainda são pequenas.

**Entrega contínua (Continuous Delivery)** prepara o software para ser implantado, mantendo o processo validado e repetível. Em algumas equipes, “CD” também é usado para continuous deployment, quando alterações que passam pelas verificações podem ser implantadas automaticamente. Os termos são relacionados, mas não idênticos: a entrega contínua normalmente mantém uma decisão ou etapa de aprovação antes da produção.

Pipelines organizam gatilhos e estágios, como build, teste e publicação de artefatos. Imagens de container podem ser guardadas em registries; manifests e infraestrutura podem ser versionados. Testes e aprovações continuam necessários: automação não comprova por si só que uma mudança atende ao usuário.

## Segurança e operação

DevSecOps incorpora segurança desde o planejamento e desenvolvimento, em vez de deixar toda a verificação para o fim. GitOps usa o Git como referência declarativa para mudanças de infraestrutura ou implantação. Observabilidade combina sinais que ajudam a entender o comportamento do sistema em execução e investigar problemas.

## Nuvem e transformação digital

A nuvem pode permitir experimentar produtos e serviços com mais rapidez e escalar recursos, enquanto DevOps pode tornar entrega e operação mais consistentes. Transformação digital vai além de digitalizar um formulário: envolve rever processos, produtos ou o próprio modelo de negócio para criar e entregar valor de outra forma.

As apresentações também conectam nuvem a IA, machine learning, IoT, edge computing e sustentabilidade. Nuvem oferece capacidade e serviços gerenciados para dados e modelos; edge pode aproximar decisões da fonte quando latência é importante. Green Cloud chama atenção para consumo de energia, emissões e uso eficiente de recursos. Essas tecnologias precisam ser escolhidas por um problema concreto, considerando privacidade, segurança, custo e impacto.

## Para revisar

1. Explicar o que muda quando desenvolvimento e operações compartilham responsabilidade pelo serviço.
2. Montar um pipeline simples com build, testes e etapa de publicação.
3. Diferenciar entrega contínua de implantação contínua.
4. Relacionar CALMS a um problema de integração ou operação.
5. Dar um exemplo que diferencie digitalização de transformação digital.

**Apresentação da aula:** Slide 4.pdf, Unidade IV, páginas 1–56.
