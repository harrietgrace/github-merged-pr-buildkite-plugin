# Git Pull Request Plugin

A [Buildkite plugin](https://buildkite.com/docs/agent/v3/plugins) to build the merged state of GitHub pull requests.

Why would I want this?

1. Parity with other CI setups. Including [TeamCity](https://blog.jetbrains.com/teamcity/2013/02/automatically-building-pull-requests-from-github-with-teamcity/), Travis, and [Jenkins](https://wiki.jenkins.io/display/JENKINS/GitHub+pull+request+builder+plugin).
2. Can help avoid building stale branches, as CI is done against the target branch at the time of the PR being raised rather than when the source branch was created
3. Reduce the risk of failed builds from reaching master, due to bad merges (See the example at the bottom of this document)

While this approach doesn't mitigate breaking changes made to the target branch branch *after* the PR is raised, it does help reduce the [time] window in which bad merges can appear -- the thinking being the age of a PR is clearly visible on GitHub unlike the age of the parent commit for a PR branch.

## Example

Ensure `Skip pull request builds for existing commits` is set to `false` in your Pipeline settings, as BuildKite will build the branch and skip the PR build.

![pr-settings](./buildkite-pr-settings.png)

```yml
steps:
  - label: 'Make something'
    commands:
      - make something
    plugins:
      gugahoi/git-merged-pr#v0.0.1: ~
```

## Tests

To run the tests of this plugin, run

```sh
docker-compose run --rm tests
```

## License

MIT (see [LICENSE](LICENSE))
