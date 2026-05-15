## Searching Slack

### Date filtering

The `after:YYYY-MM-DD` query modifier does NOT work reliably. Instead use the `after` and `before` **parameters** on the search tools, passing **Unix timestamps as strings**.

Example: to search the last hour, compute `$(date -u -v-1H +%s)` and pass it as the `after` parameter.


### Searching for @-mentions of the user

Use `to:me` or `to:<@U04S45X3FLN>` in the query string. This finds messages that @-mention the user, including DMs.


### Searching for @-mentions of a user group (e.g. @cloud)

Slack search has **no first-class filter for user group mentions**. Internally, group mentions are stored as `<!subteam^GROUP_ID>` in message text, but the `to:` modifier only works for individual users.

Workaround: if you know the group's subteam ID, you could search for `subteam` as a keyword, but this is unreliable. The practical approach is to read specific channels where group mentions are likely (e.g. the team channel) and scan for them.


### General tips

- Semantic search is NOT available — only keyword search
- Space-separated terms are implicitly ANDed; no boolean operators (AND/OR/NOT)
- Use `from:<@USER_ID>` to filter by author
- Use `in:#channel-name` to filter by channel
- Use `include_context: false` to reduce response size when scanning
