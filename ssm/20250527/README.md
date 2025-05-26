Using IAM Role.

AWS Managed Policy
- AmazonEC2FullAccess
- AmazonSSMAutomationRole

Custemer Managed Policy

``` 
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "iam:PassRole",
                "kms:Decrypt"
            ],
            "Resource": "*"
        }
    ]
}
``` 
