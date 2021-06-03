provider "aws" {
  region                  =  "ap-south-1"
  profile                =   "default"
}
module "mydev"{
  source = "../modules/ec2"
  type= "t2.micro"
}
