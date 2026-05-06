# 日常工作流

## 安装开源 skill

```bash
~/.agents/skills/scripts/install-skill.sh <repo-or-url> --skill <skill-name>
```

示例：

```bash
~/.agents/skills/scripts/install-skill.sh vercel-labs/agent-skills --skill frontend-design
```

## 创建自定义 skill

```bash
name=my-skill-name
mkdir -p "$HOME/.agents/skills/$name"
cp "$HOME/.agents/skills/templates/SKILL.md" "$HOME/.agents/skills/$name/SKILL.md"
$EDITOR "$HOME/.agents/skills/$name/SKILL.md"
$HOME/.agents/skills/scripts/link-macos.sh
$HOME/.agents/skills/scripts/check-skills.sh
```

## 同步到 GitHub

```bash
cd ~/.agents/skills
git add .
git commit -m "Update agent skills"
git push
```

## 新电脑还原

macOS:

```bash
git clone git@github.com:kiwi4814/agent-skills.git ~/.agents/skills
~/.agents/skills/scripts/link-macos.sh
~/.agents/skills/scripts/bootstrap-agent-rules.sh
```

Windows PowerShell:

```powershell
git clone git@github.com:kiwi4814/agent-skills.git $HOME\.agents\skills
powershell -ExecutionPolicy Bypass -File $HOME\.agents\skills\scripts\link-windows.ps1
```
