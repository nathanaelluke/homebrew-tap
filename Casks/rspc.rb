cask "rspc" do
  version "0.1.0"

  on_macos do
    sha256 "c2a3adf2fe62aaeed25011d4f47f36101e3325d575529813006f69d7f42049ff"

    url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.0/rspc-#{version}-aarch64-apple-darwin.tar.gz"

    depends_on arch: :arm64
    depends_on macos: :ventura
  end
  on_linux do
    on_arm do
      sha256 "6456d42b3a8401104cb6b85ff0805b7ce120dd3cdbad7f3cd2f5cc4fe794af31"
      url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.0/rspc-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "d394625c29cb8813c7a1853d0bcf5b47e69ee1fd89c409215c04c00489dd648a"
      url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.0/rspc-#{version}-x86_64-unknown-linux-gnu.tar.gz"
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
