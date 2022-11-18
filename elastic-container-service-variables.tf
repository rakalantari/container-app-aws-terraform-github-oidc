variable "ecs_cluster_name" {
  type        = string
  description = "name of ecs cluster"
  default     = "ecs-cluster"
}

variable "ecs_task_cpu_units" {
  type        = number
  description = "instance VCPU units"
  default     = 256
}

variable "ecs_task_memory_units" {
  type        = number
  description = "instance memory units in MiB"
  default     = 512
}

variable "container_image" {
  type        = string
  description = "Container image"
  default     = "955658816514.dkr.ecr.us-west-2.amazonaws.com/elastic-container-repository:latest"
}

variable "host_port_http" {
  type        = number
  description = "port used by host for http access"
  default     = 80
}

variable "container_port_http" {
  type        = number
  description = "port used by container for http access"
  default     = 80
}

variable "host_port_https" {
  type        = number
  description = "port used by host for https access"
  default     = 443
}

variable "container_port_https" {
  type        = number
  description = "port used by container for https access"
  default     = 443
}

variable "ecs_service_desired_task_count" {
  type        = number
  description = "desired number of tasks to run at any time by ecs service"
  default     = 1
}

variable "ecs_service_launch_type" {
  type        = string
  description = "launch type for ecs service"
  default     = "FARGATE"
}

variable "container_name" {
  type        = string
  description = "name of web app container"
  default     = "ecs-container"
}

variable "ecs_task_definition_name" {
  type        = string
  description = "name of ecs task definition"
  default     = "ecs-task-definition"
}

variable "ecs_task_network_mode" {
  type        = string
  description = "network mode to be used for eacs task definition"
  default     = "awsvpc"
}

variable "ecs_task_requires_compatibilities" {
  type        = list(string)
  description = "required compatibilities for ecs task"
  default     = ["FARGATE"]
}

variable "ecs_service_name" {
  type        = string
  description = "name of the ecs service"
  default     = "ecs-service"
}


 