# Minhas anotações: Fundamentos de computação em nuvem

Nesta unidade comecei entendendo nuvem como uma forma de contratar recursos de TI pela rede, em vez de comprar e manter toda a infraestrutura física dentro da organização. Isso inclui processamento, armazenamento, rede, plataformas e aplicações. O provedor administra data centers e oferece recursos que podem ser provisionados conforme a necessidade.

## De onde veio a nuvem

Os slides relacionam a evolução da nuvem a outras formas de organizar a computação:

- **Mainframe:** processamento centralizado, acessado por terminais.
- **Cliente-servidor:** clientes passaram a cuidar de parte do processamento e servidores ofereceram funções como banco de dados, arquivos e aplicações.
- **Virtualização:** permite dividir recursos de um servidor físico em ambientes virtuais isolados e aproveitar melhor o hardware.
- **Utility computing:** ideia de consumir recursos computacionais como um serviço e pagar conforme o uso.
- **Computação em nuvem:** amplia o fornecimento sob demanda pela internet e cria serviços escaláveis acessíveis por diferentes redes e dispositivos.

A virtualização é uma tecnologia importante para a nuvem, mas não é a mesma coisa que computação em nuvem. A nuvem também envolve provisionamento, medição, acesso por rede e gestão do serviço.

## Características que anotei

O material apresenta cinco características essenciais:

1. **Autoatendimento sob demanda:** a pessoa ou equipe consegue provisionar recursos sem abrir uma solicitação manual para cada mudança.
2. **Amplo acesso à rede:** serviços podem ser acessados por diferentes dispositivos e locais, conforme conectividade e permissões.
3. **Pool de recursos:** o provedor compartilha recursos físicos entre clientes e aloca capacidade de forma dinâmica, mantendo isolamento lógico.
4. **Elasticidade rápida:** capacidade pode aumentar ou diminuir para acompanhar alterações de demanda.
5. **Serviço medido:** consumo é acompanhado para cobrança, planejamento e controle.

Estou diferenciando **escalabilidade** de **elasticidade**: escalar é aumentar ou reduzir a capacidade; elasticidade descreve a capacidade de ajustar recursos para acompanhar a demanda, muitas vezes automaticamente. Pagar por uso também não garante, sozinho, que uma solução será mais barata. É preciso acompanhar consumo, dimensionamento e custos.

## Modelos de serviço

O modelo indica quanto da pilha de tecnologia o provedor administra e quanto fica com o cliente.

- **IaaS (Infraestrutura como Serviço):** o provedor oferece recursos como computação, rede e armazenamento. O cliente costuma administrar o sistema operacional, as aplicações, os dados e parte importante das configurações de segurança.
- **PaaS (Plataforma como Serviço):** o provedor administra a infraestrutura e a plataforma. A equipe pode concentrar-se mais no código e nos dados, respeitando os limites do serviço contratado.
- **SaaS (Software como Serviço):** o usuário acessa uma aplicação pronta. O provedor administra a aplicação e sua infraestrutura; o cliente ainda precisa gerenciar usuários, acessos, dados e configurações disponíveis.

Quanto maior a abstração, menor tende a ser o controle operacional direto do cliente. A responsabilidade de segurança é compartilhada e varia conforme serviço, contrato e configuração; não desaparece quando escolho PaaS ou SaaS.

## Modelos de implantação

- **Pública:** serviço oferecido por provedor externo em infraestrutura compartilhada entre clientes.
- **Privada:** ambiente exclusivo para uma organização, mantido internamente ou por terceiro.
- **Híbrida:** combina dois ou mais ambientes e exige planejar integração, identidade, dados e operação.
- **Comunitária:** compartilhada por organizações com necessidades ou requisitos comuns.

A escolha depende de segurança, regulação, desempenho, custos, competências disponíveis e requisitos do negócio. “Nuvem privada” não significa automaticamente segura, e “nuvem pública” não significa que os dados ficam públicos.

## Provedores e arquiteturas próximas da borda

Os slides citam AWS, Microsoft Azure e Google Cloud como provedores populares. Fog computing acrescenta uma camada distribuída entre dispositivos e data centers centrais; edge computing aproxima o processamento da fonte dos dados, às vezes no próprio dispositivo. Essas abordagens podem ajudar quando latência, conectividade ou volume de dados são importantes, por exemplo em IoT e aplicações industriais.

## Para revisar

1. Comparar o que o cliente administra em IaaS, PaaS e SaaS.
2. Explicar a diferença entre virtualização e serviço de nuvem.
3. Escolher um modelo de implantação para um sistema com dados sensíveis e justificar pelas necessidades, sem assumir que um modelo resolve sozinho a segurança.

**Apresentação da aula:** Slide 1.pdf, Unidade I, páginas 1–57.
