data "aws_iam_policy_document" "ecs_task_execution_role" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = format("${var.ecs_task_execution_role_name}-${var.environment_name}")
  assume_role_policy = data.aws_iam_policy_document.ecs_task_execution_role.json

  tags = merge(
    { "Environment" = var.environment_name },
    { "Name" = format("ecs_task_execution_role-${var.environment_name}") },
    var.additional_tags
  )
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = var.iam_role_policy_arn
}

