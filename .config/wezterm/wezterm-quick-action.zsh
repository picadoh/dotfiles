# Open Automator
# Create "Quick Action"
# Workflow receives "folders" in "Finder"
# Add "Run Shell Script" with the contents of this file
# Shell: /bin/zsh
# Pass input: as arguments
# Save

for f in "$@"
do
  /usr/local/bin/wezterm start --cwd "$f"
done
