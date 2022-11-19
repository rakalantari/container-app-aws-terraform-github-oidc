variable "aws_region" {
  type        = string
  description = "aws region elastic container service"
}

variable "environment_name" {
  type        = string
  description = "name of environment this module belongs to"
}

variable "ecs_cluster_name" {
  type        = string
  description = "name of ecs cluster"
}

variable "ecs_task_cpu_units" {
  type        = number
  description = "ec2 instance VCPU units"
}

variable "ecs_task_memory_units" {
  type        = number
  description = "ec2 instance memory units in MiB"
}

variable "container_image" {
  type        = string
  description = "Container image"
}

variable "host_port_http" {
  type        = number
  description = "port used by host for http access"
}

variable "container_port_http" {
  type        = number
  description = "port used by container for http access"
}

variable "host_port_https" {
  type        = number
  description = "port used by host for https access"
}

variable "container_port_https" {
  type        = number
  description = "port used by container for https access"
}

variable "ecs_service_desired_task_count" {
  type        = number
  description = "desired number of tasks to run at any time by ecs service"
}

variable "ecs_service_launch_type" {
  type        = string
  description = "launch type for ecs service"
}

variable "ecs_service_security_groups_ids" {
  type        = list(string)
  description = "ids of security groups to be applied to ecs service"
}

variable "public_subnets_ids" {
  type        = list(string)
  description = "ids of public subnets to be assigned to ecs service"
}

variable "container_name" {
  type        = string
  description = "name of ecs container"
}

variable "ecs_task_definition_name" {
  type        = string
  description = "name of ecs task definition"
}

variable "ecs_task_execution_role_arn" {
  type        = string
  description = "arn of the ecs task execution role"
}

variable "ecs_task_network_mode" {
  type        = string
  description = "network mode to be used for eacs task definition"
}

variable "ecs_task_requires_compatibilities" {
  type        = list(string)
  description = "required compatibilities for ecs task"
}

variable "ecs_service_name" {
  type        = string
  description = "name of the ecs service"
}

variable "target_group_arn" {
  type        = string
  description = "arn of target group to have ecs container registered to"
}

variable "additional_tags" {
  type        = map(string)
  description = "variable if additional tags are needed"
  default     = {}
}

 