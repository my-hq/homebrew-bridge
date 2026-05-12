cask "bridge" do
  version "0.4.1"
  sha256 "12d64b276052128cf1dc7faad6308b6f1d07ab329b6123c385fd6c5c6c0d832e"

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
