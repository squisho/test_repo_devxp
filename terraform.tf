terraform {
  required_providers {
    aws =  {
    source = "hashicorp/aws"
    version = ">= 2.7.0"
    }
  }
}

provider "aws" {
    region = "us-west-2"
}

resource "aws_s3_bucket" "terraform_backend_bucket" {
      bucket = "terraform-state-3g3pqh7db44o49hb6z9aadxmfyqqrm5i1yyfy6t9cyzri"
}

resource "aws_instance" "Instance-ktAjk" {
      ami = data.aws_ami.ubuntu_latest.id
      instance_type = "t2.medium"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.Instance-ktAjk_iam_role_instance_profile.name
}

resource "aws_eip" "Instance-ktAjk_eip" {
      instance = aws_instance.Instance-ktAjk.id
      vpc = true
}

resource "aws_iam_user" "Instance-ktAjk_iam" {
      name = "Instance-ktAjk_iam"
}

resource "aws_iam_user_policy_attachment" "Instance-ktAjk_iam_policy_attachment0" {
      user = aws_iam_user.Instance-ktAjk_iam.name
      policy_arn = aws_iam_policy.Instance-ktAjk_iam_policy0.arn
}

resource "aws_iam_policy" "Instance-ktAjk_iam_policy0" {
      name = "Instance-ktAjk_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Instance-ktAjk_iam_policy_document.json
}

resource "aws_iam_access_key" "Instance-ktAjk_iam_access_key" {
      user = aws_iam_user.Instance-ktAjk_iam.name
}

resource "aws_instance" "Instance-KkDr" {
      ami = data.aws_ami.amazon_latest.id
      instance_type = "t2.small"
      lifecycle {
        ignore_changes = [ami]
      }
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      associate_public_ip_address = true
      vpc_security_group_ids = [aws_security_group.devxp_security_group.id]
      iam_instance_profile = aws_iam_instance_profile.Instance-KkDr_iam_role_instance_profile.name
}

resource "aws_eip" "Instance-KkDr_eip" {
      instance = aws_instance.Instance-KkDr.id
      vpc = true
}

resource "aws_iam_user" "Instance-KkDr_iam" {
      name = "Instance-KkDr_iam"
}

resource "aws_iam_user_policy_attachment" "Instance-KkDr_iam_policy_attachment0" {
      user = aws_iam_user.Instance-KkDr_iam.name
      policy_arn = aws_iam_policy.Instance-KkDr_iam_policy0.arn
}

resource "aws_iam_policy" "Instance-KkDr_iam_policy0" {
      name = "Instance-KkDr_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Instance-KkDr_iam_policy_document.json
}

resource "aws_iam_access_key" "Instance-KkDr_iam_access_key" {
      user = aws_iam_user.Instance-KkDr_iam.name
}

resource "aws_s3_bucket" "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ" {
      bucket = "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ"
}

resource "aws_s3_bucket_public_access_block" "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_access" {
      bucket = aws_s3_bucket.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ.id
      block_public_acls = true
      block_public_policy = true
}

resource "aws_iam_user" "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam" {
      name = "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam"
}

resource "aws_iam_user_policy_attachment" "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy_attachment0" {
      user = aws_iam_user.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam.name
      policy_arn = aws_iam_policy.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy0.arn
}

resource "aws_iam_policy" "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy0" {
      name = "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy_document.json
}

resource "aws_iam_access_key" "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_access_key" {
      user = aws_iam_user.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam.name
}

resource "aws_sns_topic" "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_sns_topic" {
      name = "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_sns_topic"
}

resource "aws_glacier_vault" "Glacier-HXCo-maPv-iYUr-zfkK-hOIM" {
      name = "Glacier-HXCo-maPv-iYUr-zfkK-hOIM"
      notification {
        sns_topic = aws_sns_topic.Glacier-HXCo-maPv-iYUr-zfkK-hOIM_sns_topic.arn
        events = ["ArchiveRetrievalCompleted", "InventoryRetrievalCompleted"]
      }
}

resource "aws_iam_user" "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam" {
      name = "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam"
}

resource "aws_iam_user_policy_attachment" "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy_attachment0" {
      user = aws_iam_user.Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam.name
      policy_arn = aws_iam_policy.Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy0.arn
}

resource "aws_iam_policy" "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy0" {
      name = "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy0"
      path = "/"
      policy = data.aws_iam_policy_document.Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy_document.json
}

resource "aws_iam_access_key" "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_access_key" {
      user = aws_iam_user.Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam.name
}

resource "aws_iam_instance_profile" "Instance-ktAjk_iam_role_instance_profile" {
      name = "Instance-ktAjk_iam_role_instance_profile"
      role = aws_iam_role.Instance-ktAjk_iam_role.name
}

resource "aws_iam_instance_profile" "Instance-KkDr_iam_role_instance_profile" {
      name = "Instance-KkDr_iam_role_instance_profile"
      role = aws_iam_role.Instance-KkDr_iam_role.name
}

resource "aws_iam_role" "Instance-ktAjk_iam_role" {
      name = "Instance-ktAjk_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role" "Instance-KkDr_iam_role" {
      name = "Instance-KkDr_iam_role"
      assume_role_policy = "{\n  \"Version\": \"2012-10-17\",\n  \"Statement\": [\n    {\n      \"Action\": \"sts:AssumeRole\",\n      \"Principal\": {\n        \"Service\": \"ec2.amazonaws.com\"\n      },\n      \"Effect\": \"Allow\",\n      \"Sid\": \"\"\n    }\n  ]\n}"
}

resource "aws_iam_role_policy_attachment" "Instance-ktAjk_iam_role_Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy0.arn
      role = aws_iam_role.Instance-ktAjk_iam_role.name
}

resource "aws_iam_role_policy_attachment" "Instance-KkDr_iam_role_Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy0.arn
      role = aws_iam_role.Instance-KkDr_iam_role.name
}

resource "aws_iam_role_policy_attachment" "Instance-ktAjk_iam_role_Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy0.arn
      role = aws_iam_role.Instance-ktAjk_iam_role.name
}

resource "aws_iam_role_policy_attachment" "Instance-KkDr_iam_role_Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy0_attachment" {
      policy_arn = aws_iam_policy.Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy0.arn
      role = aws_iam_role.Instance-KkDr_iam_role.name
}

resource "aws_subnet" "devxp_vpc_subnet_public0" {
      vpc_id = aws_vpc.devxp_vpc.id
      cidr_block = "10.0.0.0/25"
      map_public_ip_on_launch = true
      availability_zone = "us-west-2a"
}

resource "aws_subnet" "devxp_vpc_subnet_public1" {
      vpc_id = aws_vpc.devxp_vpc.id
      cidr_block = "10.0.128.0/25"
      map_public_ip_on_launch = true
      availability_zone = "us-west-2b"
}

resource "aws_internet_gateway" "devxp_vpc_internetgateway" {
      vpc_id = aws_vpc.devxp_vpc.id
}

resource "aws_route_table" "devxp_vpc_routetable_pub" {
      route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.devxp_vpc_internetgateway.id
      }
      vpc_id = aws_vpc.devxp_vpc.id
}

resource "aws_route" "devxp_vpc_internet_route" {
      route_table_id = aws_route_table.devxp_vpc_routetable_pub.id
      destination_cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.devxp_vpc_internetgateway.id
}

resource "aws_route_table_association" "devxp_vpc_subnet_public_assoc" {
      subnet_id = aws_subnet.devxp_vpc_subnet_public0.id
      route_table_id = aws_route_table.devxp_vpc_routetable_pub.id
}

resource "aws_vpc" "devxp_vpc" {
      cidr_block = "10.0.0.0/16"
      enable_dns_support = true
      enable_dns_hostnames = true
}

resource "aws_security_group" "devxp_security_group" {
      vpc_id = aws_vpc.devxp_vpc.id
      name = "devxp_security_group"
      ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
      egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
}

data "aws_iam_policy_document" "Instance-ktAjk_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.Instance-ktAjk.arn]
      }
}

data "aws_ami" "ubuntu_latest" {
      most_recent = true
      owners = ["099720109477"]
      filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64*"]
      }
      filter {
        name = "virtualization-type"
        values = ["hvm"]
      }
}

data "aws_iam_policy_document" "Instance-KkDr_iam_policy_document" {
      statement {
        actions = ["ec2:RunInstances", "ec2:AssociateIamInstanceProfile", "ec2:ReplaceIamInstanceProfileAssociation"]
        effect = "Allow"
        resources = ["arn:aws:ec2:::*"]
      }
      statement {
        actions = ["iam:PassRole"]
        effect = "Allow"
        resources = [aws_instance.Instance-KkDr.arn]
      }
}

data "aws_ami" "amazon_latest" {
      most_recent = true
      owners = ["585441382316"]
      filter {
        name = "name"
        values = ["*AmazonLinux*"]
      }
      filter {
        name = "virtualization-type"
        values = ["hvm"]
      }
}

data "aws_iam_policy_document" "Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ_iam_policy_document" {
      statement {
        actions = ["s3:ListAllMyBuckets"]
        effect = "Allow"
        resources = ["arn:aws:s3:::*"]
      }
      statement {
        actions = ["s3:*"]
        effect = "Allow"
        resources = [aws_s3_bucket.Bucket-VmfO-qHna-ErXK-sadaugcE-lDHZ.arn]
      }
}

data "aws_iam_policy_document" "Glacier-HXCo-maPv-iYUr-zfkK-hOIM_iam_policy_document" {
      statement {
        actions = ["glacier:InitiateJob", "glacier:GetJobOutput", "glacier:UploadArchive", "glacier:InitiateMultipartUpload", "glacier:AbortMultipartUpload", "glacier:CompleteMultipartUpload", "glacier:DescribeVault"]
        effect = "Allow"
        resources = [aws_glacier_vault.Glacier-HXCo-maPv-iYUr-zfkK-hOIM.arn]
      }
      statement {
        actions = ["glacier:ListVaults"]
        effect = "Allow"
        resources = ["*"]
      }
}

