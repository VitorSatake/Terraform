terraform { 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
    required_version = ">= 1.2.0"
}

provider "aws" {
   region = "us-east-1"
}

/*Primeiro você configura um caminho na variável locals e em seguida define a estrutura do arquivo
zipado na variável data.Quando tudo for executado, a pasta com o arquivo create.py será criada automaticamente.
Assim, ao invés de criar um s3 Bucket, você armazena localmente o arquivo zip gerado.*/

locals{
   lambda_zip_locations = "output/Create.zip"
}
data "archive_file" "list" {
   type        = "zip"
   source_file = "Create.py"
   output_path = local.lambda_zip_locations
}

/*Em seguida, precisaremos definir o recurso necessário e qual o nome desse recurso.
Como nosso objetivo nesse exemplo é criar um banco de dados, vamos criar uma tabela definindo o recurso 
aws_dynamodb_table com nome table_test:
*/
resource "aws_dynamodb_table" "table_test" {
   name             = "table_test"
   hash_key         = "todo_id"
   billing_mode   = "PROVISIONED"
   read_capacity  = 3
   write_capacity = 3
   attribute {
     name = "todo_id"
     type = "S"
   }
}

// importando e usando a o arquivo assume_role_policy.json para autorizar que o lambdaacesse outros serviços
resource "aws_iam_role" "lambda_role" { 
   name = "lambda_role"
   assume_role_policy = file("assume_role_policy.json")
}

// importando e usando a o arquivo policy.json para definir quais ações a sua função 
// Lambda poderá realizar e onde (Resource) essas ações serão realizadas
resource "aws_iam_role_policy" "lambda_policy" {
   name = "lambda_policy"
   role = aws_iam_role.lambda_role.id
   policy = file("policy.json")
}

// Criando a função Lambda
resource "aws_lambda_function" "Lambda_test" {
   function_name = "create_item"
   filename      = local.lambda_zip_locations
   role          = aws_iam_role.lambda_role.arn
   handler       = "Create.lambda_handler"
   runtime       = "python3.10"
}

