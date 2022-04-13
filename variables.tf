variable "name" {
  description = "Name For Resources"
  type = string
}

variable "image" {
  description = "Docker Image"
  type = string
}

variable "container_port" {
  description = "Docker Image Listening Port"
  type = number
}

variable "replicas" {
  description = "Number Of Repolics"
  type= number
}

variable "env_vars" {
  description = "Environment Variables For The App"
  type = map(string)
  default = {}
}