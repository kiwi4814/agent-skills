---
name: grill-plan
description: 用于需求模糊、范围不清、可能有多种解释的任务，先通过一问一答澄清目标、边界、术语和成功标准，再进入实现。Use when a request is ambiguous, underspecified, or has multiple valid interpretations and you need a one-question-at-a-time grilling loop before implementation.
---

# Grill Plan

## Goal

先消除 ambiguity，再进入设计或实现。通过 high-leverage questions、术语澄清和冲突检查，把 vague request 收敛成可执行目标。

## Hard Constraints
- Always ask one key question at a time.
- Always prefer the highest-leverage ambiguity first.
- Always check the codebase or docs before asking something the project can answer.
- Always call out conflicts between user statements and current code or docs.
- Always establish a success criterion before implementation.
- Never ask a batch of loosely related questions in one turn.
- Never move into implementation while the task still has multiple plausible interpretations.
- Never hide an assumption that could change scope or behavior.

## Workflow
1. **Decide whether grilling is needed**
   - 适用于：需求模糊、边界不清、术语重载、存在多种合理实现路径。
   - 如果 request 已经足够具体，就不要为了流程而过度追问。

2. **Resolve the highest-leverage ambiguity first**
   - 优先问会影响 scope、interface、behavior 或 success criteria 的问题。
   - 多个问题都能问时，先问“答了之后最能减少错误实现概率”的那个。

3. **Prefer evidence over questioning**
   - 如果代码、配置、现有文档能回答，先查再问。
   - 问题应该聚焦“项目里查不到，但会决定做法”的部分。

4. **Sharpen language**
   - 用户用了 fuzzy term，就提出更 precise wording。
   - 用户说法与代码/文档冲突，就直接指出冲突并求证。
   - 不替用户 silently choose an interpretation。

5. **Converge on success criteria**
   - 收敛出：目标、边界、关键行为、明确的 done definition。
   - 在这些清楚之前，不进入 implementation。

6. **Hand off cleanly**
   - 如果已经达成共识，输出 concise summary：
     - What we are doing
     - What is in scope
     - What is out of scope
     - What success looks like

## Output Template

```markdown
## Current ambiguity
- ...

## Question
- ...

## Why this matters
- ...

## Working understanding so far
- Goal:
- In scope:
- Out of scope:
- Success criterion:
```

## When NOT to use this skill
- 用户只是问一个事实性问题，且代码或文档可以直接回答。
- 用户已经给出了足够明确、低歧义、可直接执行的实现要求。
- 任务重点是排障或修 CI，而不是澄清需求。
