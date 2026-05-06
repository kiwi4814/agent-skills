---
name: zoom-out
description: 用于用户不熟某段代码、某个模块或某片区域时，先给出更高层的模块地图、调用关系和上下游背景，再进入细节。Use when the user needs broader context for unfamiliar code and wants a high-level map before diving into local implementation details.
---

# Zoom Out

## Goal

先给 high-level map，再讲局部实现。帮助用户快速建立“这块代码在系统里处于什么位置、和谁交互、为什么存在”的认识。

## Hard Constraints
- Always explain the broader context before local details.
- Always identify relevant modules, callers, and dependencies.
- Always describe how the area fits into the surrounding system.
- Always use the project’s own vocabulary when possible.
- Never start with line-by-line explanation if the user asked for the big picture.
- Never isolate a file from the flow that makes it meaningful.

## Workflow
1. **Locate the area of interest**
   - 明确用户问的是 file、module、feature flow，还是一整片 subsystem。

2. **Map the surrounding system**
   - 找相关模块、主要 callers、主要 dependencies、关键 data flow。
   - 先回答“它在整体里做什么”，再回答“它具体怎么做”。

3. **Summarize the flow**
   - 用 3-6 个点说清：入口、核心职责、上下游、关键状态变化、输出。

4. **Zoom in only after the map exists**
   - 如果需要，再解释局部文件、关键函数、重要 branches。
   - 细节应该服务于整体理解，而不是替代整体理解。

## Output Template

```markdown
## Big picture
- ...

## Relevant modules
- Module A:
- Module B:
- Module C:

## Flow
1. ...
2. ...
3. ...

## Why this area matters
- ...

## Local detail to notice
- ...
```

## When NOT to use this skill
- 用户明确只要某个局部实现细节或某一行报错原因。
- 任务本质是修 bug、写代码或处理 review comment，而不是建立整体理解。
