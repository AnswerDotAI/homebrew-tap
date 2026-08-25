# AnswerDotAI Homebrew Tap

Add and trust AnswerDotAI's tap once, then install packages by their short names:

```bash
brew tap AnswerDotAI/tap
brew trust --tap AnswerDotAI/tap
brew install fbz
```

In a `Brewfile`:

```ruby
tap "AnswerDotAI/tap", trusted: true
brew "fbz"
```

See [fbz](https://github.com/AnswerDotAI/fbz) for usage and documentation.

## Maintainers

The daily `brew bump` workflow opens fbz version-update PRs and `brew test-bot` builds their bottles. A green same-repository PR created by `github-actions[bot]`, whose sole change is `Formula/fbz.rb`, is automatically sent to `brew pr-pull` for publication. These restrictions prevent an ordinary pull request from entering the privileged publishing workflow.

For a manually created or retried formula PR, publish it with:

```bash
bin/publish-pr PR_NUMBER
```

The script waits for the PR checks, binds publication to the exact reviewed head commit, runs the same `brew pr-pull` publisher, and updates the local `main` checkout.
