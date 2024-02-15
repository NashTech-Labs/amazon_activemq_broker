resource "aws_mq_broker" "mq_broker" {
  broker_name                = var.broker_name
  engine_type                = "ActiveMQ"
  engine_version             = var.engine_version
  host_instance_type         = var.host_instance_type
  security_groups            = [aws_security_group.allow_gui.id]
  publicly_accessible        = true
  deployment_mode            = var.deployment_mode
  auto_minor_version_upgrade = true
  configuration {
    id       = aws_mq_configuration.mq_configuration.id
    revision = aws_mq_configuration.mq_configuration.latest_revision
  }

  logs {
    general = var.logs_general_enabled

  }

  subnet_ids = [aws_subnet.public_subnets_a.id, aws_subnet.public_subnets_b.id]

  user {
     username = var.admin_username
      password = var.admin_password
      console_access = true
      groups = ["devops"]
  }
}
