package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTemplateFile(t *testing.T) {
	options := &terraform.Options{
		TerraformDir: "..",
		Vars: map[string]interface{}{
			"name": "Terraform",
		},
	}
	defer terraform.Destroy(t, options)
	terraform.InitAndApply(t, options)
	expected := "Hello, Terraform!"
	actual := terraform.Output(t, options, "message")
	assert.Equal(t, expected, actual)
}
