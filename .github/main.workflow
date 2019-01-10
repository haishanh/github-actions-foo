workflow "Foo workflow" {
  on = "push"
  resolves = ["Test"]
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
