# Agent Skills 统一管理规则

当用户要求安装、创建、迁移、同步、更新、审计 Agent Skills 时，必须遵守：

1. 所有通用 skills 的唯一事实来源是 `~/.agents/skills`。
2. 安装开源 skills 时，优先使用本仓库脚本：
   - macOS: `~/.agents/skills/scripts/install-skill.sh <source> --skill <name>`
   - 或用户 shell 已配置时：`askills_add <source> --skill <name>`
3. 如果用户只给 skill 名称或需求，先联网检索，优先官方、可信、维护活跃来源，并先预览可安装 skills。
4. 自建 skill 时，直接写入 `~/.agents/skills/<skill-name>/SKILL.md`，不要把唯一版本写到 `~/.codex/skills`、`~/.claude/skills`、`~/.lingma/skills`。
5. 写完或装完后运行：
   - `~/.agents/skills/scripts/link-macos.sh`
   - `~/.agents/skills/scripts/check-skills.sh`
6. 不要同步整个 `~/.codex` 或 `~/.claude`，只同步 `~/.agents/skills` 或本仓库。
7. 对陌生来源、含 `scripts/`、需要读取凭据或修改系统配置的 skill，先说明风险，不要盲装。
8. 当用户说“按我的统一 skills 工作流”时，指的就是本规则。

## 语言规范

- `name`：英文、小写、连字符，例如 `code-review-helper`。
- `description`：中英双语，先中文后英文，写清楚“什么时候使用”。
- 正文：默认中文，方便用户阅读和修改。
- 命令、路径、配置字段、API 名称：保持英文原文。
