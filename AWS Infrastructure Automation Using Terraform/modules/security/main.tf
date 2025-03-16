resource aws_iam_role ec2_role {
  name = ec2_role

  assume_role_policy = jsonencode({
    Version = 2012-10-17
    Statement = [{
      Action = stsAssumeRole
      Principal = {
        Service = ec2.amazonaws.com
      }
      Effect   = Allow
      Sid      = 
    }]
  })
}

resource aws_iam_role_policy ec2_policy {
  name = ec2_policy
  role = aws_iam_role.ec2_role.id

  policy = jsonencode({
    Version = 2012-10-17
    Statement = [{
      Action = s3
      Resource = 
      Effect   = Allow
    }]
  })
}
