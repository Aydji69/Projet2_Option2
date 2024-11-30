package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestKubModule(t *testing.T) {
	terraformOptions := &terraform.Options{
		TerraformDir: "../kub-module",
		Vars: map[string]interface{}{
			"region":         "us-east-1",
			"cluster_name":   "test-cluster",
			"cluster_version": "1.24",
			"subnets":        []string{"subnet-123456", "subnet-789012"},
			"vpc_id":         "vpc-123456",
			"node_count":     2,
			"node_min":       1,
			"node_max":       3,
			"instance_type":  "t3.medium",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)

	clusterName := terraform.Output(t, terraformOptions, "cluster_name")
	clusterID := terraform.Output(t, terraformOptions, "cluster_id")

	assert.NotEmpty(t, clusterName)
	assert.NotEmpty(t, clusterID)
}