# Plano de Ensino: Programação Aplicada em .NET

## Identificação

- **Disciplina:** Programação Aplicada em .NET
- **Curso:** Análise e Desenvolvimento de Sistemas
- **Período:** 4º semestre
- **Matriz:** 2025-1
- **Carga horária:** 60 horas semestrais

## Ementa

Desenvolvimento de aplicações avançadas com C# e .NET, explorando recursos modernos da linguagem, imutabilidade e mapeamento de dados, desempenho e gerenciamento de recursos, consultas avançadas e persistência com Entity Framework Core, programação assíncrona e concorrente, diagnóstico e profiling, arquitetura modular, evolução de APIs, recursos em tempo real e práticas de qualidade contínua.

## Objetivo geral

Aplicar recursos avançados de C# e .NET para criar aplicações organizadas, eficientes e confiáveis, considerando persistência, concorrência, arquitetura, diagnóstico e qualidade.

## Objetivos específicos

- Usar recursos modernos de C# para expressar regras com clareza.
- Trabalhar com imutabilidade, records e transferência segura de dados.
- Identificar gargalos e reduzir alocações desnecessárias.
- Construir consultas com LINQ e persistir dados com EF Core.
- Criar operações assíncronas e controlar trabalho concorrente.
- Usar ferramentas de diagnóstico e profiling para orientar melhorias.
- Organizar aplicações em módulos e evoluir APIs com compatibilidade.
- Integrar comunicação em tempo real, cache e testes automatizados.

## Conteúdo programático

1. **C# avançado e .NET:** pattern matching, atributos, reflexão controlada, records, imutabilidade funcional e DTOs.
2. **Desempenho e alocação eficiente:** `Span<T>` e `Memory<T>`, pooling, redução de alocações, caminhos críticos e operações limitadas por entrada e saída.
3. **LINQ, EF Core e mapeamentos:** consultas complexas, projeções, `AsNoTracking`, consultas compiladas, tipos complexos e JSON quando suportados, impacto no SQL.
4. **Concorrência e pipelines:** `System.Threading.Channels`, `SemaphoreSlim`, coleções concorrentes, backpressure, limites de conexões e filas de trabalho.
5. **Diagnóstico e profiling:** BenchmarkDotNet, `dotnet-trace`, `dotnet-counters`, profiler do Visual Studio, latências p95/p99 e testes de carga.
6. **Arquitetura aplicada:** modularização, injeção de dependência, limites de domínio, versionamento de API e compatibilidade com clientes.
7. **Aplicações em tempo real e experiência do usuário:** SignalR, notificações, streaming, reconexão, cache de respostas, ETags e validação condicional.
8. **Qualidade contínua:** testes de integração com `WebApplicationFactory`, bancos temporários, analisadores Roslyn, padrões de estilo e revisão automatizada.

## Metodologia

O conteúdo é trabalhado com explicação dos conceitos, leitura das apresentações, análise de exemplos e prática de programação. Os exercícios ajudam a relacionar as escolhas de implementação com seus efeitos na aplicação, como o SQL gerado, o uso de memória, o comportamento concorrente e a facilidade de manutenção.

## Materiais das aulas

As apresentações são usadas em sala de aula e disponibilizadas no portal da faculdade:

- **C# e .NET: Começando do Zero** (9 páginas).
- **Pattern Matching, Atributos e Reflexão Controlada** (50 páginas).
- **Records, Imutabilidade Funcional e Mapeamentos DTO** (50 páginas).
- **Programação Aplicada em .NET: CST em Análise e Desenvolvimento de Sistemas, 4º Semestre, Matriz 2025-1** (4 páginas).

## Bibliografia básica

- STELLMAN, A.; GREENE, J. *Use a cabeça C#: guia do aprendiz para programação real com C# e .NET Core*. 4. ed. Rio de Janeiro: Alta Books, 2024. [Minha Biblioteca](https://app.minhabiblioteca.com.br/reader/books/9786555205954/).
- MANZANO, J. A. N. G. *Estudo dirigido de Microsoft Visual C# Community 2015*. Rio de Janeiro: Érica, 2016. [Minha Biblioteca](https://app.minhabiblioteca.com.br/reader/books/9788536519197/).
- DEITEL, H. M.; DEITEL, P. J.; LISTFIELD, J. A. *C#: como programar*. São Paulo: Pearson, 2003. [Biblioteca Virtual](https://plataforma.bvirtual.com.br/Leitor/Publicacao/282/epub/0).

## Bibliografia complementar

- MARTIN, R.; MARTIN, M. *Princípios, padrões e práticas ágeis em C#*. Porto Alegre: Bookman, 2011. [Minha Biblioteca](https://app.minhabiblioteca.com.br/reader/books/9788577808427/).
- ARAÚJO, E. C. *Orientação a objetos em C#: conceitos e implementações em .NET*. São Paulo: Casa do Código, 2017. [Biblioteca Virtual](https://plataforma.bvirtual.com.br/Leitor/Publicacao/213006/epub/0).
- CARVALHO, T. L. *Orientação a objetos: aprenda seus conceitos e suas aplicabilidades de forma efetiva*. São Paulo: Casa do Código, 2016. [Biblioteca Virtual](https://plataforma.bvirtual.com.br/Leitor/Publicacao/212844/epub/0).
- LARMAN, C. *Utilizando UML e padrões*. 3. ed. Porto Alegre: Bookman, 2011. [Minha Biblioteca](https://app.minhabiblioteca.com.br/reader/books/9788577800476/).
- SANTANA, R. G. *Design Patterns com C#: aprenda padrões de projeto com os games*. São Paulo: Casa do Código, 2020. [Biblioteca Virtual](https://plataforma.bvirtual.com.br/Leitor/Publicacao/212974/epub/0).
