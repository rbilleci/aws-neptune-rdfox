
Deploys RDFox

Instructions:
1. Make sure to run `aws configure` and set the correct keys and region
2. Add your RDFox.lic file to the directory
3. Run the following to set the license in an ssm parameter:
        
        aws ssm put-parameter --name "/rdfox/license" --type "String" --value "$(cat RDFox.lic)" --overwrite   

4. From the AWS Management Console, open CloudFormation and deploy the template.yaml file.
