# Provisioning of IAM Users & Polices using terraform on AWS

In this project, we will be creating IAM roles for let's say new users and assign specific polices. 

![](https://github.com/bhikeshkhute/Provisioning-of-IAM-Users-Polices-using-terraform-on-AWS/blob/master/tree_structure.JPG) | ![](https://github.com/bhikeshkhute/Provisioning-of-IAM-Users-Polices-using-terraform-on-AWS/blob/master/IAM_Project.jpg)

The structure of the project is as follow:

1. Modules
	- mainapp - It is the main file which creates the user and attach the polices.
	- policies - It consits of different policies applicable for different user positions. 
		-carch - It is abbreviated as "Cloud Architecture" position where we have provided full access to every resouce in AWS.
		-cdev - It is abbreviated as "Cloud Engineer" position where we have provided only read-write access to specific resource(say EC2 and S3). 
		-cops - It is abbreviated as "Cloud Operations Engineer" position where we have provided readonly access to specific resources. 

2. main.tf - It calls the mainapp module with specific data/variables such as name and department of the new user.

3. create.sh - It is custom made shell script to easy/automate the user creation via automation. We just to fill in the details and everything will get provisioned. 

4. LOGS - As soon as a new user is created, all the data will be logged into this folder for audit/record purposes.

#Prerequisite for the project

Terraform Version 1.3.9 or >

# Steps to run the project

1. Cloning the repo

```
git clone https://github.com/bhikeshkhute/Provisioning-of-IAM-Users-Polices-using-terraform-on-AWS.git
```

2. Intializing Terraform & Running the script to create the user

```
terraform init
```

```
sh create.sh
```

3. Destroying the resources

```
terraform destroy -auto-approve
```
---
Note: The script only creates the resources and doesn't delete the resources once created. To delete the same, we have to manually run the above command.

For any queries, kindly connect me on - bhikesh.khute@outlook.com
