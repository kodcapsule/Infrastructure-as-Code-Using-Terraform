
module "ec2_instance" {
  source        = "../../modules/compute"
  instance_type = var.instance_type

}

