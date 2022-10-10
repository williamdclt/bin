#!/usr/bin/env node

function escapeRegExp(str) {
  return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&"); // $& means the whole matched string
}

String.prototype.replaceAll = function(search, replacement) {
    var target = this;
    const re = escapeRegExp(search) + "\\b"
    // const re = escapeRegExp(search)
    // console.log(re)
    return target.replace(new RegExp(re, 'g'), replacement);
};

if (process.argv.length !== 4) {
    console.log(`usage: psql-params.js <query> <params>
where <params> is of the form "$1 = '...', $2 = '...'"`)
    process.exit(1)
}

const query = process.argv[2]
const paramsStr = process.argv[3]

const params = paramsStr
    .split(',')
    .map(def => def.split(' = ').map(s=>s.trim()))
    // we got [['$1', 'value1'], ['$2', 'value2']]

// console.log(params)
let replaced = query
for (const param of params) {
    replaced = replaced.replaceAll(param[0], param[1])
}
console.log(replaced)
