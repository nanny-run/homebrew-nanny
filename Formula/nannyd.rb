# Homebrew formula for the Nanny CLI.
#
# This file lives at homebrew/nannyd.rb in the nanny repo for source tracking.
# For the tap to work, copy it to the Formula/ directory of the
# nanny-run/homebrew-nanny GitHub repository:
#
#   https://github.com/nanny-run/homebrew-nanny/blob/main/Formula/nannyd.rb
#
# After tagging v0.1.0, update the sha256 values using:
#   curl -fsSL <url> | shasum -a 256
#   NOTE: SHA256 values are updated automatically by CI, no manual steps required.

class Nannyd < Formula
  desc "Execution boundary for autonomous AI agents"
  homepage "https://nanny.run"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-arm64.tar.gz"
      sha256 "1299f7ef3150a8fb7f4e6edb17b97183e182c62107ac7b41e4d2d780add7402d"
    end

    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-macos-x86_64.tar.gz"
      sha256 "b9106db0b027b000e95a3b926f463d5590d2faa4d1c4fbdb15cb5a5b965ee003"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/nanny-run/nanny/releases/download/v#{version}/nanny-linux-x86_64.tar.gz"
      sha256 "419652d7d95f2ca4d2dc862264fcaa1eb7f21caa3ca6ba1e17cad512141c9d0c"
    end
  end

  def install
    bin.install "nanny"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nanny --version")
  end
end
