package test

import (
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/retry"
	"github.com/gruntwork-io/terratest/modules/ssh"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

const (
	Region = "us-east-1"
)

func TestAllowSsh(t *testing.T) {
	imageID := aws.GetAmazonLinuxAmi(t, Region)
	keyPair := aws.CreateAndImportEC2KeyPair(t, Region, random.UniqueId())
	vpc := aws.GetDefaultVpc(t, Region)
	subnet := aws.GetSubnetsForVpc(t, vpc.Id, Region)[0]
	defer aws.DeleteEC2KeyPair(t, keyPair)
	options := &terraform.Options{
		EnvVars: map[string]string{
			"AWS_DEFAULT_REGION": Region,
		},
		TerraformDir: "..",
		Vars: map[string]interface{}{
			"allow_ssh":                   true,
			"associate_public_ip_address": true,
			"image_id":                    imageID,
			"instance_type":               "t2.micro",
			"key_name":                    keyPair.Name,
			"subnet_id":                   subnet.Id,
			"vpc_id":                      vpc.Id,
		},
	}
	defer terraform.Destroy(t, options)
	terraform.InitAndApply(t, options)
	userProfile := ssh.Host{
		Hostname:    terraform.Output(t, options, "public_dns_name"),
		SshKeyPair:  keyPair.KeyPair,
		SshUserName: "ec2-user",
	}
	maxAttempts := 60
	retry.DoWithRetry(t, "Connect Using SSH", maxAttempts, time.Second, func() (string, error) {
		if err := ssh.CheckSshConnectionE(t, userProfile); err != nil {
			return "", err
		}
		return "", nil
	})
}
