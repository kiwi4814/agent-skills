---
name: agent-skills-manager
description: 当用户要求安装、创建、迁移、同步、更新、审计或管理 Codex、Claude Code、通义灵码的 Agent Skills 时使用；also use when the user asks to install, create, migrate, sync, update, audit, or manage Agent Skills, or says “按我的统一 skills 工作流”.
---

# Agent Skills 统一管理器

## 使用场景

当用户要求安装、创建、迁移、同步、更新、审计或管理 Agent Skills 时，使用本 skill。

典型触发语：

- “帮我安装这个 skill”
- “按我的统一 skills 工作流安装”
- “把刚才的流程沉淀成 skill”
- “同步到 Codex / Claude / 通义灵码”
- “清理 / 更新 / 检查 skills”

## 唯一事实来源

所有通用 skills 必须放在：

<pre>~/.agents/skills</pre>

不要把唯一版本创建在：

- `~/.codex/skills`
- `~/.claude/skills`
- `~/.lingma/skills`

这些目录只是各工具的读取入口，可以通过软链接指向 `~/.agents/skills`。

## 安装开源 Skills

1. 如果用户提供仓库或 URL，优先先预览可安装项：

<pre>npx -y skills add &lt;source&gt; --list</pre>

2. 使用统一封装命令安装：

<pre>askills_add &lt;source&gt; --skill &lt;skill-name&gt;</pre>

3. 安装后验证：

<pre>askills_check</pre>

4. 如果工具没有立即识别，提醒用户重启对应工具或 IDE。

## 创建自定义 Skills

新 skill 必须写到：

<pre>~/.agents/skills/&lt;skill-name&gt;/SKILL.md</pre>

写完后运行：

<pre>askills_link
askills_check</pre>

## 新建 Skill 的语言规范

- `name`：英文、小写、连字符，例如 `code-review-helper`。
- `description`：中英双语，先中文后英文，写清楚“什么时候使用”。
- 正文：默认中文，方便用户阅读和修改。
- 命令、路径、配置字段、API 名称：保持英文原文。
- 如果 skill 面向英文代码库或英文工具文档，可以在关键标题后补英文。

## 安全规则

安装陌生来源前必须检查风险。以下情况必须先提醒用户，不要盲装：

- 包含 `scripts/`、shell、Python、二进制文件。
- 要读取 SSH key、token、浏览器 cookie、云凭据。
- 要修改 shell 配置、系统目录、全局 Git 配置。
- 要跳过测试、关闭安全检查、绕过权限。
- 来源不明或维护状态不明。

永远不要安装要求读取或上传密钥、含混淆代码、试图外传数据的 skill。
