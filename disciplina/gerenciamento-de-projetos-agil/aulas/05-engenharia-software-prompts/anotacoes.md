# Anotações — Engenharia de Software com apoio de prompts

> Material organizado a partir dos slides/documento da aula fornecidos.

## Como usar prompts no ciclo de software

O documento de aula propõe dez prompts encadeados. Cada etapa recebe artefatos revisados e produz uma saída para a etapa seguinte. A IA apoia análise e produção de rascunhos; pessoas continuam responsáveis por decisões, revisão, aceite e evidências.

Use versões identificadas dos documentos, forneça novamente as entradas necessárias em novas conversas e revise o resultado antes de avançar. Repita etapas por incremento quando necessário. Planejamento de testes começa junto aos requisitos e rastreabilidade acompanha o ciclo.

## As dez etapas do roteiro

| Etapa | Entrada principal | Resultado esperado |
|---|---|---|
| 1. Revisar especificação funcional | EF, objetivos, usuários e restrições | Problemas, ambiguidades, lacunas e perguntas priorizadas. |
| 2. Consolidar requisitos | EF revisada e decisões validadas | ERS/SRS com requisitos identificados, critérios de aceitação e rastreabilidade inicial. |
| 3. Definir arquitetura | ERS, tecnologias, integrações e restrições | Descrição de arquitetura, alternativas e decisões técnicas propostas. |
| 4. Detalhar projeto técnico | ERS, arquitetura e padrões | Dados, interfaces, telas, regras, algoritmos e casos de fronteira. |
| 5. Planejar testes | Requisitos, arquitetura, riscos e ambientes | Plano e casos de teste ligados a requisitos; status ainda não executado. |
| 6. Organizar implementação incremental | Requisitos, desenho, testes, capacidade e prioridades | Backlog ordenado, dependências e definição de pronto. |
| 7. Implementar incremento | Item priorizado, código e testes | Alteração revisável, documentação e registro real de verificações. |
| 8. Integrar, verificar e corrigir | Versão, plano de testes e evidências | Resultados observados, defeitos e cobertura de requisitos. |
| 9. Validar e preparar implantação | Versão verificada e responsáveis | Roteiros de homologação, registro de aceite e plano de implantação. |
| 10. Planejar manutenção e evolução | Versão implantada, documentação e feedback | Plano de operação, manutenção, incidentes e análise de mudanças. |

## Estrutura útil de um prompt

Um prompt de trabalho deve dizer qual papel funcional é esperado, qual tarefa será feita, quais entradas estão disponíveis, qual formato de saída é necessário e quais limites devem ser respeitados. Peça para separar fatos fornecidos, propostas, hipóteses e pendências. Não peça à IA para afirmar que executou testes, obteve aceite ou verificou uma norma sem evidências.

**Exemplo reduzido:** “Atue como analista de requisitos. Revise a especificação anexada do projeto [nome]. Identifique ambiguidades, conflitos e lacunas em uma tabela com ID, problema, impacto e pergunta para o responsável. Não invente requisitos; marque propostas e decisões pendentes separadamente.”

## Revisão humana e rastreabilidade

Antes de aceitar a saída, confira fonte e versão dos requisitos, IDs, consistência, critérios verificáveis, segurança, acessibilidade e compatibilidade com arquitetura. Mantenha ligações entre necessidade, requisito, componente, teste e evidência. Diferencie teste planejado, implementado, executado, bloqueado e reprovado.

O documento de origem cita ISO/IEC/IEEE 29148, 12207, 42010 e 29119-2 como referências. A sequência é uma organização prática de aula e não representa, por si só, conformidade normativa. Consulte os textos aplicáveis antes de fazer alegações de conformidade.

## Atividade

Escolha uma funcionalidade de PIM. Escreva a entrada e a saída esperada para cada etapa de 1 a 6, indicando o que precisa ser validado por uma pessoa antes de seguir. Em seguida, simule uma resposta incompleta e registre quais perguntas impedem que a equipe a trate como decisão aprovada.

## Referências indicadas no documento da aula

O documento de origem aponta estas normas para consulta e alerta que seu roteiro prático não comprova conformidade. As edições aplicáveis devem ser confirmadas pela equipe antes de qualquer declaração de conformidade.

- ISO/IEC/IEEE 29148:2018 — Requirements engineering: https://www.iso.org/standard/72089.html
- ISO/IEC/IEEE 12207:2026 — Software life cycle processes: https://ieeexplore.ieee.org/iel8/11481696/11481697/11481698.pdf
- ISO/IEC/IEEE 42010:2022 — Architecture description: https://www.iso.org/standard/74393.html
- ISO/IEC/IEEE 29119-2:2021 — Test processes: https://www.iso.org/standard/79428.html

**Material de origem:** `Prompts_Engenharia_Software_IEEE.doc`, arquivo enviado no ZIP. O documento apresenta a sequência de dez prompts e as entregas esperadas.
