## External tools
| Tool   | Purpose                    | Updates                                             | Agent access           |
| ------ | -------------------------- | --------------------------------------------------- | ---------------------- |
| Linear | Issue and project tracking | assigned issues                                     | `linear` Claude plugin |
| Slack  | Chat                       | channel activity, @mentions                         | `slack` Claude plugin  |
| GitHub | Code repository            | own PRs in draft/review, others' PRs needing review | `gh` CLI tool          |
| Notion | Knowledge base             |                                                     | `notion` Claude plugin |
| Figma  | Designs                    |                                                     | `figma` Claude plugin  |


## GitHub attachments

`gh pr create|edit --attach ./img.png` uploads a local image or video into the body, and `gh issue` and `gh ... comment` take it too. A body reference like `![alt](./img.png)` is rewritten to the uploaded asset. GitHub.com only, needs gh 2.103+.
