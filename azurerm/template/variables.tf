#
# Organization Common Variables, alphabetized
#

variable "environment" {
  description = "Environment of the Resource"
  type        = string
  
  validation {
    condition     = contains(["dev", "test", "prod"], var.environment)
    error_message = "Environment value should be one of [\"dev\", \"test\", \"prod\"]."
  }
}

# az account list-locations -o table
variable "location" {
  description = "The Azure Region where the Resource should exist"
  type        = string
}

variable "resource_group_name" {
  description = "The Name which should be used for this Resource"
  type        = string
}

variable "tags" {
  description = "A mapping of tags which should be assigned to the Resource"
  type        = map(string)
  default     = {}
}

#
# Module Specific Variables, alphabetized
#

variable "name" {
  description = "The Name of the Resource"
  type        = string
}