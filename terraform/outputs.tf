# ----------------------------
# Terraform Outputs
# ----------------------------

output "controller_public_ip" {
  description = "Public IP of the Controller instance"
  value       = aws_instance.controller.public_ip
}

output "manager_public_ip" {
  description = "Public IP of the Swarm Manager instance"
  value       = aws_instance.manager.public_ip
}

output "worker_a_public_ip" {
  description = "Public IP of Worker A instance"
  value       = aws_instance.worker_a.public_ip
}

output "worker_b_public_ip" {
  description = "Public IP of Worker B instance"
  value       = aws_instance.worker_b.public_ip
}
