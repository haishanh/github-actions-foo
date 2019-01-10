workflow "Foo workflow" {
  on = "push"
  resolves = ["Build"]
}

action "Install" {
  uses = "docker://node:8.9-alpine"
  runs = "yarn"
  args = "install"
}

action "Lint" {
  uses = "docker://node:8.9-alpine"
  needs = ["Install"]
  runs = "yarn"
  args = "lint"
}

action "Build" {
  uses = "docker://node:8.9-alpine"
  needs = ["Lint"]
  runs = "yarn"
  args = "build"
}
