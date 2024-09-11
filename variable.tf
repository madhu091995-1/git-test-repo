variable "vpc" {
  description = "ID of the Existing VPC"
  type = string
  default = "vpc-388f4945"
  
}

variable "keypair_name" {
  description = "Name of the existing SSH key pair in AWS"
  type        = string
  default     = "N_Virginia"
}

variable  "ami_id" {
  description = "instance ami_id"
  type        = string
  default     = "ami-067d1e60475437da2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "security_group_id" {
  description = "ID of the existing security group"
  type        = string
  default     = "sg-021b7b0a1153e4275"
}

variable "subnet_id" {
  description = "ID of the existing subnet"
  type = string
  default = "subnet-4076c11f"
}