cask "bridge" do
  version "0.0.0-dispatch-test"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/my-hq/bridge/releases/download/v#{version}/Bridge-v#{version}.zip"
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
