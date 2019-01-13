workflow "Foo workflow" {
  on = "push"
  resolves = ["Deploy"]
}

action "Install" {
  uses = "docker://node:8.9-alpine"
  runs = "yarn"
  args = "install"
}

action "Test" {
  uses = "docker://node:8.9-alpine"
  needs = ["Install"]
  runs = "yarn"
  args = "test"
}

action "Build" {
  uses = "docker://node:8.9-alpine"
  needs = ["Test"]
  runs = "yarn"
  args = "build"
}

action "Deploy" {
  uses = "./actions/gh-pages@master"
  needs = ["Build"]
  secrets = ["GITHUB_TOKEN"]
}
