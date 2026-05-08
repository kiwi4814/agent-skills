# Skills 精简审计：非 Superpowers 增量技能

> 审计日期：2026-05-08  
> 口径：`superpowers` 系列保持不动；只评估其余增量技能是否应常驻、冷备或按需恢复。  
> 说明：用户口头提到“其他 9 个”，但按 `.skill-lock.json` 与当前 `skills/` 目录核对，严格非 `obra/superpowers` 来源共有 11 个。`diagnose-bug` 与 `grill-plan` 虽然是流程类、风格接近 Superpowers，但来源不是 Superpowers，因此本次也纳入审计，避免漏判。

## 保护范围：Superpowers 全部不动

以下技能视为一整套开发方法论，不单独拆删：

- `using-superpowers`
- `brainstorming`
- `dispatching-parallel-agents`
- `executing-plans`
- `finishing-a-development-branch`
- `receiving-code-review`
- `requesting-code-review`
- `subagent-driven-development`
- `systematic-debugging`
- `test-driven-development`
- `using-git-worktrees`
- `verification-before-completion`
- `writing-plans`
- `writing-skills`

判断原则：Superpowers 负责“怎么做软件工程”：澄清、计划、TDD、调试、评审、验证、分支收尾与子代理协作。非 Superpowers 技能只有在提供明确增量能力时才值得常驻。

## 总体结论

建议第一批冷备：

1. `claude-design`
2. `diagnose-bug`
3. `grill-plan`

可按使用频率决定是否冷备：

4. `gh-address-comments`

建议保留：

- `agent-skills-manager`
- `find-skills`
- `gh-fix-ci`
- `python-dev`
- `skill-creator`
- `web-access`
- `zoom-out`

如果执行第一批冷备，常驻技能数从 25 降到 22；如果再冷备 `gh-address-comments`，降到 21。这个数量更适合 Java/Python 为主、前端低频的工作方式。

## 逐项审计

### 1. `agent-skills-manager`

- **定位**：统一管理 Codex、Claude Code、通义灵码等工具的 Agent Skills；约定 `~/.agents/skills` 是唯一事实来源，并处理安装、迁移、同步、审计。
- **与 Superpowers 的关系**：Superpowers 关心“如何使用技能完成开发任务”；它关心“技能资产本身如何统一管理”。不与 `writing-skills` 重复。
- **增量价值**：高。当前仓库本身就是个人 skills hub，这个技能是维护入口。
- **建议**：保留。

### 2. `claude-design`

- **定位**：为 landing page、slide、wireframe、prototype、poster、UI exploration 等生成 HTML 设计产物。
- **与 Superpowers 的关系**：可能与 `brainstorming` 在“设计前澄清”上有交集，但它偏视觉/交互产出，不是通用开发流程。
- **增量价值**：对前端/视觉任务高；对 Java/Python 后端主线低。
- **风险**：低频常驻会扩大触发面，让非设计任务被带向视觉原型流程。
- **建议**：冷备。需要做 UI 原型、演示稿、视觉探索时再恢复。

### 3. `diagnose-bug`

- **定位**：针对 bug、test failure、unexpected behavior、performance regression，强调 feedback loop、reproduce、hypotheses、instrument、fix。
- **与 Superpowers 的关系**：与 `systematic-debugging` 高度重叠。两者都要求先找 root cause，避免随机修复。
- **增量价值**：中等。它的中文硬约束和“三个假设”更显式，但核心纪律已由 `systematic-debugging` 覆盖。
- **风险**：同时常驻两个调试纪律技能，容易让触发和流程冗余。
- **建议**：冷备。默认保留 Superpowers 的 `systematic-debugging` 作为唯一调试纪律入口。

### 4. `find-skills`

- **定位**：在用户询问“有没有 skill 能做 X”或需要扩展能力时，搜索、筛选、推荐外部技能。
- **与 Superpowers 的关系**：Superpowers 提供已有流程；它负责发现新技能。与 `writing-skills` / `skill-creator` 不是同一阶段。
- **增量价值**：中高。当前仍在筛选和优化 skills，短期高频。
- **风险**：长期稳定后低频，但触发语比较明确。
- **建议**：保留。等技能体系稳定几个月后，如不再频繁找新技能，可转冷备。

### 5. `gh-address-comments`

- **定位**：处理 GitHub PR review comments / review threads：先收集评论、编号整理、确认处理范围，再实施修改并输出 comment-to-change 映射。
- **与 Superpowers 的关系**：与 `receiving-code-review` 有交集，但更偏 GitHub CLI 与 PR 线程处理。Superpowers 管“如何理性接受 review”；它管“如何系统处理 GitHub 评论”。
- **增量价值**：取决于 PR review 频率。团队协作频繁时价值高；本地个人开发时价值低。
- **风险**：需要 `gh` 登录和远程 PR 上下文；低频常驻收益有限。
- **建议**：条件保留。若每周都处理 PR review comments，保留；否则冷备。

### 6. `gh-fix-ci`

- **定位**：排查 GitHub PR CI / GitHub Actions 失败：定位 failing checks、抓关键日志、区分 Actions 与外部 CI、先出 fix plan 再改代码。
- **与 Superpowers 的关系**：与 `systematic-debugging` 有诊断理念重叠，但它补足 GitHub CI 的信息获取路径。
- **增量价值**：中高。CI 失败排查常见且日志噪声大，专用流程能节省时间。
- **风险**：依赖 `gh` 登录；外部 CI 可能需要额外权限。
- **建议**：保留。如果你几乎不用 GitHub Actions/PR checks，再转冷备。

### 7. `grill-plan`

- **定位**：需求模糊、范围不清、多解释时，一次问一个高杠杆问题，先澄清目标、边界、术语和成功标准。
- **与 Superpowers 的关系**：与 `brainstorming`、`writing-plans` 重叠。Superpowers 已经覆盖需求澄清与计划产出。
- **增量价值**：中等。它更适合“强制一问一答”的访谈模式。
- **风险**：当前 AGENTS.md 强调自动推进，`grill-plan` 容易增加追问摩擦；与 `brainstorming` 并存时流程边界不清。
- **建议**：冷备。默认用 Superpowers 的 `brainstorming` / `writing-plans`。

### 8. `python-dev`

- **定位**：Python 代码编写、修改、调试、重构、评审，以及项目结构、依赖、类型、测试、CLI、日志、打包、配置、LangChain/LangGraph Agent 开发。
- **与 Superpowers 的关系**：Superpowers 管工程流程；`python-dev` 提供语言和生态约束。它不会替代 TDD、调试或验证，而是让这些流程落到 Python 语境。
- **增量价值**：高。用户主力语言之一是 Python。
- **风险**：低。触发条件明确，且与主工作高度匹配。
- **建议**：保留。

### 9. `skill-creator`

- **定位**：创建或更新可复用 Agent Skills，强调结构化 SKILL.md、Hard Constraints、Workflow、Output Template、stop condition、脚本确定性。
- **与 Superpowers 的关系**：与 `writing-skills` 部分重叠但互补。`writing-skills` 是“用 TDD 验证 skill 是否真能约束 agent”；`skill-creator` 是“快速、规范、结构化地落地 skill”。
- **增量价值**：高。当前仓库就是 skills 维护仓库，且需要统一风格。
- **风险**：两个 skill 都可能在“创建 skill”时触发；但用途分层清楚后可共存。
- **建议**：保留。严谨纪律型 skill 用 `writing-skills`，普通结构化创建用 `skill-creator`。

### 10. `web-access`

- **定位**：联网搜索、网页抓取、登录态页面、CDP 浏览器交互、动态页面读取。
- **与 Superpowers 的关系**：Superpowers 没有等价联网/浏览器操作能力。
- **增量价值**：高。需要当前信息、网页证据、官方文档、动态页面时不可替代。
- **风险**：CDP 登录态操作有账号/隐私风险，但技能内部已有安全提醒和边界说明。
- **建议**：保留。

### 11. `zoom-out`

- **定位**：用户不熟悉某段代码/模块时，先给模块地图、调用关系、上下游背景，再进入细节。
- **与 Superpowers 的关系**：可作为 `brainstorming`、`writing-plans`、`systematic-debugging` 之前的理解层；Superpowers 没有同等明确的“先讲系统地图”技能。
- **增量价值**：高。对 Java/Python 后端大项目、遗留代码、框架封装理解很有用。
- **风险**：低。触发语明确，且偏解释/分析，不会干扰实现流程。
- **建议**：保留。

## 建议执行方案

### 第一批冷备

```powershell
New-Item -ItemType Directory -Force C:\Users\m4814\.agents\skills-disabled

Move-Item C:\Users\m4814\.agents\skills\claude-design C:\Users\m4814\.agents\skills-disabled\
Move-Item C:\Users\m4814\.agents\skills\diagnose-bug C:\Users\m4814\.agents\skills-disabled\
Move-Item C:\Users\m4814\.agents\skills\grill-plan C:\Users\m4814\.agents\skills-disabled\
```

### 可选第二批

如果你很少处理 GitHub PR review comments：

```powershell
Move-Item C:\Users\m4814\.agents\skills\gh-address-comments C:\Users\m4814\.agents\skills-disabled\
```

### 不建议删除的非 Superpowers

```text
agent-skills-manager
find-skills
gh-fix-ci
python-dev
skill-creator
web-access
zoom-out
```

## 判断规则

以后新增或删除技能时，可按下面四条判断：

1. **Superpowers 流程层不拆。** 除非整体替换方法论，否则不要单独删其中某个。
2. **语言/生态专项按主力技术保留。** Java/Python 主力技能优先于前端/设计技能。
3. **工具型技能看不可替代性。** 联网、GitHub CI、skills 管理这种有明确工具链的技能更值得常驻。
4. **与 Superpowers 重叠的流程技能要谨慎。** 如果只是换一种方式做澄清、调试、计划、验证，优先使用 Superpowers，外部同类技能冷备。
