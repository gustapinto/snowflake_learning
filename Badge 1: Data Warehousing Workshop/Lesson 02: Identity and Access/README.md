# Lesson 2: Identity and Access

- Snowflake usa roles para autorização e não permissões por usuário
- Para criação e operação dos *databases* no Snowflake o role mais comum e mais recomendado é o de **SYSADMIN**, com a role de **ACCOUNTADMIN** sendo usado apenas para operações administrativas de mais alto nível, como:
  - Criar orçamentos (*budgets*)
  - Cadastrar novos usuários e roles
  - Etc...
- No Snowflake *ownership* de um item é definido pelo role e não pelo usuário que criou esse item, com a posse do mesmo podendo ser transferido entre roles
- As roles "pais" tem acesso a todos os itens das roles "filhas"
