---
name: python-dev
description: 当任务涉及 Python 代码编写、修改、解释、调试、重构、评审，或涉及 Python 项目结构、依赖、类型、测试、CLI、日志、打包、配置，以及 LangChain/LangGraph 类 Agent 开发时使用。 Use when the task involves writing, modifying, explaining, debugging, refactoring, or reviewing Python code, or deciding Python project structure, dependencies, typing, testing, CLI, logging, packaging, configuration, or LangChain/LangGraph-style agent development.
---

# Python Dev

## Overview
用于通用 Python 开发任务，覆盖脚本、小工具、库、服务，以及 LangChain / LangGraph 一类 Agent 项目。

核心原则：**先判断任务形态，遵循现有栈，用最小改动完成目标，并给出可验证结果。**

## When to Use
当任务以 Python 代码或 Python 工程决策为中心时，使用本 skill，典型包括：

- 编写、修改、解释、调试、重构、评审 Python 代码
- 处理项目结构、依赖、打包、配置、类型、测试、CLI、日志
- 编写脚本、自动化工具、命令行程序
- 处理 LangChain、LangGraph、tool-calling、工作流编排相关项目
- 判断某个 Python 方案该不该用、怎么落地、如何兼容现有栈

## Hard Constraints
- Always identify the task shape first: script, tool, library, service, agent project, or explanation task.
- Always follow the existing project stack and conventions before recommending newer tools or patterns.
- Always prefer the smallest complete change that solves the user's request.
- Always make Python version compatibility explicit before using version-sensitive syntax, stdlib features, or tooling.
- Always keep secrets, credentials, tokens, and machine-specific paths out of source code.
- Always use the project's existing structured configuration when it already exists; `pyproject.toml` is the default modern center when applicable.
- Always add or update verification when behavior changes, or provide a concrete manual verification path if tests are not the right fit.
- Never force a migration to a preferred tool when the current stack is already coherent.
- Never turn single-file script practices into hard rules for larger Python projects.
- Never add speculative abstractions, optionality, or framework layers the task does not require.

## Quick Reference

| 场景 | 先看什么 | 默认建议 |
|---|---|---|
| 单文件脚本 | 能跑、少依赖、别硬编码 | 标准库优先，显式入口，必要时 `uv` + PEP 723 |
| CLI / 小工具 | 命令面、校验、运行示例 | 边界校验，业务逻辑与 CLI 分离 |
| 库 / 包 | 公共接口、类型、元数据 | 明确 API 边界，`pyproject.toml`，库内不乱配 logging |
| 应用 / 服务 | 结构、配置、可观测性、测试 | 跟随现有结构，配置外置，日志与验证一起补 |
| Agent / 工作流 | state、tools、orchestration、trace | prompts / tools / state / domain logic 分离 |
| 解释 / 顾问 | 结论、原因、权衡 | 先给结论，再讲取舍和替代方案 |

## Workflow
1. **判断任务形态**  
   先分清是单文件脚本、CLI / 小工具、库 / 包、应用 / 服务、Agent / 工作流项目，还是解释 / 评审 / 架构讨论。

2. **检查现有上下文**  
   看 Python 版本、依赖管理、目录结构、测试体系、lint / format / type-check 工具，以及已有约定。现有栈自洽时，优先顺着它做。

3. **选择工作模式**  
   - 要写或改代码：执行模式  
   - 要问概念或取舍：顾问模式

4. **套用场景指导**  
   按任务形态应用下面的场景原则，不把所有 Python 习惯混在一起套。

5. **采用稳定的现代实践**  
   优先推荐现代类型标注、结构化配置、自动化格式化 / 静态检查 / 测试、清晰依赖边界；`uv`、`ruff`、`pytest`、`mypy`、`pyright`、`Click`、`Typer`、`Rich`、`Pydantic` 属于推荐项，不是强制项。

6. **给出验证结果**  
   改行为就补测试或给验证路径；写脚本就给运行方式；改 CLI 就给关键命令示例；面向终端用户的脚本或 CLI，在相关时同时给 macOS 和 Windows 用法。

7. **完成即停止**  
   达到用户要求就收手，不顺手做无关重构、迁移或架构升级。

## Implementation Guidance

### 单文件脚本
- 标准库优先，只有在正确性、维护性或体验明显受益时再加依赖。
- 保留显式入口：`if __name__ == "__main__":`。
- 配置走常量、环境变量或参数，不要写死路径、URL、账号或凭证。
- 需要自包含分发时，可考虑 `uv` 和 PEP 723。
- 交付时给运行方式；相关时同时给 macOS 和 Windows 示例。

### CLI / 小工具
- 先设计命令接口，再接实现。
- 参数解析、输入校验、交互提示放在 CLI 边界层。
- 业务逻辑与 CLI 框架代码分开。
- 命令面稍复杂时，可优先考虑声明式 CLI 库；项目已有方案时优先跟随。

### 库 / 包
- 显式控制公开接口，避免无意扩大 API surface。
- 适用时，把元数据、Python 版本约束、依赖、入口点收敛到 `pyproject.toml`。
- 使用模块级 logger，不在库代码里配置全局应用日志。

### 应用 / 服务
- 先遵循现有项目结构，不凭空新增层级。
- 配置外置，环境相关行为单独隔离。
- 使用日志提供运行可观测性，避免把敏感信息写进代码或日志。
- 把测试、观测点和必要失败处理当成实现的一部分。

### Agent / 工作流项目
- 把 prompts、orchestration、tools、state、domain logic 分离。
- 模型名、endpoint、API key、运行参数全部配置化。
- 用结构化状态对象承载中间数据，便于调试、追踪和测试。
- 用日志、trace、checkpoint 或其他钩子让执行链路可检查。
- 使用 LangChain / LangGraph 时，优先小而可组合的节点 / 步骤，而不是巨大的单体 chain。

### 通用横切实践
- 在兼容项目 Python 版本的前提下，优先使用现代类型标注。
- 项目使用 `pyproject.toml` 时，把工具配置尽量收敛进去。
- 优先自动化格式化、静态检查、测试、类型检查，但没有理由时不要强制迁移工具链。
- `dataclass`、`TypedDict`、`Enum`、`Protocol`、`Pydantic` 按问题形态选，不靠习惯乱用。
- 持久运行信号、排障信息、关键状态优先用 `logging`，不要长期依赖零散 `print()`。
- 保持依赖边界清晰，小问题不要无理由引入重量级依赖。

## Output Template

### 代码实现类任务
- 先简述准备改什么。
- 给出最小必要改动。
- 说明验证方式。
- 如果是脚本或 CLI，在相关时补 macOS / Windows 运行示例。

### 解释 / 顾问类任务
- 先回答结论。
- 再讲原因与主要权衡。
- 如有合理替代方案，给 1-2 个可选方向。

### 脚本 / CLI 运行说明模板
```text
macOS:
1. ...
2. ...

Windows:
1. ...
2. ...
```

## Common Mistakes
- 不看项目现状就硬推 `uv`、`ruff`、`pytest`、`Typer` 等偏好工具。
- 把脚本惯例强行套到库、服务或大型工程上。
- 没确认 Python 版本就直接使用新语法、新标准库能力或新工具链。
- 把配置、路径、token、endpoint 写死在代码里。
- CLI、业务逻辑、配置逻辑搅在一起。
- Agent 项目里把 prompt、state、tools、业务逻辑全部塞进一个大文件或一个大 chain。
- 改了行为却不给测试或验证路径。

## When NOT to use this skill
- 任务不是 Python 相关。
- 任务重点是某个更窄、更强约束的专门工作流，已有更合适的 skill 可直接处理，例如纯 Claude API / Anthropic SDK 工程应优先使用 `claude-api`。
- 用户只是在做与 Python 无关的通用文案、产品、设计或前端工作。
- 用户明确要求遵循某个项目内更具体的 Python 工作流，而那个工作流与本 skill 冲突。
