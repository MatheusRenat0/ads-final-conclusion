# Resumo: Kotlin e ambiente Android

Nesta aula revi como transformar um problema em passos claros e comecei a relacionar essa lógica com Kotlin. Uma função deve ter uma responsabilidade compreensível, receber os dados de que precisa e devolver um resultado definido. Validar entradas evita que valores inesperados produzam resultados incorretos.

Em Kotlin, `val` é usado quando não preciso trocar a referência depois de inicializá-la, enquanto `var` permite atribuir outro valor. A linguagem também diferencia tipos anuláveis e não anuláveis, o que me ajuda a tratar explicitamente dados que podem estar ausentes. `require` é uma forma de validar argumentos de uma função.

O Android Studio reúne editor, Gradle, SDK, emulador e depurador. O código, os recursos, o manifesto e os arquivos de build cumprem papéis diferentes dentro do projeto. A configuração do Gradle deve ser compatível com o projeto e guardar suas dependências; informações secretas não devem ser colocadas no código versionado.

Para entender melhor, preciso praticar funções com entradas válidas e inválidas, além de localizar as partes principais de um projeto Android. Veja as [anotações e exercícios](./anotacoes.md) e o [fragmento Kotlin](./exemplos.kt), que depende de configuração compatível no projeto.
