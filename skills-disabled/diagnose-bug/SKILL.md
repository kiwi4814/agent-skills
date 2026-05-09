---
name: diagnose-bug
description: 用于诊断 bug、test failure、unexpected behavior 或 performance regression，强调先建立 feedback loop、reproduce、hypothesise、instrument，再修复。Use when diagnosing a bug, test failure, unexpected behavior, or performance regression and you need a disciplined reproduce → hypothesise → instrument → fix loop.
---

# Diagnose Bug

## Goal

把 random debugging 变成 disciplined diagnosis。先建立可重复的 feedback loop，再用证据收敛 root cause，最后补 regression verification。

## Hard Constraints
- Always build a feedback loop before proposing a fix.
- Always reproduce the reported failure before moving to hypotheses.
- Always rank at least 3 falsifiable hypotheses before testing one.
- Always instrument to distinguish hypotheses, not to log everything.
- Always verify the original repro after the fix.
- Never patch symptoms before identifying a plausible root cause.
- Never skip back to the real scenario after a minimized repro passes.
- Never treat guess-and-check as debugging.

## Workflow
1. **Build a feedback loop**
   - 优先级：failing test → CLI / HTTP repro → browser repro → throwaway harness。
   - 目标不是“差不多能看”，而是 agent 可反复运行的 pass/fail signal。
   - 如果 bug 非确定性，先提高复现率；50% flake 比 1% flake 更可调。

2. **Reproduce the bug**
   - 确认这个 loop 复现的是用户报告的问题，不是附近另一个 failure。
   - 记录具体 symptom：error、wrong output、slow timing、unexpected state。
   - 如果还不能稳定复现，不进入 fix。

3. **Rank hypotheses**
   - 列至少 3 个可证伪假设。
   - 每个假设都要写成：
     - `If X is the cause, then changing Y should ...`
   - 如果说不出 prediction，这个假设还不够 sharp。

4. **Instrument minimally**
   - 优先 breakpoint / REPL inspection，其次 targeted logs。
   - 每个 probe 必须服务于某个 hypothesis。
   - 改一个变量，看一个结果。
   - 避免 “log everything and grep later”。

5. **Create regression verification at the right seam**
   - 如果有正确 seam，把 minimized repro 变成 failing test。
   - 如果没有正确 seam，明确指出：architecture 还不支持把这个 bug 锁死。
   - 这不是跳过验证的理由，而是一个 findings。

6. **Fix the root cause**
   - 只做当前 hypothesis 支持的最小修复。
   - 不顺手重构，不 bundling unrelated cleanup。
   - 修完先跑 regression verification，再回到原始 repro loop。

7. **Close the loop**
   - 原始场景不再复现。
   - 回归验证通过。
   - 调试 instrumentation 清理干净。
   - 如果问题暴露的是 structural issue，再建议后续 architecture review。

## Output Template

```markdown
## Feedback loop
- Repro method:
- Signal:
- Determinism:

## Hypotheses
1. ...
2. ...
3. ...

## Instrumentation plan
- Hypothesis 1 → probe:
- Hypothesis 2 → probe:
- Hypothesis 3 → probe:

## Findings
- Confirmed cause:
- Rejected hypotheses:

## Fix verification
- Regression verification:
- Original repro:
- Follow-up risk:
```

## When NOT to use this skill
- 用户已经明确要求直接解释某段代码，而不是排障。
- 任务是纯设计讨论，没有 failure、bug、regression 或 unexpected behavior。
- 已经有更窄、更具体且更适合当前栈的调试 workflow。
