import assert from "node:assert/strict";
import { existsSync, readFileSync } from "node:fs";
import { join } from "node:path";
import test from "node:test";

const root = process.cwd();
const explicit = ["value-boardroom", "value-stress-test", "value-board-summary"];
const reusable = ["value-grilling", "value-roleplay", "value-research", "value-cashflow"];
const references = ["operating-roles.md", "industry-adaptation.md", "evidence-ledger.md"];
const skill = (name) => {
  const path = join(root, "skills", name, "SKILL.md");
  assert.ok(existsSync(path), `Missing ${path}`);
  return readFileSync(path, "utf8");
};

test("the complete skill set has standard frontmatter", () => {
  for (const name of [...explicit, ...reusable]) {
    assert.match(skill(name), /^---\nname: [a-z0-9-]+\ndescription: .+\n---/m);
  }
});

test("entry skills cannot be auto-invoked", () => {
  for (const name of explicit) assert.match(skill(name), /disable-model-invocation: true/);
});

test("shared references are present and linked", () => {
  for (const name of references) assert.ok(existsSync(join(root, "references", name)));
  assert.match(skill("value-boardroom"), /references\/operating-roles\.md/);
  assert.match(skill("value-boardroom"), /references\/evidence-ledger\.md/);
  assert.match(skill("value-cashflow"), /references\/industry-adaptation\.md/);
});

test("research, questioning, and safety contracts are explicit", () => {
  assert.match(skill("value-research"), /do not invent/i);
  assert.match(skill("value-grilling"), /one question at a time/i);
  assert.match(skill("value-board-summary"), /not.*investment recommendation/i);
});
