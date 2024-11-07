environment = "stage"

# Other stage-specific variables...
vpc_cidr            = "10.1.0.0/16"
web_subnet_cidrs    = ["10.1.1.0/24", "10.1.2.0/24"]
db_subnet_cidrs     = ["10.1.3.0/24"]
web_instance_type   = "t3.small"
web_desired_capacity = 2
web_max_size        = 3
web_min_size        = 2
db_instance_class   = "db.t3.small"
