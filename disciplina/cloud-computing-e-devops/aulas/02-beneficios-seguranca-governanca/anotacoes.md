# Minhas anotações: Benefícios, segurança e desafios da nuvem

Nesta unidade relacionei os benefícios da nuvem às necessidades de negócio, mas também anotei que a adoção traz responsabilidades e riscos. A tecnologia pode facilitar colaboração, escalar recursos e acelerar testes, mas não elimina planejamento, governança ou trabalho da equipe.

## Benefícios para a organização

Aplicações e arquivos acessíveis pela rede podem apoiar equipes distribuídas e edição colaborativa. Recursos sob demanda reduzem o tempo para criar ambientes de teste e permitem aumentar ou diminuir capacidade. Ferramentas gerenciadas podem reduzir tarefas operacionais da equipe e dar acesso a serviços avançados sem comprar toda a infraestrutura.

Os slides relacionam a nuvem à mudança de investimentos de capital (CAPEX) para despesas operacionais (OPEX). Essa mudança pode diminuir investimento inicial, mas o custo total depende de uso, arquitetura, suporte, transferência de dados, licenças e disciplina de desligar recursos ociosos. “Pagar pelo uso” exige visibilidade de consumo e gestão financeira.

Escalabilidade vertical aumenta recursos de uma instância, como CPU ou memória; escalabilidade horizontal adiciona instâncias. Elasticidade pode automatizar esses ajustes conforme demanda. Para dimensionar corretamente, preciso pensar também em limites, testes, disponibilidade e custo.

## Segurança da informação

Revi os três pilares:

- **Confidencialidade:** somente pessoas e serviços autorizados acessam os dados.
- **Integridade:** dados e configurações não são alterados indevidamente.
- **Disponibilidade:** sistemas e dados ficam acessíveis quando necessários.

Entre as ameaças citadas estão phishing, roubo de credenciais, configurações incorretas, malware, ransomware e ataques de negação de serviço. Criptografia em trânsito e em repouso, autenticação multifator, gestão de identidades e acessos (IAM), monitoramento e privilégio mínimo ajudam a reduzir riscos. Nenhum controle isolado resolve tudo.

## Responsabilidade compartilhada

O provedor protege componentes que administra, como data centers e parte da infraestrutura. O cliente continua responsável por itens que controla, como identidade, permissões, dados e configuração do serviço. A divisão exata muda conforme IaaS, PaaS e SaaS e o serviço contratado. Por isso, preciso confirmar a matriz de responsabilidades em vez de presumir que “a nuvem cuida da segurança”.

Localização e tratamento de dados também precisam ser conhecidos. Para atender políticas internas e regras aplicáveis, a organização deve classificar os dados, definir controles de acesso, retenção e descarte, e analisar os termos do provedor. As apresentações citam LGPD, GDPR e padrões como ISO 27001; conformidade depende da situação e das práticas implementadas, não apenas do certificado do provedor.

## Disponibilidade, continuidade e dependência

Conexão com a internet e falhas do provedor podem interromper um serviço. Um SLA define compromissos de serviço, mas não representa disponibilidade absoluta em qualquer circunstância. Para aumentar resiliência, os slides mencionam regiões e zonas de disponibilidade, replicação, failover, monitoramento e testes de recuperação.

Usar vários provedores pode diminuir dependência de um só fornecedor, mas aumenta a complexidade operacional, de identidade, rede, segurança e custos. O vendor lock-in pode ocorrer quando a solução depende muito de serviços proprietários ou formatos difíceis de migrar. É uma decisão de trade-offs, não uma razão automática para usar multicloud.

Latência, perda de pacotes e instabilidade afetam aplicações sensíveis a tempo. Redundância de conectividade, priorização de tráfego e processamento próximo da origem podem ser alternativas, dependendo do problema.

## Sustentabilidade e pessoas

Consolidar servidores e virtualizar recursos pode reduzir equipamentos subutilizados, consumo de energia e resíduos. O impacto real depende da eficiência do data center, da fonte de energia e do uso que fazemos dos recursos. A adoção também pode encontrar resistência e falta de competências; treinamento e comunicação fazem parte da mudança.

## Para revisar

1. Descrever uma decisão de nuvem que muda CAPEX e OPEX e listar custos que ainda precisam ser acompanhados.
2. Para um serviço SaaS, listar responsabilidades que continuam com a organização cliente.
3. Propor como testar se uma cópia de segurança permite recuperar o serviço.
4. Explicar um benefício e um custo de operar em mais de um provedor.

**Apresentação da aula:** Slide 2.pdf, Unidade II, páginas 1–55.
