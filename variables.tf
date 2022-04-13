variable "region" {
  description = "AWS Regions"
  type = string
}

variable "name" {
  description = "EKS Cluster Name"
  type = string
}

variable "min_size" {
  description = "Minimum Number Of Nodes"
  type = number
}

variable "max_size" {
  description = "Maximum Number Of Nodes"
  type = number
}

variable "desired_size" {
  description = "Desired Number Of Nodes"
  type = number
}

variable "instance_type" {
  description = "EC2 Instance Type Of The Node Group"
  type = list(string)
}