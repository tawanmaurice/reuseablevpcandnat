# 🌐 Reusable VPC + NAT + S3 Endpoint (Terraform)

A ready-to-clone, production-style **VPC baseline** for AWS — including public/private subnets, NAT gateway, and an S3 VPC endpoint.  
Perfect for quickly spinning up new Terraform environments or reusing as a foundation for future projects.

---

## 🚀 Overview

This Terraform configuration creates:

- **1 VPC** – `10.112.0.0/16`
- **2 Public Subnets** – for Internet-facing resources (AZ 1a, 1b)
- **4 Private Subnets** – for internal workloads (AZ 1a, 1b)
- **Internet Gateway** – enables outbound Internet access from public subnets
- **NAT Gateway** – routes private traffic securely to the Internet
- **S3 Gateway Endpoint** – private access to Amazon S3
- Helpful outputs:
  - `vpc_id`
  - `public_subnet_ids`
  - `private_subnet_ids`
  - `nat_gateway_id`
  - `s3_endpoint_id`

> ⚠️ **Note:** A NAT Gateway accrues hourly and data processing charges.  
> Always `terraform destroy` when finished testing.

---

## 💡 Purpose

This repo exists to make **AWS VPC setup repeatable and fast**.

You can:
1. Clone it for a new project.
2. Search/replace project name and CIDRs.
3. Run `terraform apply` — done.

No more Console clicking. No drift. No re-writing the same boilerplate.

---

## 🧱 Project Structure

| File | Purpose |
|------|----------|
| `vpc.tf` | Defines the VPC and Internet Gateway |
| `subnets.tf` | Declares public and private subnets |
| `route.tf` | Configures route tables and associations |
| `nat.tf` | Creates EIP + NAT Gateway and routes |
| `endpoint-s3.tf` | Adds S3 Gateway VPC Endpoint |
| `outputs.tf` | Exports resource IDs for reuse |
| `.gitignore` | Keeps sensitive/state files out of Git |
| `terraform.lock.hcl` | Locks provider versions for consistency |

---

## ⚙️ Prerequisites

- Terraform ≥ **1.3**
- AWS CLI configured (`aws sts get-caller-identity`)
- IAM permissions for VPC, Subnets, RouteTables, NAT/EIP, and Endpoints

---

## 🏁 Quick Start

```bash
# Clone this repo
git clone https://github.com/tawanmaurice/reuseablevpnandnat.git
cd reuseablevpnandnat

# Initialize Terraform
terraform init

# Review before apply
terraform plan

# Apply changes
terraform apply
