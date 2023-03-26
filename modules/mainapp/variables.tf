variable "name" {
  description = "Desired name for the IAM user"
  type        = string
  default     = "finise"
}

variable "carch" {
  description = "Whether to create the architect user"
  type        = bool
  default     = false
}

variable "cdev" {
  description = "Whether to create the developer user"
  type        = bool
  default     = false
}

variable "cops" {
  description = "Whether to create the ops user"
  type        = bool
  default     = false
} 

variable "policytype" {
  description = "Naming convention of the type of policy"
  type        = string
  default     = "Custom"
}
