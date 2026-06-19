# TrabalhoDocker_2026
trabalho docker 2026
# Ambiente Docker do Projeto

## Sobre

A estrutura Docker deste projeto foi desenvolvida por **Yan Kayo Dias da Cruz**, aluno do **Instituto Federal Goiano (IF Goiano) - Campus Ceres**, no curso de **Bacharelado em Sistemas de Informação**, durante a disciplina de **Serviços de Redes de Computadores**, ministrada pelo professor **Roitier Campos Gonçalves**.

O objetivo da configuração é disponibilizar um ambiente completo para execução da aplicação utilizando containers Docker, permitindo que todos os serviços sejam iniciados de forma simples e padronizada.

## Estrutura do Ambiente

A aplicação foi implantada utilizando Docker Compose, sendo composta por cinco containers principais: **Nginx, Spring Boot, MySQL, phpMyAdmin** e um **container auxiliar responsável pela inicialização do banco de dados**.

O **container Nginx** atua como proxy reverso, recebendo todas as requisições HTTP dos usuários e encaminhando-as para os serviços apropriados.
As **requisições destinadas à aplicação** são direcionadas ao container Spring Boot, enquanto o acesso administrativo ao banco de dados é realizado através do phpMyAdmin.

A **aplicação Spring Boot** implementa a lógica de negócio e realiza o acesso aos dados utilizando JPA/Hibernate. 
O **armazenamento persistente** é realizado pelo MySQL, que possui volume dedicado para garantir a persistência dos dados.

A **comunicação entre os containers** é realizada por meio de duas redes Docker: uma rede voltada para o tráfego web (**network-proxy-r**) e outra para o acesso ao banco de dados (**network-sql**), proporcionando maior organização e isolamento dos serviços.

## Topologia da rede logica

[Visualizar Topologia da Rede Lógica](https://run.clickup.ai/90171310349/c11e66fe-e854-4ae5-86a8-434340991008/topologia-rede-logica.html)

## Requisitos funcionais

| ID | Nome do Requisito | Descrição | Prioridade |
|----|-------------------|------------|------------|
| RF01 | Orquestração do Ambiente | O sistema deve permitir a inicialização de todo o ambiente através de um único comando utilizando Docker Compose. | Alta |
| RF02 | Servidor Web Nginx | O ambiente deve possuir um container para o servidor web Nginx. | Alta |
| RF03 | Serviço PHP | O ambiente deve possuir um container para execução da aplicação PHP. | Alta |
| RF04 | Banco de Dados MySQL | O ambiente deve possuir um container para o banco de dados MySQL. | Alta |
| RF05 | Proxy Reverso | O Nginx deve atuar como Proxy Reverso, encaminhando as requisições para a aplicação PHP. | Alta |
| RF06 | Processamento da Aplicação | O servidor de aplicação deve processar requisições PHP e retornar respostas ao Nginx. | Alta |

## Requisitos Não funcionais 

| ID | Nome do Requisito | Descrição | Prioridade |
|----|-------------------|------------|------------|
| RNF01 | Separação de Serviços | A arquitetura deve separar os serviços de Proxy Reverso, Aplicação PHP e Banco de Dados em containers distintos. | Média |
| RNF052 | Tempo de Inicialização | Todo o ambiente deve estar operacional em até 30 segundos após a execução do comando de inicialização. | Alta |
| RNF03 | Dependência de Inicialização | Containers dependentes do banco de dados somente poderão iniciar suas aplicações após a confirmação de que o MySQL está totalmente carregado e apto a receber conexões. | Alta |
|RNF07 |Simplicidade de Infraestrutura|O ambiente deve ser executado em uma única máquina virtual ou computador pessoal utilizando Docker, sem a necessidade de servidores físicos dedicados ou infraestrutura complexa.|Média|


# Comandos basicos Docker 

## Pré-requisitos
* Docker instalado
* Docker Compose instalado
  
## Verificar versões:
docker --version
docker compose version

## Subir o Ambiente
docker compose up -d

## Verificar os containers em execução:
docker ps

## Visualizar Logs
docker compose logs
docker compose logs -f mysql

## Entrar em um Container
docker exec -it app-java bash

## Remover Containers, Redes e Volumes
docker compose down -v

# Endereços para a utilização do site

| URL | Destino |
|------|----------|
| http://localhost/ | Aplicação Spring Boot via Nginx |
| http://localhost/elementos | Lista de elementos |
| http://localhost/elementos/1 | Detalhes de um elemento |
| http://localhost/admin | phpMyAdmin |
