cask "bridge" do
  version "0.4.0"
  sha256 "5c4f88210ecda174e0a418872e5b7bbec2777d8660daef8e98963f4d88356f91"

  # Artifact lives here, on the tap repo (this repo), not on the private
  # source repo my-hq/bridge. The release workflow over there uploads
  # zips to this repo's GitHub Releases.
  url "https://github.com/my-hq/homebrew-bridge/releases/download/v#{version}/Bridge-v#{version}.zip"
  name "Bridge"
  desc "Native API client for .bru collections"
  homepage "https://github.com/my-hq/bridge"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Bridge.app"

  postflight do
    # Strip the quarantine attribute since Bridge is ad-hoc signed, not
    # notarized. Targets the specific app path — never use a wildcard.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Bridge.app"]
  end

  zap trash: [
    "~/Library/Application Support/apiclient",
    "~/Library/Preferences/com.bridge.app.plist",
  ]
end
