## Whitebox PISCES P4 Switch 

### Requisitos

* Projeto P4 Compilado
* Ruby 2.2 ou superior
* OMF EC

### Visão Geral 

A Whitebox serve como um componente para regular o fluxo de dados de acordo com o controlador SDN Software Defined Networks. Ao contrário do OVS Open Virtual Switch convencional, a Whitebox é apenas um switch cru e vazio que não tem inteligência. Para poder operar, as máquinas Whitebox requerem um software de comutação virtual que possa ser incorporado diretamente.

A Whitebox trabalha como um componente para regular o fluxo de dados de acordo com o controlador SDN. Ao contrário OVS comum, a Whitebox é apenas um switch sem um controlador. Para funcionar como switch inteligente, requerem um software de comutação que possa ser configurado pelo controlador SDN. 

As máquinas possuem todas suas placas de rede ethernet mapeadas em um switch OVS, com aceleração via Data Plane Development (DPDK). Os avanços recentes em interfaces de rede permitem o aumento desempenho, devido ao processamento de pacotes de baixa latência usando o DPDK, essa estrutura permite que as aplicações recebam dados diretamente das interfaces de rede DPDK, eliminando em grande partes os gargalos do processamento comum de pacotes no nível do sistema operacional baseado em interrupção. 

O software que recebe o arquivo compilado da linguagem P4 é uma extensão do projeto PISCES Programmable Protocol-Independent Software Switch), esse tipo de arquitetura possibilita especificar como os pacotes serão processados e encaminhados, através de um domínio específico de alto nível.

Isso permite de forma rápida, modificar o comportamento de encaminhamento dos pacotes desses switchs virtuais. Atualmente a modificação nas arquiteturas desses equipamentos exigem conhecimento profundo no código do switch e ampla experiência em desing de protocolos de rede e Internet. O Projeto PISCES permite grande otimização grande, são cerca de 40 vezes mais concisos  do que os programas equivalentes em código nativo para a troca de software.

 Além disso, as Whitebox também devem receber ordens do controlador SDN para poderem funcionar. Essa é a diferença mais fundamental entre as Whitebox e os switchs convencionais.


### Controlador Whitebox

Os controladores das máquinas Whitebox, recebem um arquivo P4 (já compilado) e realização a reprogramação do OVS que existe dentro de cada máquina, de acordo com a extensão do projeto PISCES (https://github.com/P4-vSwitch/vagrant).

A unica possibilidade desse recurso é instanciação de um equipamento de rede em L2, onde o pipeline do switch pode ser reprogramado, assim o usuário não fica limitado as condições (tabelas e protocolos suportados) do OpenFlow.

Existem ainda 2 outros tipos de controladores, o primeiro que faz a costura através de VLANs no switch PRONTO. Onde o usuário especifica quais portas físicas do swtich ele deseja conectar as suas máquinas, montando assim a topologia lógica.

Caso for de interesse do usuário, o testbed também conta com um RC em uma máquina de grande poder computacional, que COMPILA o projeto feito de Verilog. O usuário precisa apenas passar o arquivo como parâmetro (.tar) e irá receber o arquivo .bit pronto para ser descarregado na máquina NetFPGA desejada. 


> Compacte o seu projeto em um arquivo do tipo tar.gz com o comando. O nome informado no arquivo deve ser o mesmo referenciado dentro do script ec.rb

```bash
$ tar -czvf seu_projeto.tar.gz
```
> Copie o arquivo para o mesmo diretório do arquivo deploy.rb, e execute o comando abaixo

```bash
$ omf_ec deploy.rb
```
> Após o tempo determinado no controlador, o experimentor retornará ao usuário um arquivo (.txt) com as métricas informados no script EC contendo os dados referente ao experimento.

Para mais informações acesse: <br>
[fibre.org.br](https://fibre.org.br/)

