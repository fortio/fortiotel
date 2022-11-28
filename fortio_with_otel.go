// Copyright 2022 Fortio Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package main

import (
	"context"
	"flag"

	"fortio.org/fortio/cli"
	"fortio.org/fortio/fhttp"
	"fortio.org/fortio/log"
	"fortio.org/fortio/periodic"
	"go.opentelemetry.io/contrib/instrumentation/net/http/httptrace/otelhttptrace"
)

// changeDefaults sets some flags to true by default instead of false.
func changeDefaults(flagNames []string) {
	for _, flagName := range flagNames {
		f := flag.Lookup(flagName)
		if f == nil {
			log.Fatalf("flag %s not found", flagName)
			continue // not reached but linter doesn't know Fatalf panics/exists
		}
		f.DefValue = "true"
		f.Value.Set("true")
	}
}

func hook(ho *fhttp.HTTPOptions, ro *periodic.RunnerOptions) {
	ho.ClientTrace = otelhttptrace.NewClientTrace(context.Background())
}

func main() {
	// Change a bunch of defaults to better ones "2.0" afforded by this being a new binary.
	changeDefaults([]string{"stdclient", "nocatchup", "uniform", "a"})
	cli.FortioMain(hook)
}
