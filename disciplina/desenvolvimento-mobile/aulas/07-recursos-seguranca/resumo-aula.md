# Resumo: Recursos do dispositivo e segurança

Câmera, localização e notificações só devem ser usadas quando fazem parte de uma necessidade clara do aplicativo. O pedido de permissão faz mais sentido no momento em que a pessoa tenta usar o recurso, acompanhado de uma explicação. Se a permissão for recusada ou revogada depois, o aplicativo precisa continuar tratando esse caso com uma alternativa adequada.

Segurança também é proteger os dados que passam pela rede ou ficam armazenados, limitar o que é coletado e não expor credenciais em logs. A autorização de uma ação deve ser confirmada pelo servidor quando há um serviço remoto; esconder um botão na interface não impede uma chamada direta ao endpoint.

As [anotações](./anotacoes.md) trazem situações para mapear permissões e decidir o que fazer depois de uma recusa. As APIs e exigências específicas precisam corresponder à versão e à configuração do projeto.
