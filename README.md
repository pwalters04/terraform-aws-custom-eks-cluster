# Terraform AWS Custom EKS Module
Basic Custom EKS Module
## Example

```hcl
locals {
  cluster_name = "example-eks-cluster"
}

module "eks_cluster" {
  source  = "app.terraform.io/VeloCloud-Terraform/custom-eks-cluster/aws"
  version = "x.x.x"
  name = local.cluster_name
  max_size = 2
  min_size = 1
  desired_size = 1
  instance_type = ["t3.small"]
  region = var.region
}

resource "time_sleep" "wait_200_secs" {
  depends_on = [module.eks_cluster.cluster_name]
  create_duration = "200s"
}

resource "null_resource" "config" {
  triggers = {
    always = timestamp()
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = <<EOT
      set -e
      echo 'Applying Auth ConfigMap with kubectl...'
      aws eks wait cluster-active --name '${local.cluster_name}' --region=${var.region}
      aws eks update-kubeconfig --name '${local.cluster_name}' --alias '${local.cluster_name}-${var.region}' --region=${var.region}
    EOT
  }
  depends_on = [module.eks_cluster,time_sleep.wait_200_secs]
}
```
## Resources
| Name | Type |
|------|------|
| [aws_iam_policy.node_additional](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_eks_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |
| [aws_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

