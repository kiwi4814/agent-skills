---
name: gh-address-comments
description: 用于处理 GitHub PR review comments 或 review threads，先抓评论、编号整理、让用户选择处理范围，再实施修改并汇总 comment-to-change 映射。Use when addressing GitHub PR review comments and you need an organized comments-first workflow before making changes.
---

# GH Address Comments

## Goal

把 PR review comment 处理流程标准化：先收集并整理评论，再确认处理范围，最后实施修改并给出 comment-to-change mapping。

## Hard Constraints
- Always verify `gh` authentication before relying on PR data.
- Always collect and organize comments before making changes.
- Always number comments or threads in the summary.
- Always let the user choose which comments to address when scope is ambiguous.
- Always map each addressed comment to a concrete change in the final summary.
- Never start changing code before the review feedback is organized.
- Never silently address every comment if the user has not asked for all of them.
- Never finish without showing which change answered which comment.

## Workflow
1. **Verify access**
   - 确认 `gh` 可用且已登录。
   - 如果未登录，先让用户完成认证。

2. **Resolve the PR**
   - 默认找当前分支对应的 open PR。
   - 如果用户给了 PR number 或 URL，就按指定对象处理。

3. **Collect comments and threads**
   - 拉取 review comments / review threads。
   - 整理出 unresolved、high-signal、需要改代码的评论。

4. **Number and summarize**
   - 给每条 comment 或 thread 编号。
   - 每条只写 concise summary：要改什么、为什么要改、是否可能影响行为。

5. **Confirm scope**
   - 如果用户没说“全部处理”，先让用户选择要处理哪些编号。
   - 范围不清时不要直接全做。

6. **Implement changes**
   - 按已确认范围处理评论。
   - 只做和所选评论直接相关的修改。

7. **Report comment-to-change mapping**
   - 输出每条已处理评论对应了哪些改动。
   - 如有未处理项，要明确列出。

## Output Template

```markdown
## Review comments
1. ...
2. ...
3. ...

## Selected scope
- ...

## Changes made
- Comment 1 → ...
- Comment 2 → ...

## Remaining comments
- ...
```

## When NOT to use this skill
- 任务不是 GitHub PR review comment 处理。
- 用户只是想看 PR 状态或 CI 状态，不涉及 review feedback。
- 用户已经明确给出单条评论和所需变更，不需要 comment collection workflow。
