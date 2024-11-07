environment = "dev"

# Other dev-specific variables...
vpc_cidr            = "10.0.0.0/16"
web_subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24"]
db_subnet_cidrs     = ["10.0.3.0/24"]
web_instance_type   = "t3.micro"
web_desired_capacity = 1
web_max_size        = 2
web_min_size        = 1
db_instance_class   = "db.t3.micro"
