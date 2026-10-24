# Minhas anotações: Migração e integração de aplicações em nuvem

Entendi que migrar para a nuvem não é só copiar servidores e arquivos. A mudança pode afetar arquitetura, segurança, operação, custos e forma de trabalho. Por isso, a migração precisa começar com uma análise e continuar com monitoramento e melhoria depois da entrada em operação.

## Analisar antes de migrar

Primeiro preciso entender o ambiente atual: servidores, sistemas operacionais, aplicações, bancos de dados, redes e dependências entre sistemas. Também avalio criticidade, desempenho, disponibilidade e segurança. A análise financeira compara custos de infraestrutura, energia, manutenção, licenças e operação. Por fim, verifico competências da equipe e requisitos do negócio e de conformidade.

Aplicações críticas podem exigir mais preparação e testes. Um sistema de menor impacto pode servir como piloto, desde que a escolha ajude a aprender e não coloque dados ou serviços importantes em risco.

## Escolher arquitetura e modelo

A arquitetura pode continuar monolítica por um período, ser reorganizada em microsserviços, usar serviços gerenciados ou empregar componentes orientados a eventos. Não há necessidade de dividir todo sistema em microsserviços: cada opção traz efeitos sobre manutenção, implantação, escala e complexidade.

Também escolho modelo de implantação (público, privado ou híbrido) e modelo de serviço (IaaS, PaaS ou SaaS). O nível de controle e o esforço operacional mudam. A decisão precisa seguir requisitos do sistema, capacidades da equipe, custo e regras aplicáveis.

## Estratégias de migração: os 6 Rs

- **Rehosting:** mover a aplicação quase sem alterações (lift and shift). Pode acelerar a saída do ambiente local, mas não aproveita necessariamente recursos nativos da nuvem.
- **Replatforming:** fazer ajustes pontuais para aproveitar melhor a plataforma sem reescrever tudo.
- **Refactoring/Rearchitecting:** redesenhar a aplicação para explorar novas capacidades. Pode trazer ganhos, mas exige mais investimento e cuidado.
- **Repurchasing/Replacing:** substituir o sistema por uma solução existente, muitas vezes SaaS; pode exigir adaptar processos.
- **Retain:** manter a aplicação onde está, por razões técnicas, legais ou econômicas.
- **Retire:** encerrar um sistema que não agrega mais valor.

Não preciso usar a mesma estratégia para todos os sistemas. A escolha depende do valor, risco, custo, dependências e horizonte do projeto.

## Executar e acompanhar

Uma migração incremental pode começar por aplicações menos críticas e avançar depois de validar resultados. O plano deve definir responsáveis, cronograma, critérios de aceite, segurança e como voltar atrás se algo falhar. Ferramentas automatizadas ajudam, mas precisam ser configuradas e verificadas.

Depois da migração, acompanho desempenho, consumo, segurança e disponibilidade. FinOps reúne perspectivas de engenharia, finanças e negócio para entender e otimizar custos; não significa apenas cortar gastos. Como o uso muda, a estratégia precisa de revisão contínua.

## Integrações e aplicações

Microsserviços dividem uma aplicação em serviços com responsabilidades menores que se comunicam por interfaces, como APIs. Isso pode permitir implantações e escalas independentes, mas adiciona chamadas de rede, observabilidade e coordenação. APIs permitem que sistemas diferentes troquem dados com contratos definidos e reduzem acoplamento quando desenhadas com cuidado.

Os slides citam ERP para integrar recursos e processos organizacionais, CRM para relacionamento com clientes e BI para transformar dados em relatórios e indicadores. Hospedar essas soluções na nuvem pode oferecer acesso remoto e atualizações gerenciadas, mas é preciso analisar integração, permissões, custos e governança dos dados.

Agricultura, indústria, cidades, saúde, educação e entretenimento aparecem como exemplos de uso. IoT e análises em nuvem podem apoiar monitoramento e decisões, mas cada caso precisa considerar conectividade, privacidade, segurança e latência.

## Para revisar

1. Escolher uma aplicação e classificar seu risco, dependências e requisitos antes de migrá-la.
2. Comparar rehosting e refactoring considerando prazo, custo e benefícios.
3. Explicar por que migrar é um processo contínuo, não um evento único.
4. Descrever como uma API integra um ERP, um CRM ou uma ferramenta de BI.

**Apresentação da aula:** Slide 3.pdf, Unidade III, páginas 1–57.
