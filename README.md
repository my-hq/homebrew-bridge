# my-hq/homebrew-bridge

Homebrew tap for [Bridge](https://github.com/my-hq/bridge).

````bash
brew tap my-hq/bridge
brew install --cask myhq-bridge
````

Upgrade with `brew upgrade --cask myhq-bridge`. The cask strips macOS
quarantine on install so Bridge launches without Gatekeeper warnings.

When a new version ships, Bridge itself shows an in-app banner with an
**Update via Homebrew** button — clicking it opens Terminal.app with the
upgrade command pre-typed. A **Copy command** fallback is there for users
on iTerm / Warp / etc.

## Why is the cask called `myhq-bridge` and not just `bridge`?

The official `homebrew/cask` tap already has a cask named `bridge` (a
discontinued Adobe / Epic Games thing). When two taps both ship `bridge`,
`brew install --cask bridge` won't reliably pick ours. Prefixing with the
org name (`myhq-bridge`) gives this cask a clean namespace, so the install
command always resolves here.

## Why is the tap `my-hq/bridge` but the repo is `my-hq/homebrew-bridge`?

Homebrew's tap naming convention. `brew tap <user>/<name>` auto-resolves
to `github.com/<user>/homebrew-<name>` — the `homebrew-` prefix is added
by `brew`, not typed by the user. Same pattern as `brew tap homebrew/cask`
→ `Homebrew/homebrew-cask`. It's why this repo *must* be named
`homebrew-bridge` for the short `brew tap my-hq/bridge` command to work.

## How this works with the private Bridge repo

The Bridge source lives in the **private** [`my-hq/bridge`](https://github.com/my-hq/bridge)
repo. Its GitHub Releases are not publicly readable (both API and download
URLs return 404 for unauthenticated callers). So the **release artifacts
themselves live here**, on this public tap repo. The release workflow over
in the source repo builds the universal macOS binary, uploads the zip to
this repo's GitHub Releases, and bumps `Casks/myhq-bridge.rb` to point at
it — all in one CI run, gated by a fine-grained PAT scoped to this repo.

So `brew install --cask myhq-bridge` fetches from this repo's Releases —
no auth needed, no access to private source. Source stays private;
binaries are shared via this tap.
