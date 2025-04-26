#!/bin/bash -ex


aws ec2 run-instances \
    --image-id "ami-0d0fe35156f0eba04" \
    --instance-type "c3.2xlarge" \
    --key-name "HFT" \
    --block-device-mappings '{"DeviceName":"/dev/sda1","Ebs":{"Encrypted":false,"DeleteOnTermination":true,"Iops":3000,"VolumeSize":200,"VolumeType":"gp3","Throughput":125}}' \
    --network-interfaces '{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-02551386a99d9b334"]}' \
    --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"temp-001"}]}' \
    --private-dns-name-options '{"HostnameType":"ip-name","EnableResourceNameDnsARecord":true,"EnableResourceNameDnsAAAARecord":false}' \
    --count "1" \
    --region "ap-northeast-1"
