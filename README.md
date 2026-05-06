# Agent Skills Hub

这是一个个人 Agent Skills 统一管理仓库，用来集中维护并分享可复用的 AI Agent Skills。

目标：

- 开源 skills 只安装一次。
- 自建 skills 只创建一次。
- Codex、Claude Code、通义灵码等工具通过统一目录或软链接读取同一份内容。
- Mac 和 Windows 可以通过 GitHub 同步。
- 所有自建 skill 正文默认中文，`description` 建议中英双语。

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

## 当前 Skills

| Skill | Description |
| --- | --- |
| `agent-skills-manager` | 当用户要求安装、创建、迁移、同步、更新、审计或管理 Codex、Claude Code、通义灵码的 Agent Skills 时使用；also use when the user asks to install, create, migrate, sync, update, audit, or manage Agent Skills, or says “按我的统一 skills 工作流”. |
| `brainstorming` | You MUST use this before any creative work - creating features, building components, adding functionality, or modifying behavior. Explores user intent, requirements and design before implementation. |
| `dispatching-parallel-agents` | Use when facing 2+ independent tasks that can be worked on without shared state or sequential dependencies |
| `executing-plans` | Use when you have a written implementation plan to execute in a separate session with review checkpoints |
| `find-skills` | Helps users discover and install agent skills when they ask questions like "how do I do X", "find a skill for X", "is there a skill that can...", or express interest in extending capabilities. This skill should be used when the user is looking for functionality that might exist as an installable skill. |
| `finishing-a-development-branch` | Use when implementation is complete, all tests pass, and you need to decide how to integrate the work - guides completion of development work by presenting structured options for merge, PR, or cleanup |
| `python-dev` | 当任务涉及 Python 代码编写、修改、解释、调试、重构、评审，或涉及 Python 项目结构、依赖、类型、测试、CLI、日志、打包、配置，以及 LangChain/LangGraph 类 Agent 开发时使用。 Use when the task involves writing, modifying, explaining, debugging, refactoring, or reviewing Python code, or deciding Python project structure, dependencies, typing, testing, CLI, logging, packaging, configuration, or LangChain/LangGraph-style agent development. |
| `receiving-code-review` | Use when receiving code review feedback, before implementing suggestions, especially if feedback seems unclear or technically questionable - requires technical rigor and verification, not performative agreement or blind implementation |
| `requesting-code-review` | Use when completing tasks, implementing major features, or before merging to verify work meets requirements |
| `skill-creator` | Create or update reusable agent skills. Use when the user asks to build a new skill, refactor repeated workflows into a skill, or improve skill structure and SKILL.md quality. |
| `subagent-driven-development` | Use when executing implementation plans with independent tasks in the current session |
| `systematic-debugging` | Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes |
| `test-driven-development` | Use when implementing any feature or bugfix, before writing implementation code |
| `using-git-worktrees` | Use when starting feature work that needs isolation from current workspace or before executing implementation plans - ensures an isolated workspace exists via native tools or git worktree fallback |
| `using-superpowers` | Use when starting any conversation - establishes how to find and use skills, requiring Skill tool invocation before ANY response including clarifying questions |
| `verification-before-completion` | Use when about to claim work is complete, fixed, or passing, before committing or creating PRs - requires running verification commands and confirming output before making any success claims; evidence before assertions always |
| `web-access` | （无描述） |
| `writing-plans` | Use when you have a spec or requirements for a multi-step task, before touching code |
| `writing-skills` | Use when creating new skills, editing existing skills, or verifying skills work before deployment |

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
