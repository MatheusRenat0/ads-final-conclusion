# Minhas anotações: C# e .NET

C# é a linguagem que uso para escrever as instruções e regras de uma aplicação. .NET é a plataforma que fornece bibliotecas, ferramentas e ambiente de execução para compilar e executar esse código. Por isso, C# e .NET aparecem juntos, mas não são a mesma coisa: a linguagem descreve o programa; a plataforma dá suporte para ele funcionar.

## O que dá para criar

Com C# e .NET é possível desenvolver APIs e aplicações web, programas para desktop, aplicações móveis, serviços em nuvem, ferramentas de linha de comando e jogos com Unity. A escolha do tipo de projeto depende da necessidade e das bibliotecas usadas.

## Como o programa é executado

O código C# é compilado para uma representação intermediária. Em tempo de execução, o CLR (Common Language Runtime) carrega e executa o programa, usando compilação JIT quando apropriado para transformar partes do código em instruções nativas. O SDK reúne ferramentas para criar, compilar, executar e publicar projetos; as bibliotecas do .NET oferecem funcionalidades reutilizáveis.

Em algumas publicações, a compilação AOT permite gerar código nativo antes da execução. JIT e AOT têm características diferentes de inicialização, tamanho e compatibilidade; a escolha depende do tipo de aplicação e dos recursos utilizados.

## Primeiro exemplo

```csharp
Console.WriteLine("Olá, .NET!");
```

`Console.WriteLine` escreve uma linha no terminal. É um exemplo pequeno, mas já mostra a chamada de uma funcionalidade fornecida pelas bibliotecas da plataforma.

## Tipos, variáveis e funções

```csharp
string nome = "Ana";
int idade = 20;

Console.WriteLine($"{nome} tem {idade} anos.");
```

As variáveis recebem valores de tipos definidos. C# também oferece inferência de tipo com `var`, mas a variável continua tendo um tipo estático determinado na compilação. Métodos agrupam instruções que podem receber parâmetros e devolver resultados.

## Gerenciamento de memória

O runtime inclui coleta de lixo para liberar objetos gerenciados que deixaram de ser alcançáveis. Isso reduz a necessidade de liberar manualmente cada objeto, mas não elimina a importância de cuidar de recursos como arquivos, conexões e streams. Para esses casos, `using` ajuda a encerrar o recurso de forma previsível.

```csharp
using var arquivo = File.OpenRead("dados.txt");
```

## O que ficou claro

No início é comum chamar tudo de “C#”. Agora separo a linguagem, o SDK, as bibliotecas e o runtime porque cada parte tem uma função. Também entendi que coleta de lixo cuida de memória gerenciada, enquanto recursos externos precisam ser descartados corretamente.

**Apresentação usada em sala de aula:** C# e .NET: Começando do Zero.
