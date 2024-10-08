#!/usr/bin/env -S deno run --allow-read --allow-write --allow-net --allow-env

import { Command } from "https://deno.land/x/cliffy/command/mod.ts";
import { sbCrypto } from "https://c3.384.dev/api/v2/page/7938Nx0w/384.esm.js"

console.log("HELLO")

await new Command()
    .name("generate.random.string.ts")
    .version("1.0.0")
    .description(`
        Generates a random alphanumeric (base62) string.
    `)
    .option("-l, --length <length:number>", "Number of random characters", { default: 32 })
    .action(async ({ length }) => {
        console.log(`Random string (length ${length}):`, sbCrypto.generateRandomString(length));
    })
    .parse(Deno.args);
