cask "rspc" do
  version "0.1.2"

  on_macos do
    sha256 "8ec9eba41ce14def5ecc80787e99a959f83b36d366ee38d2d0deacec8ade7f84"

    url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.2/rspc-#{version}-aarch64-apple-darwin.tar.gz"

    depends_on arch: :arm64
    depends_on macos: :ventura
  end
  on_linux do
    on_arm do
      sha256 "b9a43e9cdb7c858b5ae166c0933ff31ed4623042599f1321b6d0b36e0a3c05c4"
      url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.2/rspc-#{version}-aarch64-unknown-linux-gnu.tar.gz"
    end
    on_intel do
      sha256 "3c16deb63f9bcf053f754afa89850920eba538a45d3b399c094cb35a4b8571bc"
      url "https://github.com/nathanaelluke/rspc/releases/download/v0.1.2/rspc-#{version}-x86_64-unknown-linux-gnu.tar.gz"
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
