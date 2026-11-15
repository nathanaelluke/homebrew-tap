cask "rspc" do
  version "0.1.1"

  on_macos do
    sha256 "f824f6a4ee23e17480b232f9173142f051dc1646731e344d7f9d4cddd19e1fc5"

    url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.1/rspc-#{version}-aarch64-apple-darwin.tar.gz"

    depends_on arch: :arm64
    depends_on macos: :ventura
  end
  on_linux do
    on_arm do
      sha256 "b6d49847045e8f1c2cffdd98b0b3fb7668bfadb60312237b009c885ecaa2dbc4"
      url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.1/rspc-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "eeac97f8b6f06f16a8213e943aa2244e02cf9de6532f5c40c6e889f0dc450230"
      url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.1/rspc-#{version}-x86_64-unknown-linux-gnu.tar.gz"
    end
  end

  name "rspc"
  desc "Terminal music player for Spotify, local files and streams"
  homepage "https://github.com/nathanaelluke/rspc"

  depends_on cask: "spotify-soloist"
  depends_on formula: "openssl@3"

  binary "rspc-#{version}/bin/rspc"
  binary "rspc-#{version}/bin/rspc-ui"

  caveats <<~EOS
    Spotify playback needs your own Soloist API key and `rspc login`.
    See https://github.com/nathanaelluke/rspc/blob/main/README.md#spotify-setup
    Refresh expiring builds with: brew upgrade --cask --greedy spotify-soloist
    Stop rspc before replacing its running player.
  EOS
end
