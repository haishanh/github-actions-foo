'use strict';

const fs = require('fs');
const util = require('util');
const fetch = require('node-fetch');

const writeFile = util.promisify(fs.writeFile);

async function main() {
  const x = await fetch('https://httpbin.org/ip');
  const json = await x.text();
  await writeFile('ip.txt', json, 'utf8');
}

main();
