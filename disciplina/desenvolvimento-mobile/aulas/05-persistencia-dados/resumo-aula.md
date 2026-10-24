# Resumo: Persistência de dados

Persistir dados significa manter informações disponíveis mesmo depois de fechar o aplicativo. Antes de escolher onde guardar algo, preciso perguntar que tipo de dado é, como será consultado e se pode ser reconstruído.

Preferências simples podem ficar em armazenamento próprio para esse fim; dados relacionados e consultados por critérios costumam combinar com um banco local como Room; arquivos são adequados para determinados conteúdos. Room organiza a persistência em entidades, DAOs e uma instância de banco. Quando o esquema muda, migrações ajudam a preservar os dados de quem já usa o app.

Operações de leitura e escrita não devem travar a interface. Também não devo tratar preferências comuns como cofre de senhas ou tokens. O exemplo e as questões de escolha de armazenamento estão nas [anotações](./anotacoes.md); o fragmento precisa das dependências e da configuração de Room do projeto.
