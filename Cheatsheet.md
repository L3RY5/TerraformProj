# Heading Level like H1

> this is a block not
> With
> Multiple paragraps


    # Code here with inbdected lines

##### Main

    ==> terraform init : prepare working directory for other commands, initialize the directory and downloads the modules etc needed
>

    ==> terraform plan : show changes requires by the current configuration
>
    ==> terraform plan -var="variableNamre=value" : specify a value at runtime if not the default in variables.tf or terrafrom.tfvars will be used
>EX:  terraform plan -var="instantTypeVar=t2.Micro"
>

    ==>terraform plan -out=savedPlanName :  Create a binary file of the saved configurations, even if the terraform was changed, then you can still create the saved config in this file 
>You can do a  terraform apply SavedPlanName  to run that specific plan
>

    ==> terraform apply : create or update infrastructure
>

    ==> terraform apply -replace="type.localname" :  to get back to the original intented infrastructure
> replace the current resources with a new deployment >> destroys old and creat 
>

    ==> terraform destroy : destroy all  created infrastructure in this project/directory
>

    ==> terraform destroy -target [type.localname] : Destroy that specific infrastructure
>

    ==> terraform validate : validate if the configuration file is correct syntax
>

    ==> terraform fmt : it will check the format of the file, if not correct it will correct the file format and "beautify" the code
>

    ==> 






##### workspace

    ==> terraform workspace show : Show the current workspace
>

    ==> terraform workspace list : give a list of all workspaces created
>

    ==> terraform workspace select [workspaceName] : switch to that workspace
>

    ==> terraform workspace new dev : Create a new workspace with the name dev and switch directly

---------------

    ==> terraform force-unlock : manually unlock the state file if unlocking failed.
>

#####  Terraform state Commmand
    ==> Terraform state list : List resources within the terraform state file 
>
    ==> terraform state mv : moves item with terraform state
    ###
    Can be used to rename an existing resource without destroying and recreating it. 
    beacauise ofn the destructivee nature of this command it will output a backup of the statefile

    SINTAX : terraform state mv [options] SOURCE DESTINATION ==> terraform state mv aws_instance.localName aws_instance.NewLocalname
    ###

>
    ==> terraform  state pull : manually download and output  the state from the remote state file
    ###
    SINTAX : terraforpm  state pull -->
    ###

>
    ==> terraform state push : manually upload a local state  file to remote state  
    ###
    This should rearly be used
    terraform state push
    ###
>
    ==> terraform state rm : Remove items from the terraform state
    ###
    the resources are not destroyed but are just not controlled or no longer managed by terraform.
    the instnace is removed from the statefile, but it is still running on AWzs etc
    ###

>
    ==> terraform state show : show the attributes of a single resource in the state
    ###
    show all the attributes off a single resource in the terraform state
    SYNTAX : terraform state show aws_instance.localName
    ### 

>



