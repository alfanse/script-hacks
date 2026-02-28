# Claude code

Dashboard: https://platform.claude.com/dashboard


## Install CLI
install claude via npm
```
sudo apt install nodejs npm -y
sudo npm install -g @anthropic-ai/claude-code
```
install claude directly
```
curl -fsSL https://claude.ai/install.sh | bash

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```

## Install Intellij plugin - Claude Code by Anthropic
Find it in plugins, install it.

## Essential Commands

`claude: start` a new session in the current directory.

`/init`: Create a CLAUDE.md file to give the AI context about your project.

`/compact`: Compact context size during long sessions.

`/usage`: check your rate limits

`/stats`: usages statistics in github style graph

`/clear`: clear conversation and start fresh

`/mcp`: manage Model Context protocol servers

`claude --help` : View available commands. 

`claude doctor`


## tips
https://www.reddit.com/r/ClaudeAI/comments/1qgccgs/25_claude_code_tips_from_11_months_of_intense_use/






2026-2-21
alfanse@alfanse-A5XT:~$ claude doctor

 Diagnostics                  
 └ Currently running: native (2.1.42)
 └ Path: /home/alfanse/.local/share/claude/versions/2.1.42
 └ Invoked: /home/alfanse/.local/share/claude/versions/2.1.42
 └ Config install method: native
 └ Search: OK (bundled)

 Updates
 └ Auto-updates: enabled
 └ Auto-update channel: latest
 └ Stable version: 2.1.39
 └ Latest version: 2.1.50
                          
 Version Locks            
 └ Cleaned 1 stale lock(s)
 └ No active version locks
