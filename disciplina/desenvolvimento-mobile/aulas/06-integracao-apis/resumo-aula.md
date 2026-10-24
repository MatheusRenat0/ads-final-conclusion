# Resumo — Integração com APIs

Uma API permite que o aplicativo troque informações com um serviço remoto. Essa comunicação depende de rede e pode falhar por falta de conexão, demora, autenticação, resposta do servidor ou formato inesperado. Por isso, a tela deve mostrar claramente quando está carregando, quando recebeu dados, quando não há resultados e quando aconteceu um erro.

No código, é útil deixar a chamada HTTP e a conversão dos dados numa camada própria. Os dados recebidos (DTOs) representam o formato combinado com o servidor; podem ser convertidos para modelos que façam mais sentido para as regras do aplicativo. Requisições assíncronas precisam respeitar cancelamento e tempo limite.

Também entendi que uma chave privada não fica realmente protegida dentro do APK. O exemplo Retrofit e os exercícios de tratamento de respostas estão nas [anotações](./anotacoes.md); a integração depende de cliente HTTP, serializador e endereço configurados no projeto.
