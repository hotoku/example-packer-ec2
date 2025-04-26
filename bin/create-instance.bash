#!/bin/bash -ex

aws ec2 run-instances \
  --image-id "ami-014ff9dd161ad7ae6" \
  --instance-type "c3.2xlarge" \
  --key-name "HFT" \
  --block-device-mappings '{"DeviceName":"/dev/sda1","Ebs":{"Encrypted":false,"DeleteOnTermination":true,"Iops":3000,"SnapshotId":"snap-0bfcd48f0061769cf","VolumeSize":200,"VolumeType":"gp3","Throughput":125}}' \
  --network-interfaces '{"AssociatePublicIpAddress":true,"DeviceIndex":0,"Groups":["sg-02551386a99d9b334"]}' \
  --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"temp-001"}]}' \
  --private-dns-name-options '{"HostnameType":"ip-name","EnableResourceNameDnsARecord":true,"EnableResourceNameDnsAAAARecord":false}' \
  --count "1" \
  --region "ap-northeast-1"
