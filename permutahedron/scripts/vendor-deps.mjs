import { cp, mkdir, rm } from "node:fs/promises";
import { dirname, join, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const scriptDir = dirname(fileURLToPath(import.meta.url));
const projectDir = resolve(scriptDir, "..");
const vendorDir = join(projectDir, "vendor");
const nodeModulesDir = join(projectDir, "node_modules");

async function copyFile(source, target) {
  await mkdir(dirname(target), { recursive: true });
  await cp(source, target);
}

await rm(vendorDir, { recursive: true, force: true });

await copyFile(
  join(nodeModulesDir, "three", "build", "three.module.js"),
  join(vendorDir, "three", "three.module.js")
);
await copyFile(
  join(nodeModulesDir, "three", "examples", "jsm", "controls", "TrackballControls.js"),
  join(vendorDir, "three", "addons", "controls", "TrackballControls.js")
);
await copyFile(
  join(nodeModulesDir, "three", "LICENSE"),
  join(vendorDir, "three", "LICENSE")
);

await copyFile(
  join(nodeModulesDir, "katex", "dist", "katex.mjs"),
  join(vendorDir, "katex", "katex.mjs")
);
await copyFile(
  join(nodeModulesDir, "katex", "dist", "katex.min.css"),
  join(vendorDir, "katex", "katex.min.css")
);
await cp(
  join(nodeModulesDir, "katex", "dist", "fonts"),
  join(vendorDir, "katex", "fonts"),
  { recursive: true }
);
await copyFile(
  join(nodeModulesDir, "katex", "LICENSE"),
  join(vendorDir, "katex", "LICENSE")
);
