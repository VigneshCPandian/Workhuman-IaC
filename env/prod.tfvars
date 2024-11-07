environment = "prod"

# Other production-specific variables...
vpc_cidr            = "10.2.0.0/16"
web_subnet_cidrs    = ["10.2.1.0/24", "10.2.2.0/24"]
db_subnet_cidrs     = ["10.2.3.0/24"]
web_instance_type   = "t3.medium"
web_desired_capacity = 3
web_max_size        = 5
web_min_size        = 3
db_instance_class   = "db.t3.medium"
