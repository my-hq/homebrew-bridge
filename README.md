# my-hq/homebrew-bridge

Homebrew tap for [Bridge](https://github.com/my-hq/bridge).

````bash
brew tap my-hq/bridge
brew install --cask bridge
````

Upgrade with `brew upgrade --cask bridge`. The tap strips macOS quarantine
on install so Bridge launches without Gatekeeper warnings.

## Wait — why is the tap `my-hq/bridge` but the repo is `my-hq/homebrew-bridge`?

Homebrew's tap naming convention. `brew tap <user>/<name>` auto-resolves
to `github.com/<user>/homebrew-<name>` — the `homebrew-` prefix is added
by `brew`, not typed by the user. Same pattern as `brew tap homebrew/cask`
→ `Homebrew/homebrew-cask`. It's why our repo *must* be named
`homebrew-bridge` for the short `brew tap my-hq/bridge` command to work.

The two "bridge" tokens are different things:
- `my-hq/bridge` in `brew tap` is the **tap name** (becomes `homebrew-bridge`).
- `bridge` in `brew install --cask bridge` is the **cask name** (matches `Casks/bridge.rb`).

We named both "bridge" so the commands look symmetric.

## How this works with the private Bridge repo

[`my-hq/bridge`](https://github.com/my-hq/bridge) (the source) is private,
but its **releases** are publicly downloadable. This tap's cask points at
those public release URLs:

```ruby
url "https://github.com/my-hq/bridge/releases/download/v#{version}/Bridge-v#{version}.zip"
```

So `brew install --cask bridge` fetches the public release artifact —
no auth, no access to private source. Source stays private; binaries
are shared via signed releases.
