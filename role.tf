resource "aws_iam_role" "iam_for_eks" {
  name = "eks-role"
  assume_role_policy= <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "amazone_eks_cluster_policy" {
  policy_arn ="arn:aws:iam:aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.iam_for_eks.name
}