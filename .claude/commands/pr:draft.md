1. check staged changes
2. create branch
3. commit staged changes into the current branch
4. create draft pull request using github cli
  - example: gh pr create --fill --title "{title}" --body "{description}" --draft
  - if .github/pull_request_template.md exists, use it as template
