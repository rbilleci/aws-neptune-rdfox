# RDFOX Setup Instructions

1. Make sure to run `aws configure` and set the correct keys and region
2. Add your RDFox.lic file to the directory
3. Run the following commands to configure the license, role name, and role password. Replace the values `admin`
   and `password` below:

        aws ssm put-parameter --name "/rdfox/role" --value admin --type "String" --overwrite
        aws ssm put-parameter --name "/rdfox/role-password" --value password --type "String" --overwrite
        aws ssm put-parameter --name "/rdfox/license" --type "String" --value "$(cat RDFox.lic)" --overwrite   

4. From the AWS Management Console, open CloudFormation and deploy the template.yaml file. During the deployment, you'll
   need to specify:
    - Your VPC
    - Three subnets inside your VPC. For resiliency, the service is allowed
    - CPU and memory settings for the Fargate instance. Please keep in mind the CPU and memory restrictions defined
      here:
      https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS_Fargate.html
   
5. After the Fargate service is up and running, you can access RDFOX at: `http://<FARGATE_IP>:12110/console`
