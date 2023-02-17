# Infrastructure_docker_codetunnel

Couple of extra setup steps here:
1. Deploy the kubernetes manifests.
2. Make a new private end point using Azure CLI (Bash):

AKS_MC_RG=$(az aks show -g CS_Infrastructure_AKS --name Infrastructure --query nodeResourceGroup -o tsv)

To confirm: az network private-link-service list -g $AKS_MC_RG --query "[].{Name:name,Alias:alias,Tags:tags}" -o table

AKS_PLS_ID=$(az network private-link-service list -g $AKS_MC_RG --query "[].{Id:id, Owner:tags.\"k8s-azure-owner-service\"} | [?contains(Owner,'codetunnel')]".Id -o tsv)

az network private-endpoint create -g CS_Infrastructure_USNorthCentral --name aksCodetunnelPE --vnet-name Subnet_CS_Cloud_USNorthCentral --subnet Server_AKS_codetunnel --private-connection-resource-id $AKS_PLS_ID --connection-name connectToAKSCodetunnel


NOTE: if you remove the service from kubernetes (not upgrading, removal) then you need to make sure remove a few things:
- aksCodetunnelPE private-endpoint
- associated vNic in the Server_AKS_codetunnel vnet

4. Register DNS to the pviate-endpoint
  codetunnel.cs.calvin.edu -> 10.230.64.34
