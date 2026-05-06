---
name: gh-fix-ci
description: 用于排查 GitHub PR 的 CI 或 GitHub Actions 失败，先抓 failing checks 和关键日志，输出失败摘要与 fix plan，经确认后再实施。Use when a GitHub PR has failing CI or GitHub Actions checks and you need a summary-first, plan-first workflow before making changes.
---

# GH Fix CI

## Goal

把“CI 挂了，去看看”为标准化 workflow：先定位 failing checks，再抓 actionable log context，再输出 fix plan，最后才进入实现。

## Hard Constraints
- Always verify `gh` authentication before relying on GitHub CLI output.
- Always summarize failing checks before proposing changes.
- Always distinguish GitHub Actions from external CI providers.
- Always produce a fix plan before implementation.
- Always keep external CI investigation scoped to status and details URL unless the user expands scope.
- Never jump straight into code changes from a failing check name alone.
- Never treat incomplete logs as enough evidence.
- Never blur failure summary and implementation into one step.

## Workflow
1. **Verify access**
   - 确认 `gh` 可用且已登录。
   - 如果未登录，先让用户完成认证。

2. **Resolve the PR**
   - 默认看当前 branch 对应 PR。
   - 如果用户提供 PR number 或 URL，优先用用户指定对象。

3. **Inspect failing checks**
   - 拉取 failing checks。
   - 识别哪些是 GitHub Actions，哪些是 external checks。
   - external checks 只记录状态和 details URL。

4. **Fetch actionable log context**
   - 对 GitHub Actions，读取最相关的 failure snippet。
   - 优先抓真正说明 cause 的片段，而不是整段噪音日志。
   - 如果日志不完整，明确指出 evidence 不足。

5. **Summarize failure context**
   - 输出：check name、status、关键错误片段、当前判断。
   - 让用户先看到“出了什么问题”。

6. **Create a fix plan**
   - 在改代码前先给 concise fix plan。
   - 说明 scope、验证方式、风险点。

7. **Implement after approval**
   - 用户确认后再改。
   - 修改后建议本地验证，并重新检查相关 checks。

## Output Template

```markdown
## Failing checks
- Check:
  - Type:
  - Status:
  - Evidence:
  - Details URL:

## Failure summary
- ...

## Fix plan
1. ...
2. ...
3. ...

## Verification
- Local validation:
- PR recheck:
```

## When NOT to use this skill
- 任务不是 GitHub PR / GitHub Actions 相关 CI 问题。
- 用户只是想了解某个 workflow 文件做什么，而不是排查失败。
- 当前问题已经明确定位在本地测试失败，且不需要 GitHub checks context。
