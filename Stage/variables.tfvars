environment_name = "stage"

ecs_task_execution_role_name = "WebAppECSTaskExecutionRole"
iam_role_policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
ecs_iam_instance_profile_name = "ecs-iam-instance-profile"

vpc_cidr_block = "10.123.0.0/16"
enable_dns_hostnames = true
enable_dns_support = true
availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d"]
public_subnets_cidr_blocks = ["10.123.0.0/24", "10.123.1.0/24", "10.123.2.0/24", "10.123.3.0/24"]
private_subnets_cidr_blocks = ["10.123.10.0/24", "10.123.11.0/24", "10.123.12.0/24", "10.123.13.0/24"]

http_target_group_name = "http-target-group"
http_target_group_port = 80
http_target_group_protocol = "HTTP"
http_target_group_target_type = "ip"
http_target_group_load_balancing_algorithm_type = "round_robin"
load_balancer_name = "load-balancer"
load_balancer_type = "application"
load_balancer_internal = false
load_balancer_enable_deletion_protection = false
https_listener_port = 443
https_listener_protocol = "HTTPS"
https_listener_ssl_policy = "ELBSecurityPolicy-2016-08"
http_listener_port = 80
http_listener_protocol = "HTTP"

ecs_cluster_name  = "ecs-cluster"
ecs_task_definition_name = "ecs-task-definition"
ecs_task_network_mode = "awsvpc"
ecs_task_requires_compatibilities = ["FARGATE"]
ecs_task_cpu_units = 256
ecs_task_memory_units = 512
ecs_service_name = "ecs-service"
container_image = "955658816514.dkr.ecr.us-west-2.amazonaws.com/elastic-container-repository:latest"
host_port_http = 80
container_port_http = 80
host_port_https = 443
container_port_https = 443
ecs_service_desired_task_count = 1
ecs_service_launch_type = "FARGATE"
container_name = "ecs-container"

autoscaling_target_min_capacity = 3
autoscaling_target_max_capacity = 5
autoscaling_target_scalable_dimension = "ecs:service:DesiredCount"
vautoscaling_target_service_namespace = "ecs"
autoscaling_policy_name_prefix = "autoscaling_policy"
autoscaling_policy_type_memory = "TargetTrackingScaling"
autoscaling_policy_predefined_metric_type_memory = "ECSServiceAverageMemoryUtilization"
autoscaling_policy_target_value_memory = 80
autoscaling_policy_type_cpu = "TargetTrackingScaling"
autoscaling_policy_predefined_metric_type_cpu = "ECSServiceAverageCPUUtilization"
autoscaling_policy_target_value_cpu = 90

load_balancer_security_group_name = "load_balancer_security_group"
load_balancer_security_group_description = "security group for load balancer"
ecs_service_security_group_name = "ecs_service_security_group"
ecs_service_security_group_description = "security group for ecs instances within cluster"

hosted_zone_name = "rakalantari.com"
sub_domain = "stageapp"