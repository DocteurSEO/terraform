provider "aws" {
  region = "us-east-1"


module "vpc" {
  source             = "./vpc-module"
  cidr_block         = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "us-east-1a"  // Adaptez à votre région si nécessaire
}

module "ec2" {
  source            = "./ec2-module"
  ami_id            = "ami-0fc5d935ebf8bc3bc"  // Remplacez par un AMI valide dans votre région
  instance_type     = "t2.micro"
 // la suite ? 
}
