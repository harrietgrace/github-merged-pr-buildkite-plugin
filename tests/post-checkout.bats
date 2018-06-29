#!/usr/bin/env bats

load '/usr/local/lib/bats/load.bash'

post_checkout_hook="$PWD/hooks/post-checkout"

@test "Does nothing if no PR number set" {
  export BUILDKITE_PULL_REQUEST=""

  run "$post_checkout_hook"

  assert_success
  assert_output --partial "--- :pipeline: starting a standard branch build"
}

@test "Does nothing if PR is false" {
  export BUILDKITE_PULL_REQUEST="false"

  run "$post_checkout_hook"

  assert_success
  assert_output --partial "--- :pipeline: starting a standard branch build"
}
