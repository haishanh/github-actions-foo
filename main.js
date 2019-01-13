'use strict';

const fs = require('fs');
const util = require('util');
const fetch = require('node-fetch');

const writeFile = util.promisify(fs.writeFile);
const readFile = util.promisify(fs.readFile);

const {
  HOME,
  GITHUB_WORKFLOW,
  GITHUB_ACTION,
  GITHUB_ACTOR,
  GITHUB_REPOSITORY,
  GITHUB_EVENT_NAME,
  GITHUB_EVENT_PATH,
  GITHUB_WORKSPACE,
  GITHUB_SHA,
  GITHUB_REF,
  GITHUB_TOKEN
} = process.env;

async function main() {
  const x = await fetch('https://httpbin.org/ip');
  const json = await x.text();
  await writeFile('ip.txt', json, 'utf8');

  console.log({
    HOME,
    GITHUB_WORKFLOW,
    GITHUB_ACTION,
    GITHUB_ACTOR,
    GITHUB_REPOSITORY,
    GITHUB_EVENT_NAME,
    GITHUB_EVENT_PATH,
    GITHUB_WORKSPACE,
    GITHUB_SHA,
    GITHUB_REF,
    GITHUB_TOKEN
  });

  const ghEventJSON = await readFile(GITHUB_EVENT_PATH, 'utf8');
  console.log(ghEventJSON);
}

main();
