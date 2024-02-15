resource "aws_mq_configuration" "mq_configuration" {
  description    = "MQ Configuration"
  name           = var.mq_configuration
  engine_type    = "ActiveMQ"
  engine_version = var.engine_version

 data = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA
}