terraform {
  backend "s3" {
    bucket = "lerys-tf-backend" #bucket naam
    key    = "network/eip.tfstate" #directory/filename
    region = "eu-central-1"
    #dynamodb_table = "lerys-tf-backend_DB" #With this we wilmlm had a lock for the tfstate so that only one person can write(lockID == STRING) into it.
  }
}