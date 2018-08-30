#!/bin/bash
# Demonstrates creating azure storage

# Prerequisite AZURE_STORAGE_ACCOUNT needs to exist

# Usage Change file paths as necessary and 

export AZURE_STORAGE_ACCOUNT=bobschroeder0729
export AZURE_STORAGE_ACCESS_KEY=XRzZkzsgyGj/YpR9AJvwJH47Q53MpBRpLLnnPqqT00dxKnnUHgV6/L+cj1HzO8zaAQMATVpl1chSrPqMKxyGDQ==

export container_name="uploadcontainer"
export blob_name="blobname"

export file_to_upload="C:\repo\NorthwestMutualDemo\cli\images\HelloWorld.png"
export destination_file="C:\repo\NorthwestMutualDemo\cli\images\DownloadHelloWorld.png"

echo "Creating the container..."
az storage container create --name $container_name

echo "Uploading the file..."
az storage blob upload --container-name $container_name --file $file_to_upload --name $blob_name

echo "Listing the blobs..."
az storage blob list --container-name $container_name --output table

echo "Downloading the file..."
az storage blob download --container-name $container_name --name $blob_name --file $destination_file --output table



echo "Creating States Table"
az storage table create -n StatesTable

echo "Deleting Data"
az storage entity delete -t StatesTable --partition-key AllStates --row-key AK
az storage entity delete -t StatesTable --partition-key AllStates --row-key WI

echo "Inserting Data"
az storage entity insert -t StatesTable -e PartitionKey=AllStates RowKey=AK Content=Alaska
az storage entity insert -t StatesTable -e PartitionKey=AllStates RowKey=WI Content=Wisconsin

echo "Query Data"
az storage table list
az storage entity show -t StatesTable --partition-key AllStates --row-key WI


