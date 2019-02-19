workflow "Foo workflow" {
  on = "push"
  resolves = ["Deploy"]
}

action "Install" {
  uses = "docker://node:alpine"
  runs = "yarn"
  args = "install"
}

action "Test" {
  uses = "docker://node:alpine"
  needs = ["Install"]
  runs = "yarn"
  args = "test"
}

action "Build" {
  uses = "docker://node:alpine"
  needs = ["Test"]
  runs = "yarn"
  args = "build"
}

action "Deploy" {
  # uses = "haishanh/github-actions-foo/actions/gh-pages@master"
  uses = "./actions/gh-pages"
  needs = ["Build"]
  secrets = ["TOKEN"]
}
