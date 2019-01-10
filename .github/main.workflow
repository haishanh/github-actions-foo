workflow "Foo workflow" {
  on = "push"
  resolves = ["Build"]
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
