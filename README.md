## Playbook para Instação das Whiteboxs

Para que os elementos reprogramáveis de plano de dados baseados em FPGA e PISA operem adequadamente no testbed é necessário a instalação e configuração de um conjunto de softwares, dentre eles sistemas operacionais, pacotes, aplicativos e suas configurações. Para facilitar o provisionamento desse conjunto de softwares em caso de falhas, foram estudados e analisados algumas ferramentas de automação como Apache Ant, Puppet e Ansible 

O Ansible é um framework de automação e configuração de sistemas que trabalha com a arquitetura cliente-servidor. No arcabouço escolhido não há necessidade de agentes instalados nos clientes, portanto não existem pacotes circulando, e a rede não fica sobrecarregada quando o Ansible não está em execução. É disponibilizado em duas versões, a primeira, chamada de Ansible Core, e o Ansible Tower, ambas são opensource, sendo a última, uma versão comercial.

O Ansible pode usar o protocolo NetConf para comunicação com equipamentos de rede, tais como roteadores e switchs. A ferramenta então estabelece uma conexão segura entre as máquinas via SSH, para garantir a confidencialidade dos dados que serão transmitidos. Alguns módulos permitem o envio de comandos para a CLI  dos equipamentos como roteadores e switchs. A plataforma utiliza arquivos de configuração em formato YAML, e utiliza o formato Jinja2 para ttemplates de configuração

Essas características sustentam a escolha do Ansible como ferramenta de apoio ao provisionamento a automação do conjuntos de softwares da testbed.



### Requisitos

* Ansible
* Python 


### Ansible Galaxy

O Ansible Galaxy faz referência ao site do Galaxy no qual os usuários podem compartilhar funções e a uma ferramenta de linha de comando que permite instalar, criar e gerenciar funções. A função role permite o compartilhamento e a reutilização de tarefas Ansible. O objetivo é que os playbooks não tenham mais task, somente roles. Que seriam centralizadas e reutilizadas para as mesmas operações nas diferentes máquinas do testbed.


A estrutura de armazenamento dos playbooks faz com que as roles sejam armazenadas externamente em repositórios individuais no GitHub. O download das roles para os playbooks dos projetos ocorrerão via Ansible Galaxy. A escolha da task desejada será realizada por meio de variáveis.

> Para executar o playbook execute no seu terminal o comando:

```bash
$ ansible-playbook /playbook/whitebox-install.yml -i invetory/hosts
```



Para mais informações acesse: <br>
[fibre.org.br](https://fibre.org.br/)
