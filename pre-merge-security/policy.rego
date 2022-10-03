package policy

import input

default allow = false

allow {
	plan := [res | res := input.Resources[_]; res.Type == "AWS::ApiGateway::UsagePlan"]
	limit = plan[0].Properties.Throttle.RateLimit
	limit > 10
	limit < 100
}
