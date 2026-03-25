## Teams
| Team | Focus |
| ---- | ----- |

## Tools
| Tool   | Purpose                    | Agent access           |
| ------ | -------------------------- | ---------------------- |
| Linear | Issue and project tracking | `linear` Claude plugin |
| Slack  | Chat                       | `slack` Claude plugin  |
| GitHub | Code repository            | `gh` CLI tool          |
| Notion | Knowledge base             | `notion` Claude plugin |
| Figma  | Designs                    | `figma` Claude plugin  |

When using `gh` prefer individual bash tool calls for each repository instead of for loops or more involved commands, so that existing permissions are used instead of asking the user for permission for new bash call commands.
