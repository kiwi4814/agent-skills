# Agent Skills Hub

这是我的个人 Agent Skills 仓库，用来统一维护、沉淀、同步和演化日常使用的各类 skills。

这个仓库不是简单的“skill 收纳箱”，而是一套分层组织的能力系统：

- 有些 skill 代表我的个人开发习惯、技术偏好和维护规范。
- 有些 skill 是零散吸收的开源工具型能力，按需调用。
- 有些 skill 来自 `superpowers`，它们不是孤立单品，而是一整套开发流程方法论。
- 有些 skill 是在比较多个热门开源 skill 仓库后，按“取长补短”的思路补进来的增量能力。

目标是让 Codex、Claude Code、通义灵码等不同 Agent/IDE 工具，尽可能共享同一套方法论、同一套流程约束、同一份 skill 资产。

---

## 快速导航

- 想先理解这个仓库的 skills 是怎么组织的：看 [Skills 分层总览](#skills-分层总览)
- 想按类别找 skill：看 [四大分类详解](#四大分类详解)
- 想按任务找推荐链路：看 [常见需求应该怎么拆：skill 链路与背后的思路](#常见需求应该怎么拆skill-链路与背后的思路)
- 想理解这套体系背后的方法论：看 [这套 skill 体系的核心思想](#这套-skill-体系的核心思想)
- 想安装、创建、同步或检查：看 [快速开始：macOS](#快速开始macos) / [快速开始：Windows PowerShell](#快速开始windows-powershell)
- 想在以后新增 skill 时快速维护 README：看 [新增 skill 时的最小修改清单](#新增-skill-时的最小修改清单)

---

## 新增 skill 时的最小修改清单

以后往这个仓库里新增 skill，README 通常只需要做下面 3 步：

1. **先判断分类**
   - 个人自建 skills
   - 零散开源工具型 skills
   - `superpowers` 流程技能组
   - 新增补强 skills

2. **在对应分类表格里补一行**
   - `Skill`：skill 名称
   - `定位`：一句话说清它解决什么问题
   - `何时用`：一句话说清触发场景

3. **只在必要时改分类级“来源”说明**
   - 如果只是往已有来源类别里新增 skill，通常不用改来源说明。
   - 如果这一类引入了新的上游项目、参考仓库或新的整理来源，再补该分类的“来源”一句话即可。

### 推荐维护顺序

```text
新增 SKILL.md
→ 判断属于哪一类
→ 在该类表格补一行
→ 如有必要，更新该类来源说明
→ 如影响常见流程，再补充到“常见需求”链路
```

### 什么时候需要改“常见需求应该怎么拆”那一节

只有在新增 skill 明显改变了某条工作链路时，才需要补那一节。例如：

- 新增了一个专门处理 CI / review / debug 的 skill
- 新增了一个介于“澄清需求”和“正式设计”之间的新流程 skill
- 新增了一个会成为高频入口的 skill

如果只是新增一个低频工具型 skill，通常**不需要**去改常见流程章节。

### 推荐写法模板

```markdown
| `my-skill` | 一句话说明它的职责边界 | 当出现某类典型场景时使用 |
```

这样做的目标不是让 README 越写越长，而是让它在 skill 增长后仍然保持：

- 分类稳定
- 来源清楚
- 新增成本低
- 读者容易快速定位

---

## 仓库结构

```text
.
├── <skill-name>/SKILL.md      # 每个 skill 一个目录
├── scripts/                   # 安装、链接、检查、bootstrap 脚本
├── templates/                 # 新建 skill 模板
├── docs/                      # 使用规则、安全清单、工作流说明
├── README.md
└── .gitignore
```

---

## Skills 分层总览

目前这里的 skills 可以分成四类。理解这四类，比背具体 skill 名字更重要。

| 类别 | 定位 | 典型内容 |
| --- | --- | --- |
| 个人自建 skills | 我的个人开发习惯、维护规范、工具链约定、业务/信息获取方式 | `agent-skills-manager`、`python-dev`、`web-access` |
| 零散开源工具型 skills | 按需调用的独立工具件，不承担整套主流程 | `skill-creator`、`find-skills`、`claude-design` |
| `superpowers` 流程技能组 | 一整套软件开发流程方法论，必须整体理解 | 14 个 superpowers skills |
| 新增补强 skills | 吸收外部优秀实践后补进来的高频场景能力 | `diagnose-bug`、`grill-plan`、`zoom-out`、`gh-fix-ci`、`gh-address-comments` |

---

## 四大分类详解

### 1）个人自建 skills

这类 skill 反映的是我的个人开发习惯、维护规范、工具链约定、业务理解方式，带有明显的“个人工作流”属性。

适合什么时候优先用：

- 在维护整个 skill 体系本身时。
- 在处理 Python 项目、Agent 项目、脚本/工具工程时。
- 在需要联网调研、浏览器登录态访问、站点探索时。
- 在需要遵循我自己的 skill 管理规范时。

**来源：** 这一类以个人自建和长期维护为主；其中 `web-access` 参考并吸收自 GitHub 开源项目 [eze-is/web-access](https://github.com/eze-is/web-access)。

| Skill | 定位 | 何时用 |
| --- | --- | --- |
| `agent-skills-manager` | 统一管理整个 skill 体系，包括安装、迁移、同步、审计、规范化维护 | 当任务本身是管理、整理、安装、迁移、同步或审计 skills 时 |
| `python-dev` | Python 开发总技能，覆盖脚本、工程、类型、测试、CLI、日志、配置、打包以及 Agent/LangGraph 类项目 | 当任务涉及 Python 编写、调试、重构、评审，或需要决定 Python 工程实践时 |

---

### 2）零散开源工具型 skills

这类 skill 不是一整套开发哲学，而是一些比较独立、按需调用的“功能件”或“辅助件”。

适合什么时候优先用：

- 当任务本身就是“找 skill / 装 skill / 写 skill / 优化 skill”时。
- 当你不需要完整开发流程，只需要某个明确的能力部件时。
- 当你需要借助一个专门 skill 来提高 skill 体系建设效率时。

**来源：** 这一类主要来自零散吸收的开源 skill；其中 `skill-creator` 参考自 GitHub 项目 [riverfjs/skills 的 skill-creator](https://github.com/riverfjs/skills/blob/main/skill-creator/SKILL.md)，`web-access` 参考自 GitHub 项目 [eze-is/web-access](https://github.com/eze-is/web-access)，`claude-design` 安装自 GitHub 项目 [jiji262/claude-design-skill](https://github.com/jiji262/claude-design-skill)。

| Skill | 定位 | 何时用 |
| --- | --- | --- |
| `skill-creator` | 创建或重构 skill，本质上是一个“skill 作者工具” | 当要新建 skill、重构 skill，或提升 `SKILL.md` 质量时 |
| `find-skills` | 当现有 skill 不够用时，用来发现和安装外部 skill | 当用户在问“有没有 skill 能做 X”或需要扩展 skill 能力时 |
| `web-access` | 联网访问与浏览器能力，覆盖搜索、网页提取、CDP 浏览器操作、登录态页面访问、站点经验沉淀 | 当任务需要联网搜索、读取网页、进入浏览器交互或使用登录态访问内容时 |
| `claude-design` | 面向设计产出的专用 skill，强调把模糊创意需求落成 HTML 形式的高保真设计物，如 landing page、deck、prototype、poster、wireframe | 当用户明确要做视觉设计、UI 方案、交互原型、演示稿、品牌化页面或多种设计方向探索时 |

---

### 3）`superpowers` 开发流程技能组（14 个，必须整体看）

这 14 个 skill 不是散装的，它们共同组成了一套完整的软件开发流程约束。单看某一个 skill 会觉得只是“一个提示词”，但组合起来，它们表达的是一套完整方法论：

> 先判断该用什么 skill → 先澄清/先设计/先计划 → 再实现 → 中途调试与评审 → 完成前强制验证 → 最后收尾。

这组 skill 的核心价值不在于“多”，而在于它们共同提供了几条强约束：

- **先找对流程，再开始动作。**
- **先设计 / 先计划 / 先测试，而不是想到哪写到哪。**
- **调试靠证据，不靠猜。**
- **完成必须验证，不能嘴上说‘应该好了’。**
- **复杂任务要拆分、并行、复盘，而不是硬顶。**

如果把整个仓库比作一个团队，这 14 个 skill 就是“工程流程层”。

**来源：** 这一类整体来自 `superpowers` 方法论与配套 skill 体系，应当作为一个整体理解和使用，而不是把单个 skill 当成零散工具随意拆看。

| Skill | 定位 | 何时用 |
| --- | --- | --- |
| `using-superpowers` | 入口级约束：先判断该用哪个 skill，再开始回答或行动 | 几乎所有任务开始时，都先用它提醒自己先选流程再行动 |
| `brainstorming` | 对新需求做澄清、设计、方案比较、spec 产出 | 当任务是新功能、新项目、新流程设计，且需要先形成方案时 |
| `writing-plans` | 在需求/设计明确后，写出多步骤实施计划 | 当需求已经清楚，但还没开始正式实施时 |
| `executing-plans` | 在已有计划的前提下，按计划推进执行 | 当已经有计划，接下来要落实实施时 |
| `subagent-driven-development` | 适合在当前会话里并行推进多个相互独立的实现任务 | 当存在多个独立子任务，且希望并行推进时 |
| `dispatching-parallel-agents` | 适合把多个独立研究/分析/执行子任务并行分发给子 Agent | 当任务能拆成多个无依赖子任务时 |
| `using-git-worktrees` | 在需要隔离工作区时，用 worktree 保证环境干净、互不污染 | 当功能开发、计划执行或实验性修改需要隔离工作目录时 |
| `test-driven-development` | 所有功能开发、bugfix、行为修改都坚持测试先行 | 当要写功能、修 bug、改行为时 |
| `systematic-debugging` | 通用调试方法：先复现、再证据、再收敛，不靠拍脑袋猜 | 当出现异常行为、失败测试、疑似 bug，但还没明确根因时 |
| `requesting-code-review` | 任务完成或阶段性完成后，主动请求 code review | 当实现告一段落，需要独立 review 或第二视角校验时 |
| `receiving-code-review` | 收到 review 意见时，先评估正确性与边界，再决定是否修改 | 当 reviewer 提了建议，但不能盲目照改时 |
| `verification-before-completion` | 在宣称“完成/修好/通过”之前，必须先验证 | 当准备说“已经完成”“已经修好”“测试通过”时 |
| `finishing-a-development-branch` | 工作做完后，收尾、整理、决定 merge/PR/cleanup | 当任务结束，需要收尾集成时 |
| `writing-skills` | 用 TDD 思路去写和验证 skill 文档本身 | 当目标本身是编写、优化、测试 skill 时 |

---

### 4）近期吸收自开源项目的新补强 skills

这类 skill 是在比较多个热门 skill 仓库后，按“保留原体系主干、只吸收高价值增量”的思路加入的。

它们的价值不在于替代 superpowers，而在于补上几个原来不够显式、但实际非常常用的高频场景：

- 需求不清时怎么一问一问把范围问实。
- 用户不熟某块代码时，怎么先给系统地图而不是直接讲局部细节。
- GitHub PR 的 CI 挂了时，怎么先抓失败上下文再动代码。
- GitHub review comments 到了以后，怎么先整理评论再改，而不是边看边乱改。
- 线上 bug / 测试失败 / 回归问题，怎么用更显式的诊断链路推进。

它们是“对原主流程的补强件”，不是另起炉灶的新体系。

**来源：** 这一类主要吸收自之前调研过的两个 GitHub 开源 skill 仓库：`mattpocock/skills` 与 `ComposioHQ/awesome-codex-skills`。这里保留的是高价值补强能力，而不是完整照搬原仓库结构。

| Skill | 定位 | 何时用 |
| --- | --- | --- |
| `diagnose-bug` | 对 bug、测试失败、回归、异常行为做显式诊断，强调 feedback loop、hypothesis、instrumentation | 当已经明确是 bug / failing test / regression，需要系统诊断链路时 |
| `grill-plan` | 当需求模糊、边界不清、术语不稳时，一次问一个高杠杆问题，把任务收敛清楚 | 当需求还不值得走完整设计流程，但存在关键歧义时 |
| `zoom-out` | 用户不熟某块代码时，先给系统地图、上下游关系、调用链，再进入细节 | 当用户需要整体地图而不是局部逐行讲解时 |
| `gh-fix-ci` | 处理 GitHub PR / Actions / external CI 失败：先看 checks，再抓日志，再出 fix plan | 当 PR CI 挂了，需要先定位失败上下文和证据时 |
| `gh-address-comments` | 处理 GitHub review comments：先抓评论、编号归纳、确定范围，再落实修改并回填映射 | 当要系统处理 GitHub PR review comments / threads 时 |

---

## 核心约定

统一事实来源：

```text
~/.agents/skills
```

工具入口：

```text
~/.codex/skills   -> 通过软链接读取本仓库中的 skills
~/.claude/skills  -> 通过软链接读取本仓库中的 skills
~/.lingma/skills  -> 通过软链接读取本仓库中的 skills
```

为什么还要软链接？因为“支持 `.agents/skills`”通常指项目级目录，不等于每个工具都会自动读取用户级 `~/.agents/skills`。软链接是兼容层，不是重复维护。

---

## 这套 skill 体系的核心思想

如果只看 skill 名字，很容易把它们理解成一堆零散提示词；但真正高价值的地方在于，这些 skill 共同表达了一套稳定的工程思维。

### 1）先选流程，再做动作

很多 Agent 出问题，不是能力不够，而是一开始就走错流程：

- 需求还没澄清，就开始实现。
- bug 还没复现，就开始猜测修复方案。
- review comment 还没整理，就开始随手改代码。
- CI 失败还没定位，就开始盲改。

这套 skill 体系的第一原则就是：

> 先判断当前属于哪一类问题，再进入对应流程。

也就是说，先决定“现在该怎么工作”，再决定“具体做什么”。

### 2）把复杂任务拆成阶段，而不是把所有能力揉成一句 prompt

一个成熟的开发过程通常会自然分成几个阶段：

- 理解问题
- 澄清边界
- 设计方案
- 规划步骤
- 编码实现
- 调试修复
- 评审反馈
- 验证收尾

这套 skill 体系不是试图用一个超级 prompt 包住所有阶段，而是把每一段单独显式化。

这样做的好处：

- 触发更准
- 边界更清楚
- 更容易维护
- 更容易替换某一段流程而不影响整套体系

### 3）证据优先，而不是感觉优先

在 debug、修 bug、看日志、处理 CI、处理 review 时，这点尤其重要。

这里反复强调的不是“聪明猜测”，而是：

- 先拿到可重复的现象
- 先拿到可靠的上下文
- 先区分假设
- 先验证原始问题是否真的解决

也就是：

> 不靠“我觉得”，而靠“我验证过”。

### 4）把高频薄场景做成轻 skill，把重流程保留为重 skill

这也是现在这份仓库的一个组织原则：

- `brainstorming`、`writing-plans`、`test-driven-development` 这类是重流程 skill。
- `zoom-out`、`grill-plan`、`gh-fix-ci`、`gh-address-comments` 这类是高频薄场景 skill。

重流程 skill 决定主线方法论；轻 skill 解决局部场景摩擦。

---

## 常见需求应该怎么拆：skill 链路与背后的思路

下面这些不是“死规定”，而是这套 skill 体系推荐的典型工作链路。真正的重点不是背顺序，而是理解每一步为什么存在。

---

### 场景一：我要做一个新功能 / 新需求

这是最常见也最容易一上来就做错的场景。

很多失败都来自于：

- 还没真正搞清楚需求，就开始写代码。
- 没有设计阶段，导致中途大改。
- 没有计划阶段，导致实现顺序混乱。
- 没有测试先行，导致最后一堆回归问题。

推荐链路：

```text
using-superpowers
→ brainstorming
→ writing-plans
→ test-driven-development
→ executing-plans / subagent-driven-development
→ requesting-code-review
→ verification-before-completion
→ finishing-a-development-branch
```

#### 每一步在干什么

**1. `using-superpowers`**
先提醒 Agent：别直接动手，先判断该走什么流程。

**2. `brainstorming`**
如果这是一个真正的新需求，先做设计澄清：

- 目标是什么
- 成功标准是什么
- 有哪些约束
- 有哪几种方案
- 推荐哪种
- 是否需要 spec

这一步解决的是“我们到底要做什么”。

**3. `writing-plans`**
设计清楚后，开始把任务拆成可执行步骤：

- 先改哪一层
- 哪些步骤有依赖关系
- 哪些可以并行
- 每一步怎么验证

这一步解决的是“我们按什么顺序做”。

**4. `test-driven-development`**
真正开始写代码前，先写 failing test，确认它真的测到了新行为。

这一步解决的是“我们如何确保实现的是正确行为，而不是自我感觉良好”。

**5. `executing-plans` / `subagent-driven-development`**
开始实施。

- 如果任务主线比较集中，按 `executing-plans` 推进即可。
- 如果有多个独立子任务，可以用 `subagent-driven-development` 并行处理。

**6. `requesting-code-review`**
功能完成后，不要直接宣布收工，先请求 review。

**7. `verification-before-completion`**
所有功能、测试、命令输出都必须经过验证，不能只说“应该没问题”。

**8. `finishing-a-development-branch`**
最后决定怎么收尾：合并、提 PR、整理分支、清理工作区等。

#### 这条链路背后的核心思想

- **设计和实现必须分层。**
- **计划和编码必须分层。**
- **编码和验证必须分层。**
- **完成感不能替代完成事实。**

---

### 场景二：需求不清，但还没到写完整设计文档的程度

有些任务并不是“大项目设计”，但也绝对不能直接动手，因为歧义太大。

典型表现：

- 用户说法很短，可能有多种理解。
- 术语含糊，边界不清。
- 成功标准不明确。
- 不同实现路径会导致不同 scope。

推荐链路：

```text
using-superpowers
→ grill-plan
→ （必要时再进入 brainstorming 或 writing-plans）
→ test-driven-development
→ 实施
```

#### 为什么这里不一定直接上 `brainstorming`

`brainstorming` 是完整设计流程，适合真正需要形成 spec 的任务。

但很多时候，你只是需要先问对一个问题，例如：

- 这里的“导出”是 CSV、Excel，还是 API payload？
- 这个“删除”是软删还是硬删？
- 这里的“支持多用户”是同时在线，还是多租户？

这时 `grill-plan` 更合适，因为它强调：

- 一次只问一个最高杠杆的问题。
- 先查代码和文档，再问用户。
- 先把 ambiguity 消掉，再考虑实现。

#### 核心思想

- 不是所有不清晰需求都值得进入完整 spec 流程。
- 但只要存在会改变实现结果的歧义，就不能跳过澄清。
- `grill-plan` 解决的是“轻量但关键的需求收敛”。

---

### 场景三：我接手了一段不熟的代码，想先看懂它

很多时候用户并不是要你马上改代码，而是先想理解某块模块、某条调用链、某个子系统的角色。

如果这时一上来就 line-by-line 解释，很容易把人带进细节黑洞。

推荐链路：

```text
using-superpowers
→ zoom-out
→ （必要时再进入 systematic-debugging / brainstorming / implementation）
```

#### `zoom-out` 主要解决什么问题

它先回答这几个高层问题：

- 这块代码在系统里做什么？
- 谁调用它？
- 它依赖谁？
- 它的输入输出是什么？
- 它为什么存在？
- 理解它时最值得先看的几个文件/模块是什么？

然后才进入局部细节。

#### 为什么这很重要

因为很多“看不懂代码”并不是细节理解能力不够，而是：

- 没有整体地图
- 不知道上下游是谁
- 不知道关键状态在哪变化
- 不知道哪几个函数才是真正核心

#### 核心思想

- 先有地图，再看街道。
- 先有系统角色，再看实现分支。
- 先知道“为什么存在”，再看“怎么实现”。

---

### 场景四：出现 bug / 测试失败 / 异常行为，我要 debug

这是另一个高频场景，而且最容易被“经验主义”带偏。

常见错误动作：

- 看到报错就猜修法。
- 一边加日志一边乱试。
- 没复现清楚就改代码。
- 修完一个表象，就说问题解决了。

这里有两条常用链路，取决于问题的性质。

#### 链路 A：通用调试

```text
using-superpowers
→ systematic-debugging
→ test-driven-development（如果最终要修 bug）
→ verification-before-completion
```

适合：

- 还不确定是不是 bug
- 现象比较杂
- 需要先搞清楚系统为什么这样

`systematic-debugging` 更偏通用调试纪律：

- 先复现
- 先收集证据
- 缩小范围
- 区分现象与原因
- 用实验验证猜想

#### 链路 B：显式 bug 诊断

```text
using-superpowers
→ diagnose-bug
→ test-driven-development
→ verification-before-completion
```

适合：

- 已经明确是 bug / failing test / regression
- 需要快速但严谨地建立诊断链路
- 需要明确列出假设并通过 instrumentation 排除

`diagnose-bug` 更强调：

- 建立 feedback loop
- reproduce 原始问题
- 至少列出多个 falsifiable hypotheses
- 用 instrumentation 区分这些假设
- 修完后回到原始问题验证

#### 为什么要有两条链路

因为并不是所有异常都已经足够明确到可以叫“bug”。

- `systematic-debugging` 更宽、更基础。
- `diagnose-bug` 更窄、更显式、更偏诊断流程。

#### 最重要的理念

无论走哪条链路，都要坚持：

- **先复现，再修。**
- **先证据，再结论。**
- **先验证原问题解决，再说完成。**

---

### 场景五：我要修 bug，而不是只分析 bug

一旦从“调试”进入“修复”，流程就必须切到 TDD 语境。

推荐链路：

```text
systematic-debugging / diagnose-bug
→ test-driven-development
→ verification-before-completion
```

#### 为什么调试完不能直接改

因为“我已经知道怎么修了”不等于“我已经安全地修好了”。

真正稳妥的做法是：

1. 先把 bug 写成 failing test。
2. 看它确实因为当前问题而失败。
3. 再写最小代码让它通过。
4. 最后再验证原始复现路径和相关测试。

#### 这一步的价值

- 把一次性修复变成可重复验证。
- 防止将来回归。
- 避免“修了一个地方，坏了另一个地方”。

---

### 场景六：CI 挂了，我要看日志、找原因、修掉它

CI failure 是一个特别容易误判的场景，因为日志很多、噪音很多，而且经常带有“看起来像根因，其实只是后果”的迷惑性。

推荐链路：

```text
using-superpowers
→ gh-fix-ci
→ （必要时进入 diagnose-bug / systematic-debugging）
→ test-driven-development
→ verification-before-completion
```

#### `gh-fix-ci` 为什么有独立价值

因为 CI 问题不仅仅是一个“bug”，它首先是一个“平台上下文问题”。你得先知道：

- 是哪个 PR
- 哪个 check 挂了
- 是 GitHub Actions 还是外部 CI
- 最关键的失败片段是什么
- 证据够不够
- 当前初步判断是什么

然后才能决定下一步是否进入代码层诊断。

#### 看日志时的思路

正确顺序通常是：

1. 先定位失败的 check。
2. 再区分 provider（Actions / external CI）。
3. 再抓最有解释力的错误片段。
4. 再判断它是根因、传播错误，还是环境噪音。
5. 再决定要不要进入 `diagnose-bug` 或 `systematic-debugging`。

#### 核心思想

- CI 失败不等于马上改代码。
- 日志很多不等于证据充分。
- 要先把“失败上下文”讲清楚，再谈修法。

---

### 场景七：PR 收到了 review comments，我要处理评论

这个场景和“普通 code review”不完全一样，因为这里不仅有技术判断，还有 GitHub review thread 的组织问题。

推荐链路：

```text
using-superpowers
→ gh-address-comments
→ （必要时 receiving-code-review）
→ test-driven-development
→ verification-before-completion
```

#### 两个 skill 在这里怎么分工

**`gh-address-comments`** 负责流程组织：

- 先抓 PR review comments / threads
- 编号整理
- 归纳每条评论在要求什么
- 让用户选择处理范围（如果不是全部）
- 改完后输出 comment-to-change mapping

**`receiving-code-review`** 负责技术判断：

- reviewer 说得是否成立
- 是否存在误解
- 修改建议是否会引入副作用
- 是否应该部分采纳、全部采纳，还是反驳

#### 为什么不能边看边改

因为 PR comments 往往有这些风险：

- 多条评论指向的是同一个根问题
- 有些评论只是表象，不是最优修改点
- 有些评论之间会互相影响
- 用户未必想全部照单全收

#### 核心思想

- 先整理评论，再改代码。
- 先明确范围，再投入实现。
- 最后必须把“哪条评论对应了哪处修改”讲清楚。

---

### 场景八：需求已经清楚，我只想高质量地推进实施

这时最重要的不是再反复讨论需求，而是确保执行顺序、验证点和并行策略合理。

推荐链路：

```text
writing-plans
→ executing-plans / subagent-driven-development
→ requesting-code-review
→ verification-before-completion
→ finishing-a-development-branch
```

#### 怎么选 `executing-plans` 和 `subagent-driven-development`

- 如果任务步骤强依赖、需要串行推进，用 `executing-plans`。
- 如果多个子任务相互独立、能并行推进，用 `subagent-driven-development`。
- 如果只是研究/搜索类并行，可配合 `dispatching-parallel-agents`。

#### 核心思想

- 计划不是摆设，而是执行约束。
- 并行不是越多越好，而是只在独立任务上并行。
- 阶段性完成也要 review 和 verify，不能只在最后统一补救。

---

### 场景九：我要写 skill、改 skill、维护 skill 体系

这个仓库本身就是一个产品，所以 skill 维护也有自己的工作链路。

推荐链路：

```text
agent-skills-manager
→ skill-creator / writing-skills
→ find-skills（如需外部补充）
→ verification-before-completion
```

#### 分工理解

- `agent-skills-manager`：管体系、管安装、管链接、管同步、管规范。
- `skill-creator`：管“怎么把一个 workflow 写成高质量 skill”。
- `writing-skills`：管“怎么用 TDD 思路测试一个 skill 是否真的有用”。
- `find-skills`：当现有能力不够时，去发现可安装 skill。

#### 核心思想

- skill 不是写完就算完，而是要能长期维护、可发现、可复用。
- skill 体系的质量，取决于边界清晰度、触发准确性和流程可执行性。

---

## 如何理解这些 skill 之间的关系

如果想用一句话概括这套体系，可以这样理解：

- **个人自建 skills** 定义“我的工作习惯和基础能力边界”。
- **开源工具型 skills** 提供“按需取用的专用工具”。
- **superpowers** 定义“主开发流程”。
- **新增补强 skills** 解决“主流程里高频但原先不够显式的局部场景”。

也可以把它理解成四层：

```text
第 1 层：工具入口与使用约束
  using-superpowers / agent-skills-manager

第 2 层：需求理解与任务组织
  brainstorming / grill-plan / writing-plans / zoom-out

第 3 层：实现、调试、评审
  test-driven-development / systematic-debugging / diagnose-bug /
  gh-fix-ci / gh-address-comments / requesting-code-review / receiving-code-review

第 4 层：验证与收尾
  verification-before-completion / finishing-a-development-branch
```

这样看会更清楚：不是 skill 多，而是每层都在解决不同的问题。

---

## 快速开始：macOS

### 1. 克隆仓库

```bash
git clone git@github.com:kiwi4814/agent-skills.git ~/.agents/skills
```

### 2. 链接到各工具

```bash
~/.agents/skills/scripts/link-macos.sh
```

### 3. 写入 Codex / Claude 全局规则

```bash
~/.agents/skills/scripts/bootstrap-agent-rules.sh
```

通义灵码的全局规则入口随 IDE 版本不同，脚本会生成：

```text
~/.agents/skills/docs/lingma-global-rules-to-paste.md
```

把这个文件内容粘贴到 Lingma 的全局规则 / 自定义指令 / 用户偏好里。

### 4. 检查

```bash
~/.agents/skills/scripts/check-skills.sh
```

---

## 快速开始：Windows PowerShell

```powershell
git clone git@github.com:kiwi4814/agent-skills.git $HOME\.agents\skills
powershell -ExecutionPolicy Bypass -File $HOME\.agents\skills\scripts\link-windows.ps1
```

如果 Windows 不允许创建 SymbolicLink，请打开 Developer Mode，或用管理员 PowerShell。脚本会自动 fallback 到 Junction。

---

## 安装开源 Skill

先预览：

```bash
npx -y skills add <repo-or-url> --list
```

安装并链接：

```bash
~/.agents/skills/scripts/install-skill.sh <repo-or-url> --skill <skill-name>
```

示例：

```bash
~/.agents/skills/scripts/install-skill.sh vercel-labs/agent-skills --skill frontend-design
```

---

## 创建自定义 Skill

```bash
name=my-skill-name
mkdir -p "$HOME/.agents/skills/$name"
cp "$HOME/.agents/skills/templates/SKILL.md" "$HOME/.agents/skills/$name/SKILL.md"
$EDITOR "$HOME/.agents/skills/$name/SKILL.md"
$HOME/.agents/skills/scripts/link-macos.sh
$HOME/.agents/skills/scripts/check-skills.sh
```

语言规范：

- `name`：英文小写加连字符，例如 `python-dev`。
- `description`：中英双语，先中文后英文，写清楚触发条件。
- 正文：中文优先，方便长期维护。
- 命令、路径、API、配置字段：保持英文原文。

---

## 给 Agent 的常驻规则

详见：

```text
docs/agent-global-rules.md
```

建议写入：

- Codex: `~/.codex/AGENTS.md`
- Claude Code: `~/.claude/CLAUDE.md`
- 通义灵码：全局规则 / 自定义指令 / 项目规则

可以直接运行：

```bash
~/.agents/skills/scripts/bootstrap-agent-rules.sh
```

---

## 安全原则

详见：

```text
docs/security.md
```

简要规则：

- 可信来源、纯文档 skill 可以自动安装。
- 陌生来源、含脚本、要改系统配置时必须先审查。
- 任何读取或上传密钥、cookie、token 的 skill 都不要安装。

---

## 常用命令

```bash
# 链接到 Codex / Claude / Lingma
~/.agents/skills/scripts/link-macos.sh

# 检查三个工具能否看到 skills
~/.agents/skills/scripts/check-skills.sh

# 安装开源 skill
~/.agents/skills/scripts/install-skill.sh <repo-or-url> --skill <skill-name>

# 写入全局 Agent 规则
~/.agents/skills/scripts/bootstrap-agent-rules.sh

# 提交同步
git -C ~/.agents/skills add .
git -C ~/.agents/skills commit -m "Update agent skills"
git -C ~/.agents/skills push
```

---

## 贡献和分享建议

如果要把某个 skill 分享给别人，至少保证：

1. 有清晰的 `description`，说明什么时候用、什么时候不用。
2. 正文流程可执行，不依赖当前聊天上下文。
3. 如果有脚本，写清楚用途、参数和风险。
4. 不包含个人密钥、公司内部地址、私有 token、敏感日志。
5. 用 `scripts/check-skills.sh` 检查本地可见性。

---

## License

个人仓库默认保留所有权利。若要公开分享，建议后续补充 MIT / Apache-2.0 等开源许可证。



# 相关链接

[obra/superpowers](https://github.com/obra/superpowers)：主用，superpowers

[skills/skill-creator](https://github.com/riverfjs/skills/blob/main/skill-creator/SKILL.md)：优化过的skill-crator，[作者](https://linux.do/t/topic/2059258)

[eze-is/web-access](https://github.com/eze-is/web-access)：给 Claude Code 装上完整联网能力的 skill：三层通道调度 + 浏览器 CDP + 并行分治

[ComposioHQ/awesome-codex-skills](https://github.com/ComposioHQ/awesome-codex-skills)：Codex的工具包

[mattpocock/skills](https://github.com/mattpocock/skills)：mattpocock的工作流分享
